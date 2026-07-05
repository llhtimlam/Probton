// SPDX-FileCopyrightText: 2026 Chipathon 2026 workshop
// SPDX-License-Identifier: Apache-2.0
//
// Minimal chip_core for the Chipathon 2026 workshop padring slot.
// The emphasis of this slot is the padring itself (60 analog + 20
// bidir + 4/4 power + clk/rst_n); the core is intentionally trivial:
// a free-running counter whose state drives the 20 bidir pads. The
// 60 analog pads are routed straight through to analog[] and stay
// unconnected at the core level (the intent is that a downstream
// design wires them to custom analog IP later).

`default_nettype none

module chip_core #(
    parameter NUM_INPUT_PADS,
    parameter NUM_BIDIR_PADS,
    parameter NUM_ANALOG_PADS
    )(
    `ifdef USE_POWER_PINS
    inout  wire VDD,
    inout  wire VSS,
    `endif

    input  wire clk,       // clock
    input  wire rst_n,     // reset (active low)

    input  wire [NUM_INPUT_PADS-1:0] input_in,   // Input value
    output wire [NUM_INPUT_PADS-1:0] input_pu,   // Pull-up
    output wire [NUM_INPUT_PADS-1:0] input_pd,   // Pull-down

    input  wire [NUM_BIDIR_PADS-1:0] bidir_in,   // Input value
    output wire [NUM_BIDIR_PADS-1:0] bidir_out,  // Output value
    output wire [NUM_BIDIR_PADS-1:0] bidir_oe,   // Output enable
    output wire [NUM_BIDIR_PADS-1:0] bidir_cs,   // Input type (0=CMOS, 1=Schmitt)
    output wire [NUM_BIDIR_PADS-1:0] bidir_sl,   // Slew rate (0=fast, 1=slow)
    output wire [NUM_BIDIR_PADS-1:0] bidir_ie,   // Input enable
    output wire [NUM_BIDIR_PADS-1:0] bidir_pu,   // Pull-up
    output wire [NUM_BIDIR_PADS-1:0] bidir_pd,   // Pull-down

    inout  wire [NUM_ANALOG_PADS-1:0] analog    // Analog
);

    // Disable pull-up and pull-down on any discrete input pads.
    assign input_pu = '0;
    assign input_pd = '0;

    // Drive the bidir pads as outputs (CMOS buffer, fast slew).
    // assign bidir_oe = '1;
    // assign bidir_cs = '0;
    // assign bidir_sl = '0;
    // assign bidir_ie = ~bidir_oe;
    // assign bidir_pu = '0;
    // assign bidir_pd = '0;

    //---------------------------------------------------------
    // (DIGITAL) SPI PIN DEFINITIONS & PHYSICAL IO CONFIGURATION
    //---------------------------------------------------------
    wire spi_cs_n = bidir_in[0];
    wire spi_sclk = bidir_in[1];
    wire spi_mosi = bidir_in[2];
    wire spi_miso = bidir_in[3];

    always_comb begin // Replace top duplicated with bottom
        // Default behavior for the remaining pins [NUM_BIDIR_PADS-1] (CMOS buffer, fast slew).
        bidir_oe  = '1; 
        bidir_cs  = '0; 
        bidir_sl  = '0; 
        bidir_ie  = ~bidir_oe;
        bidir_pu  = '0; 
        bidir_pd  = '0; 

        // Override Configuration for Pin 0 (CS_N Input)
        bidir_oe[0] = 1'b0; // Input
        bidir_cs[0] = 1'b1; // Schmitt Trigger
        bidir_ie[0] = 1'b1; // Input buffer ON
        bidir_pu[0] = 1'b1; // Pull-up enabled (prevents accidental activation if line floats)
        bidir_pd[0] = 1'b0; // No pull-down

        // Override Configuration for Pin 1 (SCLK Input)
        bidir_oe[1] = 1'b0; // Input
        bidir_cs[1] = 1'b1; // Schmitt Trigger for external line noise
        bidir_ie[1] = 1'b1; // Input buffer ON
        bidir_pu[1] = 1'b0; // No pull-up
        bidir_pd[1] = 1'b0; // No pull-down

        // Override Configuration for Pin 2 (MOSI Input)
        bidir_oe[2] = 1'b0; // Input
        bidir_cs[2] = 1'b1; // Schmitt Trigger
        bidir_ie[2] = 1'b1; // Input buffer ON
        bidir_pu[2] = 1'b0; // No pull-up
        bidir_pd[2] = 1'b0; // No pull-down

        // Override Configuration for Pin 3 (MISO Dynamic Output)
        bidir_oe[3] = ~spi_cs_n; // Dynamic Tristate: Output only when CS_N is active low
        bidir_cs[3] = 1'b0;      // CMOS output threshold
        bidir_ie[3] = 1'b0;      // Input buffer OFF (saves power and blocks feedback noise)
        bidir_sl[3] = 1'b1;      // SLOW slew rate to protect the analog domain from digital noise
        bidir_pu[3] = 1'b0;      // No pull-up
        bidir_pd[3] = 1'b0;      // No pull-down

    end

    //---------------------------------------------------------
    // (ANALOG) READOUT PIN DEFINITIONS & PHYSICAL IO CONFIGURATION
    //---------------------------------------------------------
    wire analog_readout_input = analog[0];

    digital_signal_processing digital_signal_processing_inst (
        .clk(clk),
        .rst_n(rst_n),
        .state_control(state_machine_dsp),
        input  wire signed_bit_x,
        input  wire signed_bit_y,
        input  wire [7:0] tdc_area_x,
        input  wire [7:0] tdc_area_y,
        output wire [1:0] movement_x,
        output wire [1:0] movement_y
    )

    // Keep synthesis from optimising bidir_in / input_in away.
    logic _unused;
    assign _unused = &{1'b0, bidir_in, input_in};

    // Free-running counter, width equal to the number of bidir pads.
    logic [NUM_BIDIR_PADS-1:0] count;
    always_ff @(posedge clk) begin
        if (!rst_n) count <= '0;
        else        count <= count + 1;
    end
    assign bidir_out = count;

endmodule

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

    output logic [7:0] amp_setting,
    output logic [15:0] mems_freq_x,
    output logic [15:0] mems_freq_y,
    output logic [7:0] step_size_x,
    output logic [7:0] step_size_y,

    input wire [7:0] tdc_area_x,
    input wire [7:0] tdc_area_y,
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