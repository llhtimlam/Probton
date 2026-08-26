`default_nettype none

`include "digital_domain.sv"
`include "analog_block.sv"

module wrapper (
    `ifdef USE_POWER_PINS
    inout  wire VDD,
    inout  wire VSS,
    `endif

    input  wire clk,       // clock
    input  wire rst_n,     // reset (active low)

    // SPI Interface Ports
    input  logic spi_cs_n, // bidir_in_0
    input  logic spi_sclk, // bidir_in_1
    input  logic spi_mosi, // bidir_in_2
    output logic spi_miso, // bidir_out_3
    output logic spi_miso_oe, //bidir_oe_3

    // Movement Controls
    output logic move_en_x, // bidir_out_4
    output logic dir_x,     // bidir_out_5
    output logic move_en_y, // bidir_out_6
    output logic dir_y,     // bidir_out_7

    // MEMS Driver
    output logic mems_drv_x, // bidir_out_8
    output logic mems_drv_y, // bidir_out_9

    // Reference Wave
    output logic ref_wave_x, // bidir_out_10
    output logic ref_wave_y,  // bidir_out_11

    // Digital/Analog Interface
    output logic read_en,    // bidir_out_12
    input  logic comp_x,     // bidir_out_13
    input  logic comp_y      // bidir_out_14

    // Analog Module
    //input  wire analog_readout_input,
    //output wire analog_readout_output,
    //output wire analog_error_x_output,
    //output wire analog_error_y_output
);

    digital_domain digital_domain_inst (
        `ifdef USE_POWER_PINS
        .VDD         (VDD),
        .VSS         (VSS),
        `endif
        .clk         (clk),
        .rst_n       (rst_n),
        .spi_cs_n    (spi_cs_n),
        .spi_sclk    (spi_sclk),
        .spi_mosi    (spi_mosi),
        .spi_miso    (spi_miso),
        .spi_miso_oe (spi_miso_oe),
        .move_en_x   (move_en_x),
        .dir_x       (dir_x),
        .move_en_y   (move_en_y),
        .dir_y       (dir_y),
        .mems_drv_x  (mems_drv_x),
        .mems_drv_y  (mems_drv_y),
        .read_en     (read_en),
        .comp_x      (comp_x),
        .comp_y      (comp_y),
        .ref_wave_x  (ref_wave_x),
        .ref_wave_y  (ref_wave_y)
    );

endmodule

`default_nettype wire