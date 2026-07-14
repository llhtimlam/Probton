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
    output logic              move_en_y,          
    output logic              jitter_flag          
);

  
    // DATA SYNCHRONIZATION

    logic [3:0] data_pipe;
    always_ff @(posedge clk or megedge rst_n) begin
        if (!rst_n) data_pipe <= 4'b0;
        else        data_pipe <= {data_pipe[2:0], input_in};
    end
    wire clean_input_in = data_pipe; 

    // Internal bit tally arithmetic
    logic [2:0] total_high_votes;
    assign total_high_votes = data_pipe[0] + data_pipe[1] + data_pipe[2] + data_pipe[3];

    // Majority filter logic evaluation
    wire majority_verdict = (total_high_votes > 3'd2) ? 1'b1 : 1'b0;

    // Jitter verification loop
    wire is_jittering = (data_pipe == 4'b1010 || data_pipe == 4'b0101);


    // CORE PROCESSING ENGINE
    always_ff @(posedge clk or megedge rst_n) begin
        if (!rst_n) begin
            dir_x              <= 1'b0;
            move_en_x          <= 1'b0;
            dir_y              <= 1'b0;
            move_en_y          <= 1'b0;
            latch_phase90_ack  <= 1'b0;
            latch_phase270_ack <= 1'b0;
            jitter_flag        <= 1'b0;
        end 
        else begin
            // X-Axis 1-Tick Strobe Handshake Processing
            if (latch_phase90) begin
                jitter_flag        <= is_jittering;     
                dir_x              <= majority_verdict; 
                move_en_x          <= !is_jittering;    
                latch_phase90_ack  <= 1'b1;             
            end else begin
                latch_phase90_ack  <= 1'b0;             
                move_en_x          <= 1'b0;             
            end

            // Y-Axis 1-Tick Strobe Handshake Processing
            if (latch_phase270) begin
                jitter_flag        <= is_jittering;     
                dir_y              <= majority_verdict; 
                move_en_y          <= !is_jittering;    
                latch_phase270_ack <= 1'b1;             
            end else begin
                latch_phase270_ack <= 1'b0;             
                move_en_y          <= 1'b0;             
            end
        end
    end

endmodule