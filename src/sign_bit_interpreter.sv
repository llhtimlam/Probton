`timescale 1ns / 1ps

module sign_bit_interpreter (
    input  logic              clk,                 
    input  logic              rst_n,               
    input  logic              input_in,            

    // Handshake inputs from wave controller instances
    input  logic              latch_phase90,       
    input  logic              latch_phase270,      

    // Handshake feedback outputs back to wave controller instances
    output logic              latch_phase90_ack,   
    output logic              latch_phase270_ack,  

    // OUTPUT DATA RAILS
    output logic              dir_x,               
    output logic              move_en_x,           
    output logic              dir_y,               
    output logic              move_en_y            
);

    
    // DATA SYNCHRONIZATION
   
    logic [3:0] data_pipe;
    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) data_pipe <= 4'b0;
        else        data_pipe <= {data_pipe[2:0], input_in};
    end
    wire clean_input_in = data_pipe; 

    
    // STROBE SYNCHRONIZATION
    
    logic [3:0] latch90_pipe;
    logic [3:0] latch270_pipe;
    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            latch90_pipe  <= 4'b0;
            latch270_pipe <= 4'b0;
        end else begin
            latch90_pipe  <= {latch90_pipe[2:0],  latch_phase90};
            latch270_pipe <= {latch270_pipe[2:0], latch_phase270};
        end
    end
    wire delayed_latch90  = latch90_pipe;  
    wire delayed_latch270 = latch270_pipe; 

    
    // CORE PROCESSING 
    
    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            dir_x              <= 1'b0;
            move_en_x          <= 1'b0;
            dir_y              <= 1'b0;
            move_en_y          <= 1'b0;
            latch_phase90_ack  <= 1'b0;
            latch_phase270_ack <= 1'b0;
        end 
        else begin
            if (delayed_latch90) begin
                dir_x             <= clean_input_in; 
                move_en_x         <= 1'b1;            
                latch_phase90_ack <= 1'b1;            
            end else begin
                move_en_x         <= 1'b0;            
                latch_phase90_ack <= 1'b0;            
            end

            if (delayed_latch270) begin
                dir_y              <= clean_input_in; 
                move_en_y          <= 1'b1;            
                latch_phase270_ack <= 1'b1;            
            end else begin
                move_en_y          <= 1'b0;            
                latch_phase270_ack <= 1'b0;            
            end
        end
    end

endmodule