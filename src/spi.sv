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

    // MOSI (Import to ASIC)
    // Config Setting
    // 8 bit: Amp Ratio
    output logic unsigned [7:0]     cfg_amp_ratio,     

    // 16-bit: MEMS requency Control Word (Min MEMS Frequency: 2.38418579102KHz, Max MEMS Frequency: 156.247615814KHz)
    output logic unsigned [15:0]    cfg_f_MEMS_fcw_x, cfg_f_MEMS_fcw_y, // Frequency Control Word (f_MEMS * 2^k) / f_clk, where k is 21, f_clk is 5MHz

    // Pre-Calibration
    // 21-bit: MEMS phase offset in phase accumulator space (Optional)
    output logic unsigned [20:0]    cfg_phase0_offset_x, cfg_phase90_offset_x, cfg_phase270_offset_x,
    output logic unsigned [20:0]    cfg_phase0_offset_y, cfg_phase90_offset_y, cfg_phase270_offset_y,

    output logic                    boot_complete,
    output logic                    cfg_done,
    output logic                    phase_offset_imported,
    output logic                    soft_rst,

    // MISO (Export from ASIC)
    // SPI Report
    // Calibration
    input  logic unsigned [7:0]     delay_wave_cycle_x, delay_wave_cycle_y,
    input  logic unsigned [20:0]    raw_edge1_x, raw_edge2_x, raw_edge3_x,
    input  logic unsigned [20:0]    raw_edge1_y, raw_edge2_y, raw_edge3_y,
    input  logic                    cal_dir_x, cal_dir_y,
    input  logic unsigned [20:0]    cal_phase0_offset_x, cal_phase90_offset_x, cal_phase270_offset_x,
    input  logic unsigned [20:0]    cal_phase0_offset_y, cal_phase90_offset_y, cal_phase270_offset_y,

    input  logic                    cal_timeout_x, cal_timeout_y,

    // Main Loop
    input  logic                    latch_error_x, latch_error_y,

    // State Machine
    input logic [2:0] state_o
);
    localparam logic [SPI_ADDR_WIDTH-1:0] ADDR_AMP_RATIO          = 7'h00;

    localparam logic [SPI_ADDR_WIDTH-1:0] ADDR_MEMS_FCW_X_L       = 7'h01;
    localparam logic [SPI_ADDR_WIDTH-1:0] ADDR_MEMS_FCW_X_H       = 7'h02;
    localparam logic [SPI_ADDR_WIDTH-1:0] ADDR_MEMS_FCW_Y_L       = 7'h03;
    localparam logic [SPI_ADDR_WIDTH-1:0] ADDR_MEMS_FCW_Y_H       = 7'h04;

    localparam logic [SPI_ADDR_WIDTH-1:0] ADDR_PHASE0_OFF_X_B0    = 7'h05;
    localparam logic [SPI_ADDR_WIDTH-1:0] ADDR_PHASE0_OFF_X_B1    = 7'h06;
    localparam logic [SPI_ADDR_WIDTH-1:0] ADDR_PHASE0_OFF_X_B2    = 7'h07;
    localparam logic [SPI_ADDR_WIDTH-1:0] ADDR_PHASE90_OFF_X_B0   = 7'h08;
    localparam logic [SPI_ADDR_WIDTH-1:0] ADDR_PHASE90_OFF_X_B1   = 7'h09;
    localparam logic [SPI_ADDR_WIDTH-1:0] ADDR_PHASE90_OFF_X_B2   = 7'h0A;
    localparam logic [SPI_ADDR_WIDTH-1:0] ADDR_PHASE270_OFF_X_B0  = 7'h0B;
    localparam logic [SPI_ADDR_WIDTH-1:0] ADDR_PHASE270_OFF_X_B1  = 7'h0C;
    localparam logic [SPI_ADDR_WIDTH-1:0] ADDR_PHASE270_OFF_X_B2  = 7'h0D;

    localparam logic [SPI_ADDR_WIDTH-1:0] ADDR_PHASE0_OFF_Y_B0    = 7'h0E;
    localparam logic [SPI_ADDR_WIDTH-1:0] ADDR_PHASE0_OFF_Y_B1    = 7'h0F;
    localparam logic [SPI_ADDR_WIDTH-1:0] ADDR_PHASE0_OFF_Y_B2    = 7'h10;
    localparam logic [SPI_ADDR_WIDTH-1:0] ADDR_PHASE90_OFF_Y_B0   = 7'h11;
    localparam logic [SPI_ADDR_WIDTH-1:0] ADDR_PHASE90_OFF_Y_B1   = 7'h12;
    localparam logic [SPI_ADDR_WIDTH-1:0] ADDR_PHASE90_OFF_Y_B2   = 7'h13;
    localparam logic [SPI_ADDR_WIDTH-1:0] ADDR_PHASE270_OFF_Y_B0  = 7'h14;
    localparam logic [SPI_ADDR_WIDTH-1:0] ADDR_PHASE270_OFF_Y_B1  = 7'h15;
    localparam logic [SPI_ADDR_WIDTH-1:0] ADDR_PHASE270_OFF_Y_B2  = 7'h16;

    localparam logic [SPI_ADDR_WIDTH-1:0] ADDR_CTRL               = 7'h17;

    localparam logic [SPI_ADDR_WIDTH-1:0] ADDR_DELAY_WAVE_CYC_X   = 7'h20;
    localparam logic [SPI_ADDR_WIDTH-1:0] ADDR_DELAY_WAVE_CYC_Y   = 7'h21;

    localparam logic [SPI_ADDR_WIDTH-1:0] ADDR_RAW_EDGE1_X_B0     = 7'h22;
    localparam logic [SPI_ADDR_WIDTH-1:0] ADDR_RAW_EDGE1_X_B1     = 7'h23;
    localparam logic [SPI_ADDR_WIDTH-1:0] ADDR_RAW_EDGE1_X_B2     = 7'h24;
    localparam logic [SPI_ADDR_WIDTH-1:0] ADDR_RAW_EDGE2_X_B0     = 7'h25;
    localparam logic [SPI_ADDR_WIDTH-1:0] ADDR_RAW_EDGE2_X_B1     = 7'h26;
    localparam logic [SPI_ADDR_WIDTH-1:0] ADDR_RAW_EDGE2_X_B2     = 7'h27;
    localparam logic [SPI_ADDR_WIDTH-1:0] ADDR_RAW_EDGE3_X_B0     = 7'h28;
    localparam logic [SPI_ADDR_WIDTH-1:0] ADDR_RAW_EDGE3_X_B1     = 7'h29;
    localparam logic [SPI_ADDR_WIDTH-1:0] ADDR_RAW_EDGE3_X_B2     = 7'h2A;

    localparam logic [SPI_ADDR_WIDTH-1:0] ADDR_RAW_EDGE1_Y_B0     = 7'h2B;
    localparam logic [SPI_ADDR_WIDTH-1:0] ADDR_RAW_EDGE1_Y_B1     = 7'h2C;
    localparam logic [SPI_ADDR_WIDTH-1:0] ADDR_RAW_EDGE1_Y_B2     = 7'h2D;
    localparam logic [SPI_ADDR_WIDTH-1:0] ADDR_RAW_EDGE2_Y_B0     = 7'h2E;
    localparam logic [SPI_ADDR_WIDTH-1:0] ADDR_RAW_EDGE2_Y_B1     = 7'h2F;
    localparam logic [SPI_ADDR_WIDTH-1:0] ADDR_RAW_EDGE2_Y_B2     = 7'h30;
    localparam logic [SPI_ADDR_WIDTH-1:0] ADDR_RAW_EDGE3_Y_B0     = 7'h31;
    localparam logic [SPI_ADDR_WIDTH-1:0] ADDR_RAW_EDGE3_Y_B1     = 7'h32;
    localparam logic [SPI_ADDR_WIDTH-1:0] ADDR_RAW_EDGE3_Y_B2     = 7'h33;

    localparam logic [SPI_ADDR_WIDTH-1:0] ADDR_CAL_PHASE0_OFF_X_B0   = 7'h34;
    localparam logic [SPI_ADDR_WIDTH-1:0] ADDR_CAL_PHASE0_OFF_X_B1   = 7'h35;
    localparam logic [SPI_ADDR_WIDTH-1:0] ADDR_CAL_PHASE0_OFF_X_B2   = 7'h36;
    localparam logic [SPI_ADDR_WIDTH-1:0] ADDR_CAL_PHASE90_OFF_X_B0  = 7'h37;
    localparam logic [SPI_ADDR_WIDTH-1:0] ADDR_CAL_PHASE90_OFF_X_B1  = 7'h38;
    localparam logic [SPI_ADDR_WIDTH-1:0] ADDR_CAL_PHASE90_OFF_X_B2  = 7'h39;
    localparam logic [SPI_ADDR_WIDTH-1:0] ADDR_CAL_PHASE270_OFF_X_B0 = 7'h3A;
    localparam logic [SPI_ADDR_WIDTH-1:0] ADDR_CAL_PHASE270_OFF_X_B1 = 7'h3B;
    localparam logic [SPI_ADDR_WIDTH-1:0] ADDR_CAL_PHASE270_OFF_X_B2 = 7'h3C;

    localparam logic [SPI_ADDR_WIDTH-1:0] ADDR_CAL_PHASE0_OFF_Y_B0   = 7'h3D;
    localparam logic [SPI_ADDR_WIDTH-1:0] ADDR_CAL_PHASE0_OFF_Y_B1   = 7'h3E;
    localparam logic [SPI_ADDR_WIDTH-1:0] ADDR_CAL_PHASE0_OFF_Y_B2   = 7'h3F;
    localparam logic [SPI_ADDR_WIDTH-1:0] ADDR_CAL_PHASE90_OFF_Y_B0  = 7'h40;
    localparam logic [SPI_ADDR_WIDTH-1:0] ADDR_CAL_PHASE90_OFF_Y_B1  = 7'h41;
    localparam logic [SPI_ADDR_WIDTH-1:0] ADDR_CAL_PHASE90_OFF_Y_B2  = 7'h42;
    localparam logic [SPI_ADDR_WIDTH-1:0] ADDR_CAL_PHASE270_OFF_Y_B0 = 7'h43;
    localparam logic [SPI_ADDR_WIDTH-1:0] ADDR_CAL_PHASE270_OFF_Y_B1 = 7'h44;
    localparam logic [SPI_ADDR_WIDTH-1:0] ADDR_CAL_PHASE270_OFF_Y_B2 = 7'h45;

    localparam logic [SPI_ADDR_WIDTH-1:0] ADDR_STATUS             = 7'h46;
    localparam logic [SPI_ADDR_WIDTH-1:0] ADDR_STATE              = 7'h47;

    localparam logic [7:0]  DEFAULT_AMP_RATIO = 8'h00;
    localparam logic [15:0] DEFAULT_MEMS_FCW  = 16'h0000;
    localparam logic [20:0] DEFAULT_PHASE_OFF = 21'h0;

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

    logic [2:0] bit_cnt;
    logic rw_n;
    logic [SPI_ADDR_WIDTH-1:0] spi_addr;

    logic [7:0] rx_shift;
    logic [7:0] tx_shift;

    logic reg_wr_en;
    logic [SPI_ADDR_WIDTH-1:0] reg_wr_addr;
    logic [7:0] reg_wr_data;

    wire [7:0] rx_shift_next = {rx_shift[6:0], mosi_sync_q};


    always_ff @(posedge clk or negedge rst_n) begin 
        if (!rst_n) begin
            spi_state <= ST_CMD;
            bit_cnt <= 3'd0;
            rx_shift <= 8'd0;
            tx_shift <= 8'd0;
            rw_n <= 1'b0;
            spi_addr <= '0;
            reg_wr_en <= 1'b0;
            reg_wr_addr <= '0;
            reg_wr_data <= 8'd0;
            spi_miso <= 1'b0;
            spi_miso_oe <= 1'b0;
        end else begin
            reg_wr_en <= 1'b0;
            spi_miso_oe <= ~cs_n_sync;

            if (cs_n_sync) begin
                spi_state <= ST_CMD;
                bit_cnt <= 3'd0;
            end else begin
                if (sclk_rise) begin
                    rx_shift <= rx_shift_next;
                    if (bit_cnt == 3'd7) begin
                        bit_cnt <= 3'd0;
                        unique case (spi_state)
                            ST_CMD: begin
                                rw_n <= rx_shift_next[SPI_ADDR_WIDTH];
                                spi_addr <= rx_shift_next[SPI_ADDR_WIDTH-1:0];
                                spi_state <= ST_DATA;
                            end
                            ST_DATA: begin
                                if (rw_n) begin 
                                    reg_wr_en <= 1'b1;
                                    reg_wr_addr <= spi_addr;
                                    reg_wr_data <= rx_shift_next;
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
                        tx_shift <= reg_rd_data;
                    else
                        tx_shift <= {tx_shift[6:0], 1'b0};
                    spi_miso <= tx_shift[7];
                end
            end
        end
    end


    always_ff @(posedge clk or negedge rst_n) begin 
        if (!rst_n) begin
            cfg_amp_ratio          <= DEFAULT_AMP_RATIO;
            cfg_f_MEMS_fcw_x       <= DEFAULT_MEMS_FCW;
            cfg_f_MEMS_fcw_y       <= DEFAULT_MEMS_FCW;
            cfg_phase0_offset_x    <= DEFAULT_PHASE_OFF;
            cfg_phase90_offset_x   <= DEFAULT_PHASE_OFF;
            cfg_phase270_offset_x  <= DEFAULT_PHASE_OFF;
            cfg_phase0_offset_y    <= DEFAULT_PHASE_OFF;
            cfg_phase90_offset_y   <= DEFAULT_PHASE_OFF;
            cfg_phase270_offset_y  <= DEFAULT_PHASE_OFF;
            boot_complete          <= 1'b0;
            cfg_done               <= 1'b0;
            phase_offset_imported  <= 1'b0;
            soft_rst                <= 1'b0;
        end else if (reg_wr_en) begin
            unique case (reg_wr_addr)
                ADDR_AMP_RATIO:    cfg_amp_ratio <= reg_wr_data;

                ADDR_MEMS_FCW_X_L: cfg_f_MEMS_fcw_x[7:0]  <= reg_wr_data;
                ADDR_MEMS_FCW_X_H: cfg_f_MEMS_fcw_x[15:8] <= reg_wr_data;
                ADDR_MEMS_FCW_Y_L: cfg_f_MEMS_fcw_y[7:0]  <= reg_wr_data;
                ADDR_MEMS_FCW_Y_H: cfg_f_MEMS_fcw_y[15:8] <= reg_wr_data;

                ADDR_PHASE0_OFF_X_B0:   cfg_phase0_offset_x[7:0]    <= reg_wr_data;
                ADDR_PHASE0_OFF_X_B1:   cfg_phase0_offset_x[15:8]   <= reg_wr_data;
                ADDR_PHASE0_OFF_X_B2:   cfg_phase0_offset_x[20:16]  <= reg_wr_data[4:0];
                ADDR_PHASE90_OFF_X_B0:  cfg_phase90_offset_x[7:0]   <= reg_wr_data;
                ADDR_PHASE90_OFF_X_B1:  cfg_phase90_offset_x[15:8]  <= reg_wr_data;
                ADDR_PHASE90_OFF_X_B2:  cfg_phase90_offset_x[20:16] <= reg_wr_data[4:0];
                ADDR_PHASE270_OFF_X_B0: cfg_phase270_offset_x[7:0]   <= reg_wr_data;
                ADDR_PHASE270_OFF_X_B1: cfg_phase270_offset_x[15:8]  <= reg_wr_data;
                ADDR_PHASE270_OFF_X_B2: cfg_phase270_offset_x[20:16] <= reg_wr_data[4:0];

                ADDR_PHASE0_OFF_Y_B0:   cfg_phase0_offset_y[7:0]    <= reg_wr_data;
                ADDR_PHASE0_OFF_Y_B1:   cfg_phase0_offset_y[15:8]   <= reg_wr_data;
                ADDR_PHASE0_OFF_Y_B2:   cfg_phase0_offset_y[20:16]  <= reg_wr_data[4:0];
                ADDR_PHASE90_OFF_Y_B0:  cfg_phase90_offset_y[7:0]   <= reg_wr_data;
                ADDR_PHASE90_OFF_Y_B1:  cfg_phase90_offset_y[15:8]  <= reg_wr_data;
                ADDR_PHASE90_OFF_Y_B2:  cfg_phase90_offset_y[20:16] <= reg_wr_data[4:0];
                ADDR_PHASE270_OFF_Y_B0: cfg_phase270_offset_y[7:0]   <= reg_wr_data;
                ADDR_PHASE270_OFF_Y_B1: cfg_phase270_offset_y[15:8]  <= reg_wr_data;
                ADDR_PHASE270_OFF_Y_B2: cfg_phase270_offset_y[20:16] <= reg_wr_data[4:0];

                ADDR_CTRL: begin
                    boot_complete          <= reg_wr_data[0];
                    cfg_done               <= reg_wr_data[1];
                    phase_offset_imported  <= reg_wr_data[2];
                    soft_rst                <= reg_wr_data[3];
                end

                default: ;
            endcase
        end
    end
    logic [7:0] reg_rd_data;
    always_comb begin
        unique case (spi_addr)
            ADDR_AMP_RATIO:    reg_rd_data = cfg_amp_ratio;

            ADDR_MEMS_FCW_X_L: reg_rd_data = cfg_f_MEMS_fcw_x[7:0];
            ADDR_MEMS_FCW_X_H: reg_rd_data = cfg_f_MEMS_fcw_x[15:8];
            ADDR_MEMS_FCW_Y_L: reg_rd_data = cfg_f_MEMS_fcw_y[7:0];
            ADDR_MEMS_FCW_Y_H: reg_rd_data = cfg_f_MEMS_fcw_y[15:8];

            ADDR_PHASE0_OFF_X_B0:   reg_rd_data = cfg_phase0_offset_x[7:0];
            ADDR_PHASE0_OFF_X_B1:   reg_rd_data = cfg_phase0_offset_x[15:8];
            ADDR_PHASE0_OFF_X_B2:   reg_rd_data = {3'b0, cfg_phase0_offset_x[20:16]};
            ADDR_PHASE90_OFF_X_B0:  reg_rd_data = cfg_phase90_offset_x[7:0];
            ADDR_PHASE90_OFF_X_B1:  reg_rd_data = cfg_phase90_offset_x[15:8];
            ADDR_PHASE90_OFF_X_B2:  reg_rd_data = {3'b0, cfg_phase90_offset_x[20:16]};
            ADDR_PHASE270_OFF_X_B0: reg_rd_data = cfg_phase270_offset_x[7:0];
            ADDR_PHASE270_OFF_X_B1: reg_rd_data = cfg_phase270_offset_x[15:8];
            ADDR_PHASE270_OFF_X_B2: reg_rd_data = {3'b0, cfg_phase270_offset_x[20:16]};

            ADDR_PHASE0_OFF_Y_B0:   reg_rd_data = cfg_phase0_offset_y[7:0];
            ADDR_PHASE0_OFF_Y_B1:   reg_rd_data = cfg_phase0_offset_y[15:8];
            ADDR_PHASE0_OFF_Y_B2:   reg_rd_data = {3'b0, cfg_phase0_offset_y[20:16]};
            ADDR_PHASE90_OFF_Y_B0:  reg_rd_data = cfg_phase90_offset_y[7:0];
            ADDR_PHASE90_OFF_Y_B1:  reg_rd_data = cfg_phase90_offset_y[15:8];
            ADDR_PHASE90_OFF_Y_B2:  reg_rd_data = {3'b0, cfg_phase90_offset_y[20:16]};
            ADDR_PHASE270_OFF_Y_B0: reg_rd_data = cfg_phase270_offset_y[7:0];
            ADDR_PHASE270_OFF_Y_B1: reg_rd_data = cfg_phase270_offset_y[15:8];
            ADDR_PHASE270_OFF_Y_B2: reg_rd_data = {3'b0, cfg_phase270_offset_y[20:16]};

            ADDR_CTRL: reg_rd_data = {4'b0, soft_rst, phase_offset_imported,
                                       cfg_done, boot_complete};

            ADDR_DELAY_WAVE_CYC_X: reg_rd_data = delay_wave_cycle_x;
            ADDR_DELAY_WAVE_CYC_Y: reg_rd_data = delay_wave_cycle_y;

            ADDR_RAW_EDGE1_X_B0: reg_rd_data = raw_edge1_x[7:0];
            ADDR_RAW_EDGE1_X_B1: reg_rd_data = raw_edge1_x[15:8];
            ADDR_RAW_EDGE1_X_B2: reg_rd_data = {3'b0, raw_edge1_x[20:16]};
            ADDR_RAW_EDGE2_X_B0: reg_rd_data = raw_edge2_x[7:0];
            ADDR_RAW_EDGE2_X_B1: reg_rd_data = raw_edge2_x[15:8];
            ADDR_RAW_EDGE2_X_B2: reg_rd_data = {3'b0, raw_edge2_x[20:16]};
            ADDR_RAW_EDGE3_X_B0: reg_rd_data = raw_edge3_x[7:0];
            ADDR_RAW_EDGE3_X_B1: reg_rd_data = raw_edge3_x[15:8];
            ADDR_RAW_EDGE3_X_B2: reg_rd_data = {3'b0, raw_edge3_x[20:16]};

            ADDR_RAW_EDGE1_Y_B0: reg_rd_data = raw_edge1_y[7:0];
            ADDR_RAW_EDGE1_Y_B1: reg_rd_data = raw_edge1_y[15:8];
            ADDR_RAW_EDGE1_Y_B2: reg_rd_data = {3'b0, raw_edge1_y[20:16]};
            ADDR_RAW_EDGE2_Y_B0: reg_rd_data = raw_edge2_y[7:0];
            ADDR_RAW_EDGE2_Y_B1: reg_rd_data = raw_edge2_y[15:8];
            ADDR_RAW_EDGE2_Y_B2: reg_rd_data = {3'b0, raw_edge2_y[20:16]};
            ADDR_RAW_EDGE3_Y_B0: reg_rd_data = raw_edge3_y[7:0];
            ADDR_RAW_EDGE3_Y_B1: reg_rd_data = raw_edge3_y[15:8];
            ADDR_RAW_EDGE3_Y_B2: reg_rd_data = {3'b0, raw_edge3_y[20:16]};

            ADDR_CAL_PHASE0_OFF_X_B0:   reg_rd_data = cal_phase0_offset_x[7:0];
            ADDR_CAL_PHASE0_OFF_X_B1:   reg_rd_data = cal_phase0_offset_x[15:8];
            ADDR_CAL_PHASE0_OFF_X_B2:   reg_rd_data = {3'b0, cal_phase0_offset_x[20:16]};
            ADDR_CAL_PHASE90_OFF_X_B0:  reg_rd_data = cal_phase90_offset_x[7:0];
            ADDR_CAL_PHASE90_OFF_X_B1:  reg_rd_data = cal_phase90_offset_x[15:8];
            ADDR_CAL_PHASE90_OFF_X_B2:  reg_rd_data = {3'b0, cal_phase90_offset_x[20:16]};
            ADDR_CAL_PHASE270_OFF_X_B0: reg_rd_data = cal_phase270_offset_x[7:0];
            ADDR_CAL_PHASE270_OFF_X_B1: reg_rd_data = cal_phase270_offset_x[15:8];
            ADDR_CAL_PHASE270_OFF_X_B2: reg_rd_data = {3'b0, cal_phase270_offset_x[20:16]};

            ADDR_CAL_PHASE0_OFF_Y_B0:   reg_rd_data = cal_phase0_offset_y[7:0];
            ADDR_CAL_PHASE0_OFF_Y_B1:   reg_rd_data = cal_phase0_offset_y[15:8];
            ADDR_CAL_PHASE0_OFF_Y_B2:   reg_rd_data = {3'b0, cal_phase0_offset_y[20:16]};
            ADDR_CAL_PHASE90_OFF_Y_B0:  reg_rd_data = cal_phase90_offset_y[7:0];
            ADDR_CAL_PHASE90_OFF_Y_B1:  reg_rd_data = cal_phase90_offset_y[15:8];
            ADDR_CAL_PHASE90_OFF_Y_B2:  reg_rd_data = {3'b0, cal_phase90_offset_y[20:16]};
            ADDR_CAL_PHASE270_OFF_Y_B0: reg_rd_data = cal_phase270_offset_y[7:0];
            ADDR_CAL_PHASE270_OFF_Y_B1: reg_rd_data = cal_phase270_offset_y[15:8];
            ADDR_CAL_PHASE270_OFF_Y_B2: reg_rd_data = {3'b0, cal_phase270_offset_y[20:16]};

            ADDR_STATUS: reg_rd_data = {2'b0, latch_error_y, latch_error_x,
                                         cal_timeout_y, cal_timeout_x,
                                         cal_dir_y, cal_dir_x};

            ADDR_STATE: reg_rd_data = {5'b0, state_o};

            default: reg_rd_data = 8'h00;
        endcase
    end
    
endmodule

`default_nettype wire