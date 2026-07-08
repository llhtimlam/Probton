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

`include "spi.sv"
`include "state_machine.sv"
`include "wave_controller.sv"
`include "signal_procssor.sv"

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





    // ANALOG IO

    // (ANALOG) Readout Pin Definition
    wire analog_readout_input = analog[0];

    // (ANALOG) Output Pin Definition
    wire analog_readout_output = analog[1];
    wire analog_error_output = analog[2];
    wire analog_MEMS_x_output = analog[3];
    wire analog_MEMS_y_output = analog[4];



    // DIGITAL IO

    // (DIGITAL) SPI Pin Definition
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

    // (DIGITAL) Movement (X/Y) Pin Definition
    wire move_en_x = bidir_out[4];
    wire dir_x     = bidir_out[5];
    wire move_en_y = bidir_out[6];
    wire dir_y     = bidir_out[7];

    always_comb begin // Replace top duplicated with bottom
        // Default behavior for the remaining pins [NUM_BIDIR_PADS-1] (CMOS buffer, fast slew).
        bidir_oe  = '1; 
        bidir_cs  = '0; 
        bidir_sl  = '0; 
        bidir_ie  = ~bidir_oe;
        bidir_pu  = '0; 
        bidir_pd  = '0; 

        // Override Configuration for Pin 4 (move_en_x Output)
        bidir_oe[4] = ~spi_cs_n; // ?
        bidir_cs[4] = 1'b0;      // CMOS output threshold
        bidir_ie[4] = 1'b0;      // Input buffer OFF (saves power and blocks feedback noise)
        bidir_sl[4] = 1'b1;      // ?
        bidir_pu[4] = 1'b0;      // No pull-up
        bidir_pd[4] = 1'b0;      // No pull-down

        // Override Configuration for Pin 5 (dir_x Output)
        bidir_oe[5] = ~spi_cs_n; // ?
        bidir_cs[5] = 1'b0;      // CMOS output threshold
        bidir_ie[5] = 1'b0;      // Input buffer OFF (saves power and blocks feedback noise)
        bidir_sl[5] = 1'b1;      // ?
        bidir_pu[5] = 1'b0;      // No pull-up
        bidir_pd[5] = 1'b0;      // No pull-down

        // Override Configuration for Pin 6 (move_en_y Output)
        bidir_oe[6] = ~spi_cs_n; // ?
        bidir_cs[6] = 1'b0;      // CMOS output threshold
        bidir_ie[6] = 1'b0;      // Input buffer OFF (saves power and blocks feedback noise)
        bidir_sl[6] = 1'b1;      // ?
        bidir_pu[6] = 1'b0;      // No pull-up
        bidir_pd[6] = 1'b0;      // No pull-down

        // Override Configuration for Pin 7 (dir_y Output)
        bidir_oe[7] = ~spi_cs_n; // ?
        bidir_cs[7] = 1'b0;      // CMOS output threshold
        bidir_ie[7] = 1'b0;      // Input buffer OFF (saves power and blocks feedback noise)
        bidir_sl[7] = 1'b1;      // ?
        bidir_pu[7] = 1'b0;      // No pull-up
        bidir_pd[7] = 1'b0;      // No pull-down

    end





    // Template Stuff, I dont know what it is about
    logic _unused;
    assign _unused = &bidir_in;

    logic [NUM_BIDIR_PADS-1:0] count;

    always_ff @(posedge clk) begin
        if (!rst_n) begin
            count <= '0;
        end else begin
            if (&input_in) begin
                count <= count + 1;
            end
        end
    end

    logic [7:0] sram_0_out;

    `gf180mcu_xxx_ip_sram__sram512x8m8wm1 sram_0 (
        `ifdef USE_POWER_PINS
        .VDD  (VDD),
        .VSS  (VSS),
        `endif

        .CLK  (clk),
        .CEN  (1'b1),
        .GWEN (1'b0),
        .WEN  (8'b0),
        .A    ('0),
        .D    ('0),
        .Q    (sram_0_out)
    );

    logic [7:0] sram_1_out;

    `gf180mcu_xxx_ip_sram__sram512x8m8wm1 sram_1 (
        `ifdef USE_POWER_PINS
        .VDD  (VDD),
        .VSS  (VSS),
        `endif

        .CLK  (clk),
        .CEN  (1'b1),
        .GWEN (1'b0),
        .WEN  (8'b0),
        .A    ('0),
        .D    ('0),
        .Q    (sram_1_out)
    );

    assign bidir_out = count ^ {24'd0, sram_0_out, sram_1_out};





    // Module Routing

    // Analog



    // Digital
    // SPI
    spi_regs spi_regs_inst (
        .clk(clk), .rst_n(rst_n),
    
    );

    // State Machine
    state_machine state_machine_inst (
        .clk(clk), .rst_n(rst_n),
    
    );

    // Wave Controller
    wave_controller wave_controller_x_inst (
        .clk(clk), .rst_n(rst_n),
        
    )

    wave_controller wave_controller_y_inst (
        .clk(clk), .rst_n(rst_n),
        
    )

    // Signal Processor
    signal_procssor signal_procssor_x_inst (
        .clk(clk), .rst_n(rst_n),
        
    )

    signal_procssor signal_procssor_y_inst (
        .clk(clk), .rst_n(rst_n),
        
    )


endmodule

`default_nettype wire