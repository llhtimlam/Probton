`default_nettype none

module spi_regs #(
    parameter int SPI_ADDR_WIDTH = 7
)(
    input wire clk, 
    input wire rst_n,
    
    input wire spi_cs_n, 
    input wire spi_sclk,
    input wire spi_mosi, 
    output logic spi_miso,
    output logic spi_miso_oe,

    // Config Setting
    // 8 bit: Amp Ratio
    output logic [7:0]  cfg_amp_ratio,     

    // 17 bit: MEMS frequency (Max: 97.65KHz)
    output logic [16:0] cfg_f_MEMS_x,    
    output logic [16:0] cfg_f_MEMS_y,    // 17 bit: Max: 97.65KHz

    // 8 bit: MEMS phase offset (Resolution: 1/256 MEMS frequency)
    output logic [7:0]  phase0_offset,
    output logic [7:0]  phase90_offset,
    output logic [7:0]  phase270_offset,

    // State Machine
    input logic

    output logic
);

    localparam logic [SPI_ADDR_WIDTH-1:0] ADDR_AMP_SETTING = 7'h00;
    localparam logic [SPI_ADDR_WIDTH-1:0] ADDR_MEMS_FREQ_X_L = 7'h01;
    localparam logic [SPI_ADDR_WIDTH-1:0] ADDR_MEMS_FREQ_X_H = 7'h02;
    localparam logic [SPI_ADDR_WIDTH-1:0] ADDR_MEMS_FREQ_Y_L = 7'h03;
    localparam logic [SPI_ADDR_WIDTH-1:0] ADDR_MEMS_FREQ_Y_H = 7'h04;
    localparam logic [SPI_ADDR_WIDTH-1:0] ADDR_STEP_SIZE_X = 7'h05;
    localparam logic [SPI_ADDR_WIDTH-1:0] ADDR_STEP_SIZE_Y = 7'h06;
    localparam logic [SPI_ADDR_WIDTH-1:0] ADDR_TDC_AREA_X = 7'h10;
    localparam logic [SPI_ADDR_WIDTH-1:0] ADDR_TDC_AREA_Y = 7'h11;  

    localparam logic [7:0] DEFAULT_AMP_SETTING = 8'h00;
    localparam logic [7:0] DEFAULT_MEMS_FREQ_X = 16'h0000;
    localparam logic [7:0] DEFAULT_MEMS_FREQ_Y = 16'h0000;
    localparam logic [7:0] DEFAULT_SIZE_X = 8'h01;
    localparam logic [7:0] DEFAULT_SIZE_Y = 8'h01;

    logic [1:0] cs_sync, sclk_sync, mosi_sync;
    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            cs_sync <= 2'b11;
            sclk_sync <= 2'b00;
            mosi_sync <= 2'b00;
        end else begin
            cs_sync <= {cs_sync[0], spi_sc_n};
            sclk_sync <= {sclk_sync[0], spi_sclk};
            mosi_sync <= {mosi_sync[0], spi_mosi};
        end
    end
    wire cs_n_sync = cs_sync[1];
    wire sclk_sync_q = sclk_sync[1];
    wire mosi_sync_q = mosi_sync[1];

    logic sclk_d;
    always_ff @(posedge clk or negedge rst_n)
        if (!rst_n) sclk_d <= 1'b0;
        else sclk_d <= sclk_sync_q;

    wire sclk_rise = sclk_sync_q & ~sclk_d;
    wire sclk_fall = ~sclk_sync_q & sclk_d;

    typedef enum logic {ST_CMD, ST_DATA} spi_state_t;
    spi_state_t spi_state;

    logic[2:0] bit_cnt;
    logic[7:0] shift_in;
    logic [7:0] shift_out;
    logic rw_n;
    logic [SPI_ADDR_WIDTH-1:0] spi_addr;

    logic reg_wr_en;
    logic [SPI_ADDR_WIDTH-1:0] reg_wr_addr;
    logic [7:0] reg_wr_data;

    wire [7:0] shift_in_next = {shift_in[6:0], mosi_sync_q};

    always_ff @(posedge clk or negedge rst_n) begin 
        if (!rst_n) begin
            spi_state <= ST_CMD;
            bit_cnt <= 3'd0;
            shift_in <= 8'd0;
            shift_out <= 8'd0;
            rw_n <= 1'b0;
            spi_addr <= '0;
            reg_wr_en <= 1'b0;
            reg_wr_addr <= '0;
            reg_wr_data <= 8'd0;
            spi_miso <= 1'b0;
            spi_miso_oe <=1'b0;
        end else begin
            reg_wr_en <= 1'b0;
            spi_miso_oe <= ~cs_n_sync;

            if (cs_n_sync) begin
                spi_state <= ST_CMD;
                bit_cnt <= 3'd0;
            end else begin
                if (sclk_rise) begin
                    shift_in <= shift_in_next;
                    if (bit_cnt == 3'd7) begin
                        bit_cnt <= 3'd0;
                        unique case (spi_state)
                            ST_CMD: begin
                                rw_n <= shift_in_next[SPI_ADDR_WIDTH];
                                spi_addr <= shift_in_next[SPI_ADDR_WIDTH-1:0];
                                spi_state <= ST_DATA;
                            end
                            ST_DATA: begin
                                if (rw_n) begin 
                                    reg_wr_en <= 1'b1;
                                    reg_wr_addr <= spi_addr;
                                    reg_wr_data <= shift_in_next;
                                end
                                spi_addr <= spi_addr + 1'b1;
                            end
                        endcase
                    end else begin
                        bit_cnt <= bit_cnt + 1'b1;
                    end
                end

                if (sclk_fall) begin
                    if (spi_state == ST_DATA && bit_cnt == 3'd0)
                        shift_out <= reg_rd_data;
                    else
                        shift_out <= {shift_out[6:0], 1'b0};
                    spi_miso <= shift_out[7];
                end
            end
        end
    end


    always_ff @(posedge clk or negedge rst_n) begin 
        if (!rst_n) begin
            amp_setting <= DEFAULT_AMP_SETTING;
            mems_freq_x <= DEFAULT_MEMS_FREQ_X;
            mems_freq_y <= DEFAULT_MEMS_FREQ_Y;
            step_size_x <= DEFAULT_SIZE_X;
            step_size_y <= DEFAULT_SIZE_Y;
        end else if (reg_wr_en) begin
            unique case (reg_wr_addr)
                ADDR_AMP_SETTING: amp_setting <= reg_wr_data;
                ADDR_MEMS_FREQ_X_L: mems_freq_x[7:0] <= reg_wr_data;
                ADDR_MEMS_FREQ_X_H: mems_freq_x[15:8] <= reg_wr_data;
                ADDR_MEMS_FREQ_Y_L: mems_freq_y[7:0] <= reg_wr_data;
                ADDR_MEMS_FREQ_Y_H: mems_freq_y[15:8] <= reg_wr_data;
                ADDR_STEP_SIZE_X: step_size_x <= reg_wr_data;
                ADDR_STEP_SIZE_Y: step_size_y <= reg_wr_data;
                default: ;
            endcase
        end
    end
    logic [7:0] reg_rd_data;
    always_comb begin
        unique case (spi_addr)
            ADDR_AMP_SETTING: reg_rd_data = amp_setting;
            ADDR_MEMS_FREQ_X_L: reg_rd_data = mems_freq_x[7:0];
            ADDR_MEMS_FREQ_X_H: reg_rd_data = mems_freq_x[15:8];
            ADDR_MEMS_FREQ_Y_L: reg_rd_data = mems_freq_y[7:0];
            ADDR_MEMS_FREQ_Y_H: reg_rd_data = mems_freq_y[15:8];
            ADDR_STEP_SIZE_X: reg_rd_data = step_size_x;
            ADDR_STEP_SIZE_Y: reg_rd_data = step_size_y;
            ADDR_TDC_AREA_X: reg_rd_data = tdc_area_x;
            ADDR_TDC_AREA_Y: reg_rd_data = tdc_area_y;
            default: reg_rd_data = 8'h00;
        endcase
    end
    
endmodule

`default_nettype wire