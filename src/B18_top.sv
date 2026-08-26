`default_nettype none

`include "B18_core.sv"

module wrapper_top (
    `ifdef USE_POWER_PINS
    inout  wire VDD,
    inout  wire VSS,
    `endif

    input  wire clk,       // clock
    output wire clk_PU,
    output wire clk_PD,

    input  wire rst_n,     // reset (active low)
    output wire rst_n_PU,
    output wire rst_n_PD,



    // SPI Interface Ports
    // bidir_in_0
    input  logic spi_cs_n,
    output logic spi_cs_n_PU,
    output logic spi_cs_n_PD,

    // bidir_in_1
    input  logic spi_sclk, 
    output logic spi_sclk_PU,
    output logic spi_sclk_PD,
    
    // bidir_in_2
    input  logic spi_mosi,
    output logic spi_mosi_PU,
    output logic spi_mosi_PD,

    // bidir_out_3
    output logic spi_miso_CS,
    output logic spi_miso_SL,
    output logic spi_miso_IE,
    output logic spi_miso_oe,
    output logic spi_miso_PU,
    output logic spi_miso_PD,
    output logic spi_miso_OUT,
    output logic spi_miso_PDRV0,
    output logic spi_miso_PDRV1,
    input  logic spi_miso_IN,



    // Movement Controls
    // bidir_out_4
    output logic move_en_x_CS,
    output logic move_en_x_SL,
    output logic move_en_x_IE,
    output logic move_en_x_OE,
    output logic move_en_x_PU,
    output logic move_en_x_PD,
    output logic move_en_x_OUT,
    output logic move_en_x_PDRV0,
    output logic move_en_x_PDRV1,
    input  logic move_en_x_IN,

    // bidir_out_5
    output logic dir_x_CS,
    output logic dir_x_SL,
    output logic dir_x_IE,
    output logic dir_x_OE,
    output logic dir_x_PU,
    output logic dir_x_PD,
    output logic dir_x_OUT,
    output logic dir_x_PDRV0,
    output logic dir_x_PDRV1,
    input  logic dir_x_IN,

    // bidir_out_6
    output logic move_en_y_CS,
    output logic move_en_y_SL,
    output logic move_en_y_IE,
    output logic move_en_y_OE,
    output logic move_en_y_PU,
    output logic move_en_y_PD,
    output logic move_en_y_OUT,
    output logic move_en_y_PDRV0,
    output logic move_en_y_PDRV1,
    input  logic move_en_y_IN,

    // bidir_out_7
    output logic dir_y_CS,
    output logic dir_y_SL,
    output logic dir_y_IE,
    output logic dir_y_OE,
    output logic dir_y_PU,
    output logic dir_y_PD,
    output logic dir_y_OUT,
    output logic dir_y_PDRV0,
    output logic dir_y_PDRV1,
    input  logic dir_y_IN,



    // MEMS Driver
    // bidir_out_8
    output logic mems_drv_x_CS,
    output logic mems_drv_x_SL,
    output logic mems_drv_x_IE,
    output logic mems_drv_x_OE,
    output logic mems_drv_x_PU,
    output logic mems_drv_x_PD,
    output logic mems_drv_x_OUT,
    output logic mems_drv_x_PDRV0,
    output logic mems_drv_x_PDRV1,
    input  logic mems_drv_x_IN,

    // bidir_out_9
    output logic mems_drv_y_CS,
    output logic mems_drv_y_SL,
    output logic mems_drv_y_IE,
    output logic mems_drv_y_OE,
    output logic mems_drv_y_PU,
    output logic mems_drv_y_PD,
    output logic mems_drv_y_OUT,
    output logic mems_drv_y_PDRV0,
    output logic mems_drv_y_PDRV1,
    input  logic mems_drv_y_IN,



    // Reference Wave
    // bidir_out_10
    output logic ref_wave_x_CS,
    output logic ref_wave_x_SL,
    output logic ref_wave_x_IE,
    output logic ref_wave_x_OE,
    output logic ref_wave_x_PU,
    output logic ref_wave_x_PD,
    output logic ref_wave_x_OUT,
    output logic ref_wave_x_PDRV0,
    output logic ref_wave_x_PDRV1,
    input  logic ref_wave_x_IN,

    // bidir_out_11
    output logic ref_wave_y_CS,
    output logic ref_wave_y_SL,
    output logic ref_wave_y_IE,
    output logic ref_wave_y_OE,
    output logic ref_wave_y_PU,
    output logic ref_wave_y_PD,
    output logic ref_wave_y_OUT,
    output logic ref_wave_y_PDRV0,
    output logic ref_wave_y_PDRV1,
    input  logic ref_wave_y_IN,



    // Digital/Analog Interface
    // bidir_out_12
    output logic read_en_CS,
    output logic read_en_SL,
    output logic read_en_IE,
    output logic read_en_OE,
    output logic read_en_PU,
    output logic read_en_PD,
    output logic read_en_OUT,
    output logic read_en_PDRV0,
    output logic read_en_PDRV1,
    input  logic read_en_IN,

    // bidir_out_13
    input  logic comp_x,
    output logic comp_x_PU,
    output logic comp_x_PD,

    // bidir_out_14
    input  logic comp_y,
    output logic comp_y_PU,
    output logic comp_y_PD
);

    // Input pads:
    assign clk_PU           = 1'b0;
    assign clk_PD           = 1'b0;

    assign rst_n_PU         = 1'b1;
    assign rst_n_PD         = 1'b0;

    assign spi_cs_n_PU      = 1'b1;
    assign spi_cs_n_PD      = 1'b0;

    assign spi_sclk_PU      = 1'b0;
    assign spi_sclk_PD      = 1'b0;
   
    assign spi_mosi_PU      = 1'b0;
    assign spi_mosi_PD      = 1'b0;

    assign comp_x_PU        = 1'b0;
    assign comp_x_PD        = 1'b0;

    assign comp_y_PU        = 1'b0;
    assign comp_y_PD        = 1'b0;

    // Bidirectional pads:
    assign spi_miso_CS      = 1'b0;
    assign spi_miso_SL      = 1'b1;
    assign spi_miso_IE      = 1'b0;
    assign spi_miso_PU      = 1'b0;
    assign spi_miso_PD      = 1'b0;
    assign spi_miso_PDRV0   = 1'b1;
    assign spi_miso_PDRV1   = 1'b0;

    assign move_en_x_CS     = 1'b0;
    assign move_en_x_SL     = 1'b0;
    assign move_en_x_IE     = 1'b0;
    assign move_en_x_OE     = 1'b1;
    assign move_en_x_PU     = 1'b0;
    assign move_en_x_PD     = 1'b0;
    assign move_en_x_PDRV0  = 1'b1;
    assign move_en_x_PDRV1  = 1'b0;

    assign dir_x_CS         = 1'b0;
    assign dir_x_SL         = 1'b0;
    assign dir_x_IE         = 1'b0;
    assign dir_x_OE         = 1'b1;
    assign dir_x_PU         = 1'b0;
    assign dir_x_PD         = 1'b0;
    assign dir_x_PDRV0      = 1'b1;
    assign dir_x_PDRV1      = 1'b0;

    assign move_en_y_CS     = 1'b0;
    assign move_en_y_SL     = 1'b0;
    assign move_en_y_IE     = 1'b0;
    assign move_en_y_OE     = 1'b1;
    assign move_en_y_PU     = 1'b0;
    assign move_en_y_PD     = 1'b0;
    assign move_en_y_PDRV0  = 1'b1;
    assign move_en_y_PDRV1  = 1'b0;

    assign dir_y_CS         = 1'b0;
    assign dir_y_SL         = 1'b0;
    assign dir_y_IE         = 1'b0;
    assign dir_y_OE         = 1'b1;
    assign dir_y_PU         = 1'b0;
    assign dir_y_PD         = 1'b0;
    assign dir_y_PDRV0      = 1'b1;
    assign dir_y_PDRV1      = 1'b0;

    assign mems_drv_x_CS    = 1'b0;
    assign mems_drv_x_SL    = 1'b0;
    assign mems_drv_x_IE    = 1'b0;
    assign mems_drv_x_OE    = 1'b1;
    assign mems_drv_x_PU    = 1'b0;
    assign mems_drv_x_PD    = 1'b0;
    assign mems_drv_x_PDRV0 = 1'b1;
    assign mems_drv_x_PDRV1 = 1'b0;

    assign mems_drv_y_CS    = 1'b0;
    assign mems_drv_y_SL    = 1'b0;
    assign mems_drv_y_IE    = 1'b0;
    assign mems_drv_y_OE    = 1'b1;
    assign mems_drv_y_PU    = 1'b0;
    assign mems_drv_y_PD    = 1'b0;
    assign mems_drv_y_PDRV0 = 1'b1;
    assign mems_drv_y_PDRV1 = 1'b0;

    assign ref_wave_x_CS    = 1'b0;
    assign ref_wave_x_SL    = 1'b0;
    assign ref_wave_x_IE    = 1'b0;
    assign ref_wave_x_OE    = 1'b1;
    assign ref_wave_x_PU    = 1'b0;
    assign ref_wave_x_PD    = 1'b0;
    assign ref_wave_x_PDRV0 = 1'b1;
    assign ref_wave_x_PDRV1 = 1'b0;

    assign ref_wave_y_CS    = 1'b0;
    assign ref_wave_y_SL    = 1'b0;
    assign ref_wave_y_IE    = 1'b0;
    assign ref_wave_y_OE    = 1'b1;
    assign ref_wave_y_PU    = 1'b0;
    assign ref_wave_y_PD    = 1'b0;
    assign ref_wave_y_PDRV0 = 1'b1;
    assign ref_wave_y_PDRV1 = 1'b0;

    assign read_en_CS       = 1'b0;
    assign read_en_SL       = 1'b0;
    assign read_en_IE       = 1'b0;
    assign read_en_OE       = 1'b1;
    assign read_en_PU       = 1'b0;
    assign read_en_PD       = 1'b0;
    assign read_en_PDRV0    = 1'b1;
    assign read_en_PDRV1    = 1'b0;



    wrapper wrapper_inst (
        `ifdef USE_POWER_PINS
        .VDD         (VDD),
        .VSS         (VSS),
        `endif
        .clk         (clk),
        .rst_n       (rst_n),
        .spi_cs_n    (spi_cs_n),
        .spi_sclk    (spi_sclk),
        .spi_mosi    (spi_mosi),
        .spi_miso    (spi_miso_OUT),
        .spi_miso_oe (spi_miso_oe),
        .move_en_x   (move_en_x_OUT),
        .dir_x       (dir_x_OUT),
        .move_en_y   (move_en_y_OUT),
        .dir_y       (dir_y_OUT),
        .mems_drv_x  (mems_drv_x_OUT),
        .mems_drv_y  (mems_drv_y_OUT),
        .ref_wave_x  (ref_wave_x_OUT),
        .ref_wave_y  (ref_wave_y_OUT),
        .read_en     (read_en_OUT),
        .comp_x      (comp_x),
        .comp_y      (comp_y)
    );

endmodule

`default_nettype wire