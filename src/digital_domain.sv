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
`include "signal_processor.sv"

module digital_domain (
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

    // Analog Module
    output logic read_en,
    input  logic comp_x,
    input  logic comp_y,
    output logic ref_wave_x,
    output logic ref_wave_y
);
    
    // Intermediate Wire
    // ----- SPI → Config/Control Signal -----
    wire [15:0] cfg_f_MEMS_fcw_x, cfg_f_MEMS_fcw_y;
    wire [20:0] cfg_phase0_offset_x, cfg_phase90_offset_x, cfg_phase270_offset_x;
    wire [20:0] cfg_phase0_offset_y, cfg_phase90_offset_y, cfg_phase270_offset_y;
    wire        boot_complete, cfg_done, phase_offset_imported;

    // Soft reset: SPI drives an active high one clk pulse, the datapath
    // modules take active low, so invert it here (single driver each).
    wire        soft_rst;
    wire        soft_rst_n = ~soft_rst;

    // ----- Wave Controller → SPI (Calibration) -----
    wire [7:0]  delay_wave_cycle_x, delay_wave_cycle_y;
    wire [20:0] raw_edge1_x, raw_edge2_x, raw_edge3_x;
    wire [20:0] raw_edge1_y, raw_edge2_y, raw_edge3_y;
    wire        cal_dir_x, cal_dir_y;
    wire [20:0] cal_phase0_offset_x, cal_phase90_offset_x, cal_phase270_offset_x;
    wire [20:0] cal_phase0_offset_y, cal_phase90_offset_y, cal_phase270_offset_y;

    // ----- Signal Processor Debug → SPI -----
    wire        latch_error_x, latch_error_y;
    wire        jitter_flag_x, jitter_flag_y;
    wire [1:0]  phase_state_x, phase_state_y;
    wire [3:0]  votes_in_phase_x, votes_out_phase_x;
    wire [3:0]  votes_in_phase_y, votes_out_phase_y;

    // ----- State Machine Status → SPI -----
    wire [2:0]  state_o;

    // ----- Control Signal → State Machine -----
    wire        cal_done_x, cal_done_y;
    wire        cal_timeout_x, cal_timeout_y;
    wire        cal_start, cal_done, cal_timeout;
    // AND on done: leave calibration only when BOTH axes have finished.
    // OR on timeout: if either axis gives up, calibration is over.
    assign cal_done    = cal_done_x    & cal_done_y;
    assign cal_timeout = cal_timeout_x | cal_timeout_y;

    // ----- Wave controller ↔ signal processor handshake -----
    wire        latch_phase90_x, latch_phase270_x;
    wire        latch_phase90_ack_x, latch_phase270_ack_x;
    wire        latch_phase90_y, latch_phase270_y;
    wire        latch_phase90_ack_y, latch_phase270_ack_y;



    // Digital
    // SPI
    spi_regs spi_regs_inst (
        .clk(clk), .rst_n(rst_n),
        .spi_cs_n(spi_cs_n), .spi_sclk(spi_sclk), .spi_mosi(spi_mosi),
        .spi_miso(spi_miso), .spi_miso_oe(spi_miso_oe),
        .cfg_f_MEMS_fcw_x(cfg_f_MEMS_fcw_x), .cfg_f_MEMS_fcw_y(cfg_f_MEMS_fcw_y),
        .cfg_phase0_offset_x(cfg_phase0_offset_x), .cfg_phase90_offset_x(cfg_phase90_offset_x), .cfg_phase270_offset_x(cfg_phase270_offset_x),
        .cfg_phase0_offset_y(cfg_phase0_offset_y), .cfg_phase90_offset_y(cfg_phase90_offset_y), .cfg_phase270_offset_y(cfg_phase270_offset_y),
        .boot_complete(boot_complete), .cfg_done(cfg_done), .phase_offset_imported(phase_offset_imported),
        .soft_rst(soft_rst),
        .delay_wave_cycle_x(delay_wave_cycle_x), .delay_wave_cycle_y(delay_wave_cycle_y),
        .raw_edge1_x(raw_edge1_x), .raw_edge2_x(raw_edge2_x), .raw_edge3_x(raw_edge3_x),
        .raw_edge1_y(raw_edge1_y), .raw_edge2_y(raw_edge2_y), .raw_edge3_y(raw_edge3_y),
        .cal_dir_x(cal_dir_x), .cal_dir_y(cal_dir_y),
        .cal_phase0_offset_x(cal_phase0_offset_x), .cal_phase90_offset_x(cal_phase90_offset_x), .cal_phase270_offset_x(cal_phase270_offset_x),
        .cal_phase0_offset_y(cal_phase0_offset_y), .cal_phase90_offset_y(cal_phase90_offset_y), .cal_phase270_offset_y(cal_phase270_offset_y),
        .cal_done_x(cal_done_x), .cal_done_y(cal_done_y),
        .cal_timeout_x(cal_timeout_x), .cal_timeout_y(cal_timeout_y),
        .latch_error_x(latch_error_x), .latch_error_y(latch_error_y),
        .jitter_flag_x(jitter_flag_x), .jitter_flag_y(jitter_flag_y),
        .phase_state_x(phase_state_x), .phase_state_y(phase_state_y),
        .votes_in_phase_x(votes_in_phase_x), .votes_out_phase_x(votes_out_phase_x),
        .votes_in_phase_y(votes_in_phase_y), .votes_out_phase_y(votes_out_phase_y),
        .state_o(state_o)
    );

    // State Machine
    state_machine state_machine_inst (
        .clk(clk), .rst_n(rst_n),
        .boot_complete(boot_complete), .cfg_done(cfg_done), .phase_offset_imported(phase_offset_imported),
        .cal_start(cal_start), .cal_done(cal_done), .cal_timeout(cal_timeout),
        .read_en(read_en),
        .soft_rst(soft_rst),
        .state_o(state_o)
    );

    // Wave Controller (X/Y)
    wave_controller wave_controller_x_inst (
        .clk(clk), .rst_n(rst_n), .soft_rst_n(soft_rst_n),
        .cfg_f_MEMS_fcw(cfg_f_MEMS_fcw_x),
        .cfg_phase0_offset(cfg_phase0_offset_x), .cfg_phase90_offset(cfg_phase90_offset_x), .cfg_phase270_offset(cfg_phase270_offset_x),
        .cfg_done(cfg_done), .cal_done(cal_done_x), .cal_timeout(cal_timeout_x),
        .cal_start(cal_start),
        .comp(comp_x),
        .latch_phase90(latch_phase90_x), .latch_phase270(latch_phase270_x),
        .latch_phase90_ack(latch_phase90_ack_x), .latch_phase270_ack(latch_phase270_ack_x),
        .mems_drv(mems_drv_x), .ref_wave(ref_wave_x),
        .delay_wave_cycle(delay_wave_cycle_x),
        .raw_edge1(raw_edge1_x), .raw_edge2(raw_edge2_x), .raw_edge3(raw_edge3_x),
        .cal_dir(cal_dir_x),
        .cal_phase0_offset(cal_phase0_offset_x), .cal_phase90_offset(cal_phase90_offset_x), .cal_phase270_offset(cal_phase270_offset_x),
        .latch_error(latch_error_x)
    );

    wave_controller wave_controller_y_inst (
        .clk(clk), .rst_n(rst_n), .soft_rst_n(soft_rst_n),
        .cfg_f_MEMS_fcw(cfg_f_MEMS_fcw_y),
        .cfg_phase0_offset(cfg_phase0_offset_y), .cfg_phase90_offset(cfg_phase90_offset_y), .cfg_phase270_offset(cfg_phase270_offset_y),
        .cfg_done(cfg_done), .cal_done(cal_done_y), .cal_timeout(cal_timeout_y),
        .cal_start(cal_start),
        .comp(comp_y),
        .latch_phase90(latch_phase90_y), .latch_phase270(latch_phase270_y),
        .latch_phase90_ack(latch_phase90_ack_y), .latch_phase270_ack(latch_phase270_ack_y),
        .mems_drv(mems_drv_y), .ref_wave(ref_wave_y),
        .delay_wave_cycle(delay_wave_cycle_y),
        .raw_edge1(raw_edge1_y), .raw_edge2(raw_edge2_y), .raw_edge3(raw_edge3_y),
        .cal_dir(cal_dir_y),
        .cal_phase0_offset(cal_phase0_offset_y), .cal_phase90_offset(cal_phase90_offset_y), .cal_phase270_offset(cal_phase270_offset_y),
        .latch_error(latch_error_y)
    );

    // Signal Processor (X/Y)
    signal_processor signal_processor_x_inst (
        .clk(clk), .rst_n(rst_n), .soft_rst_n(soft_rst_n),
        .comp_raw(comp_x),
        .latch_phase90(latch_phase90_x), .latch_phase270(latch_phase270_x),
        .latch_phase90_ack(latch_phase90_ack_x), .latch_phase270_ack(latch_phase270_ack_x),
        .dir(dir_x), .move_en(move_en_x),
        .jitter_flag(jitter_flag_x),
        .phase_state(phase_state_x),
        .votes_in_phase(votes_in_phase_x), .votes_out_phase(votes_out_phase_x)    
    );

    signal_processor signal_processor_y_inst (
        .clk(clk), .rst_n(rst_n), .soft_rst_n(soft_rst_n),
        .comp_raw(comp_y),
        .latch_phase90(latch_phase90_y), .latch_phase270(latch_phase270_y),
        .latch_phase90_ack(latch_phase90_ack_y), .latch_phase270_ack(latch_phase270_ack_y),
        .dir(dir_y), .move_en(move_en_y),
        .jitter_flag(jitter_flag_y),
        .phase_state(phase_state_y),
        .votes_in_phase(votes_in_phase_y), .votes_out_phase(votes_out_phase_y)  
    );


endmodule

`default_nettype wire