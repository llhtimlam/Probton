// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design internal header
// See Vchip_core.h for the primary calling header

#ifndef VERILATED_VCHIP_CORE___024ROOT_H_
#define VERILATED_VCHIP_CORE___024ROOT_H_  // guard

#include "verilated.h"


class Vchip_core__Syms;

class alignas(VL_CACHE_LINE_BYTES) Vchip_core___024root final : public VerilatedModule {
  public:

    // DESIGN SPECIFIC STATE
    // Anonymous structures to workaround compiler member-count bugs
    struct {
        VL_IN8(clk,0,0);
        VL_IN8(rst_n,0,0);
        VL_INOUT8(VDD,0,0);
        VL_INOUT8(VSS,0,0);
        VL_IN8(input_in,0,0);
        VL_OUT8(input_pu,0,0);
        VL_OUT8(input_pd,0,0);
        CData/*0:0*/ chip_core__DOT__analog_readout_output;
        CData/*0:0*/ chip_core__DOT__analog_error_x_output;
        CData/*0:0*/ chip_core__DOT__analog_error_y_output;
        CData/*0:0*/ chip_core__DOT__spi_miso_oe;
        CData/*0:0*/ chip_core__DOT__move_en_x;
        CData/*0:0*/ chip_core__DOT__dir_x;
        CData/*0:0*/ chip_core__DOT__move_en_y;
        CData/*0:0*/ chip_core__DOT__dir_y;
        CData/*0:0*/ chip_core__DOT__mems_drv_x;
        CData/*0:0*/ chip_core__DOT__mems_drv_y;
        CData/*0:0*/ chip_core__DOT__boot_complete;
        CData/*0:0*/ chip_core__DOT__cfg_done;
        CData/*0:0*/ chip_core__DOT__phase_offset_imported;
        CData/*0:0*/ chip_core__DOT__soft_rst_n;
        CData/*7:0*/ chip_core__DOT__delay_wave_cycle_x;
        CData/*7:0*/ chip_core__DOT__delay_wave_cycle_y;
        CData/*0:0*/ chip_core__DOT__cal_dir_x;
        CData/*0:0*/ chip_core__DOT__cal_dir_y;
        CData/*0:0*/ chip_core__DOT__latch_error_x;
        CData/*0:0*/ chip_core__DOT__latch_error_y;
        CData/*0:0*/ chip_core__DOT__jitter_flag_x;
        CData/*0:0*/ chip_core__DOT__jitter_flag_y;
        CData/*1:0*/ chip_core__DOT__phase_state_x;
        CData/*1:0*/ chip_core__DOT__phase_state_y;
        CData/*3:0*/ chip_core__DOT__votes_in_phase_x;
        CData/*3:0*/ chip_core__DOT__votes_out_phase_x;
        CData/*3:0*/ chip_core__DOT__votes_in_phase_y;
        CData/*3:0*/ chip_core__DOT__votes_out_phase_y;
        CData/*0:0*/ chip_core__DOT__cal_done_x;
        CData/*0:0*/ chip_core__DOT__cal_done_y;
        CData/*0:0*/ chip_core__DOT__cal_timeout_x;
        CData/*0:0*/ chip_core__DOT__cal_timeout_y;
        CData/*0:0*/ chip_core__DOT__cal_start;
        CData/*0:0*/ chip_core__DOT__comp_x;
        CData/*0:0*/ chip_core__DOT__comp_y;
        CData/*0:0*/ chip_core__DOT__latch_phase90_x;
        CData/*0:0*/ chip_core__DOT__latch_phase270_x;
        CData/*0:0*/ chip_core__DOT__latch_phase90_ack_x;
        CData/*0:0*/ chip_core__DOT__latch_phase270_ack_x;
        CData/*0:0*/ chip_core__DOT__latch_phase90_y;
        CData/*0:0*/ chip_core__DOT__latch_phase270_y;
        CData/*0:0*/ chip_core__DOT__latch_phase90_ack_y;
        CData/*0:0*/ chip_core__DOT__latch_phase270_ack_y;
        CData/*1:0*/ chip_core__DOT__spi_regs_inst__DOT__cs_sync;
        CData/*1:0*/ chip_core__DOT__spi_regs_inst__DOT__sclk_sync;
        CData/*1:0*/ chip_core__DOT__spi_regs_inst__DOT__mosi_sync;
        CData/*0:0*/ chip_core__DOT__spi_regs_inst__DOT__sclk_d;
        CData/*0:0*/ chip_core__DOT__spi_regs_inst__DOT__sclk_rise;
        CData/*0:0*/ chip_core__DOT__spi_regs_inst__DOT__spi_state;
        CData/*2:0*/ chip_core__DOT__spi_regs_inst__DOT__bit_cnt;
        CData/*0:0*/ chip_core__DOT__spi_regs_inst__DOT__rw_n;
        CData/*6:0*/ chip_core__DOT__spi_regs_inst__DOT__spi_addr;
        CData/*7:0*/ chip_core__DOT__spi_regs_inst__DOT__rx_shift;
        CData/*7:0*/ chip_core__DOT__spi_regs_inst__DOT__tx_shift;
        CData/*0:0*/ chip_core__DOT__spi_regs_inst__DOT__reg_wr_en;
        CData/*6:0*/ chip_core__DOT__spi_regs_inst__DOT__reg_wr_addr;
        CData/*7:0*/ chip_core__DOT__spi_regs_inst__DOT__reg_wr_data;
    };
    struct {
        CData/*7:0*/ chip_core__DOT__spi_regs_inst__DOT__rx_shift_next;
        CData/*7:0*/ chip_core__DOT__spi_regs_inst__DOT__reg_rd_data;
        CData/*2:0*/ chip_core__DOT__state_machine_inst__DOT__state_q;
        CData/*2:0*/ chip_core__DOT__state_machine_inst__DOT__state_d;
        CData/*0:0*/ chip_core__DOT__wave_controller_x_inst__DOT__nco_en;
        CData/*0:0*/ chip_core__DOT__wave_controller_x_inst__DOT__phase_overflow;
        CData/*0:0*/ chip_core__DOT__wave_controller_x_inst__DOT__comp_sync0;
        CData/*0:0*/ chip_core__DOT__wave_controller_x_inst__DOT__comp_sync1;
        CData/*0:0*/ chip_core__DOT__wave_controller_x_inst__DOT__comp_sync2;
        CData/*0:0*/ chip_core__DOT__wave_controller_x_inst__DOT__comp_sync3;
        CData/*0:0*/ chip_core__DOT__wave_controller_x_inst__DOT__comp_sync4;
        CData/*0:0*/ chip_core__DOT__wave_controller_x_inst__DOT__comp_posedge;
        CData/*0:0*/ chip_core__DOT__wave_controller_x_inst__DOT__comp_negedge;
        CData/*7:0*/ chip_core__DOT__wave_controller_x_inst__DOT__wave_cycle_cnt;
        CData/*0:0*/ chip_core__DOT__wave_controller_x_inst__DOT__capture_pending;
        CData/*1:0*/ chip_core__DOT__wave_controller_x_inst__DOT__capture_step;
        CData/*7:0*/ chip_core__DOT__wave_controller_x_inst__DOT__cycle_delta;
        CData/*0:0*/ chip_core__DOT__wave_controller_x_inst__DOT__wave_is_valid;
        CData/*7:0*/ chip_core__DOT__wave_controller_x_inst__DOT__ds_code;
        CData/*0:0*/ chip_core__DOT__wave_controller_x_inst__DOT__cal_burst_armed;
        CData/*0:0*/ chip_core__DOT__wave_controller_x_inst__DOT__cal_burst_active;
        CData/*1:0*/ chip_core__DOT__wave_controller_x_inst__DOT__cal_burst_count;
        CData/*0:0*/ chip_core__DOT__wave_controller_y_inst__DOT__phase_overflow;
        CData/*0:0*/ chip_core__DOT__wave_controller_y_inst__DOT__comp_sync0;
        CData/*0:0*/ chip_core__DOT__wave_controller_y_inst__DOT__comp_sync1;
        CData/*0:0*/ chip_core__DOT__wave_controller_y_inst__DOT__comp_sync2;
        CData/*0:0*/ chip_core__DOT__wave_controller_y_inst__DOT__comp_sync3;
        CData/*0:0*/ chip_core__DOT__wave_controller_y_inst__DOT__comp_sync4;
        CData/*0:0*/ chip_core__DOT__wave_controller_y_inst__DOT__comp_posedge;
        CData/*0:0*/ chip_core__DOT__wave_controller_y_inst__DOT__comp_negedge;
        CData/*7:0*/ chip_core__DOT__wave_controller_y_inst__DOT__wave_cycle_cnt;
        CData/*0:0*/ chip_core__DOT__wave_controller_y_inst__DOT__capture_pending;
        CData/*1:0*/ chip_core__DOT__wave_controller_y_inst__DOT__capture_step;
        CData/*7:0*/ chip_core__DOT__wave_controller_y_inst__DOT__cycle_delta;
        CData/*0:0*/ chip_core__DOT__wave_controller_y_inst__DOT__wave_is_valid;
        CData/*7:0*/ chip_core__DOT__wave_controller_y_inst__DOT__ds_code;
        CData/*0:0*/ chip_core__DOT__wave_controller_y_inst__DOT__cal_burst_armed;
        CData/*0:0*/ chip_core__DOT__wave_controller_y_inst__DOT__cal_burst_active;
        CData/*1:0*/ chip_core__DOT__wave_controller_y_inst__DOT__cal_burst_count;
        CData/*3:0*/ chip_core__DOT__signal_processor_x_inst__DOT__comp_pipe;
        CData/*3:0*/ chip_core__DOT__signal_processor_x_inst__DOT__s90_pipe;
        CData/*3:0*/ chip_core__DOT__signal_processor_x_inst__DOT__s270_pipe;
        CData/*0:0*/ chip_core__DOT__signal_processor_x_inst__DOT__s90;
        CData/*0:0*/ chip_core__DOT__signal_processor_x_inst__DOT__s90_valid;
        CData/*0:0*/ chip_core__DOT__signal_processor_x_inst__DOT__vote_now;
        CData/*1:0*/ chip_core__DOT__signal_processor_x_inst__DOT__state_now;
        CData/*3:0*/ chip_core__DOT__signal_processor_x_inst__DOT__cnt_in;
        CData/*3:0*/ chip_core__DOT__signal_processor_x_inst__DOT__cnt_out;
        CData/*3:0*/ chip_core__DOT__signal_processor_x_inst__DOT__next_in;
        CData/*3:0*/ chip_core__DOT__signal_processor_x_inst__DOT__next_out;
        CData/*3:0*/ chip_core__DOT__signal_processor_x_inst__DOT__cycle_count;
        CData/*0:0*/ chip_core__DOT__signal_processor_x_inst__DOT__window_done;
        CData/*3:0*/ chip_core__DOT__signal_processor_y_inst__DOT__comp_pipe;
        CData/*3:0*/ chip_core__DOT__signal_processor_y_inst__DOT__s90_pipe;
        CData/*3:0*/ chip_core__DOT__signal_processor_y_inst__DOT__s270_pipe;
        CData/*0:0*/ chip_core__DOT__signal_processor_y_inst__DOT__s90;
        CData/*0:0*/ chip_core__DOT__signal_processor_y_inst__DOT__s90_valid;
        CData/*0:0*/ chip_core__DOT__signal_processor_y_inst__DOT__vote_now;
        CData/*1:0*/ chip_core__DOT__signal_processor_y_inst__DOT__state_now;
        CData/*3:0*/ chip_core__DOT__signal_processor_y_inst__DOT__cnt_in;
        CData/*3:0*/ chip_core__DOT__signal_processor_y_inst__DOT__cnt_out;
        CData/*3:0*/ chip_core__DOT__signal_processor_y_inst__DOT__next_in;
        CData/*3:0*/ chip_core__DOT__signal_processor_y_inst__DOT__next_out;
        CData/*3:0*/ chip_core__DOT__signal_processor_y_inst__DOT__cycle_count;
    };
    struct {
        CData/*0:0*/ chip_core__DOT__signal_processor_y_inst__DOT__window_done;
        CData/*0:0*/ __VstlFirstIteration;
        CData/*0:0*/ __Vtrigprevexpr___TOP__clk__0;
        CData/*0:0*/ __Vtrigprevexpr___TOP__rst_n__0;
        CData/*0:0*/ __VactContinue;
        SData/*15:0*/ chip_core__DOT__cfg_f_MEMS_fcw_x;
        SData/*15:0*/ chip_core__DOT__cfg_f_MEMS_fcw_y;
        SData/*8:0*/ chip_core__DOT__wave_controller_x_inst__DOT__ds_acc;
        SData/*8:0*/ chip_core__DOT__wave_controller_y_inst__DOT__ds_acc;
        VL_IN(bidir_in,19,0);
        VL_OUT(bidir_out,19,0);
        VL_OUT(bidir_oe,19,0);
        VL_OUT(bidir_cs,19,0);
        VL_OUT(bidir_sl,19,0);
        VL_OUT(bidir_ie,19,0);
        VL_OUT(bidir_pu,19,0);
        VL_OUT(bidir_pd,19,0);
        IData/*20:0*/ chip_core__DOT__cfg_phase0_offset_x;
        IData/*20:0*/ chip_core__DOT__cfg_phase90_offset_x;
        IData/*20:0*/ chip_core__DOT__cfg_phase270_offset_x;
        IData/*20:0*/ chip_core__DOT__cfg_phase0_offset_y;
        IData/*20:0*/ chip_core__DOT__cfg_phase90_offset_y;
        IData/*20:0*/ chip_core__DOT__cfg_phase270_offset_y;
        IData/*20:0*/ chip_core__DOT__raw_edge1_x;
        IData/*20:0*/ chip_core__DOT__raw_edge2_x;
        IData/*20:0*/ chip_core__DOT__raw_edge3_x;
        IData/*20:0*/ chip_core__DOT__raw_edge1_y;
        IData/*20:0*/ chip_core__DOT__raw_edge2_y;
        IData/*20:0*/ chip_core__DOT__raw_edge3_y;
        IData/*20:0*/ chip_core__DOT__wave_controller_x_inst__DOT__phase_acc;
        IData/*21:0*/ chip_core__DOT__wave_controller_x_inst__DOT__phase_next;
        IData/*20:0*/ chip_core__DOT__wave_controller_x_inst__DOT__step_baseline;
        IData/*20:0*/ chip_core__DOT__wave_controller_y_inst__DOT__phase_acc;
        IData/*21:0*/ chip_core__DOT__wave_controller_y_inst__DOT__phase_next;
        IData/*20:0*/ chip_core__DOT__wave_controller_y_inst__DOT__step_baseline;
        IData/*31:0*/ __VactIterCount;
        VL_INOUT64(analog,59,0);
        QData/*59:0*/ chip_core__DOT__analog__out__strong__out20;
    };
    VlTriggerVec<1> __VstlTriggered;
    VlTriggerVec<2> __VactTriggered;
    VlTriggerVec<2> __VnbaTriggered;

    // INTERNAL VARIABLES
    Vchip_core__Syms* const vlSymsp;

    // CONSTRUCTORS
    Vchip_core___024root(Vchip_core__Syms* symsp, const char* v__name);
    ~Vchip_core___024root();
    VL_UNCOPYABLE(Vchip_core___024root);

    // INTERNAL METHODS
    void __Vconfigure(bool first);
};


#endif  // guard
