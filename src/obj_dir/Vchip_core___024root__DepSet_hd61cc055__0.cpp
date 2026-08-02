// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vchip_core.h for the primary calling header

#include "Vchip_core__pch.h"
#include "Vchip_core___024root.h"

void Vchip_core___024root___eval_act(Vchip_core___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    Vchip_core__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vchip_core___024root___eval_act\n"); );
    auto& vlSelfRef = std::ref(*vlSelf).get();
}

void Vchip_core___024root___nba_sequent__TOP__0(Vchip_core___024root* vlSelf);

void Vchip_core___024root___eval_nba(Vchip_core___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    Vchip_core__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vchip_core___024root___eval_nba\n"); );
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    if ((3ULL & vlSelfRef.__VnbaTriggered.word(0U))) {
        Vchip_core___024root___nba_sequent__TOP__0(vlSelf);
    }
}

extern const VlUnpacked<CData/*6:0*/, 64> Vchip_core__ConstPool__TABLE_hf93cdd76_0;
extern const VlUnpacked<CData/*2:0*/, 512> Vchip_core__ConstPool__TABLE_hb77d79b6_0;

VL_INLINE_OPT void Vchip_core___024root___nba_sequent__TOP__0(Vchip_core___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    Vchip_core__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vchip_core___024root___nba_sequent__TOP__0\n"); );
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Init
    IData/*20:0*/ chip_core__DOT__cal_phase0_offset_x;
    chip_core__DOT__cal_phase0_offset_x = 0;
    IData/*20:0*/ chip_core__DOT__cal_phase90_offset_x;
    chip_core__DOT__cal_phase90_offset_x = 0;
    IData/*20:0*/ chip_core__DOT__cal_phase270_offset_x;
    chip_core__DOT__cal_phase270_offset_x = 0;
    IData/*20:0*/ chip_core__DOT__cal_phase0_offset_y;
    chip_core__DOT__cal_phase0_offset_y = 0;
    IData/*20:0*/ chip_core__DOT__cal_phase90_offset_y;
    chip_core__DOT__cal_phase90_offset_y = 0;
    IData/*20:0*/ chip_core__DOT__cal_phase270_offset_y;
    chip_core__DOT__cal_phase270_offset_y = 0;
    IData/*20:0*/ chip_core__DOT__wave_controller_x_inst__DOT__raw_delta;
    chip_core__DOT__wave_controller_x_inst__DOT__raw_delta = 0;
    CData/*7:0*/ chip_core__DOT__wave_controller_x_inst__DOT__sine_amp;
    chip_core__DOT__wave_controller_x_inst__DOT__sine_amp = 0;
    CData/*6:0*/ chip_core__DOT__wave_controller_x_inst__DOT__u_sine__DOT__q_val;
    chip_core__DOT__wave_controller_x_inst__DOT__u_sine__DOT__q_val = 0;
    IData/*20:0*/ chip_core__DOT__wave_controller_y_inst__DOT__raw_delta;
    chip_core__DOT__wave_controller_y_inst__DOT__raw_delta = 0;
    CData/*7:0*/ chip_core__DOT__wave_controller_y_inst__DOT__sine_amp;
    chip_core__DOT__wave_controller_y_inst__DOT__sine_amp = 0;
    CData/*6:0*/ chip_core__DOT__wave_controller_y_inst__DOT__u_sine__DOT__q_val;
    chip_core__DOT__wave_controller_y_inst__DOT__u_sine__DOT__q_val = 0;
    SData/*8:0*/ __Vtableidx1;
    __Vtableidx1 = 0;
    CData/*5:0*/ __Vtableidx2;
    __Vtableidx2 = 0;
    CData/*5:0*/ __Vtableidx3;
    __Vtableidx3 = 0;
    CData/*1:0*/ __Vdly__chip_core__DOT__spi_regs_inst__DOT__cs_sync;
    __Vdly__chip_core__DOT__spi_regs_inst__DOT__cs_sync = 0;
    CData/*1:0*/ __Vdly__chip_core__DOT__spi_regs_inst__DOT__sclk_sync;
    __Vdly__chip_core__DOT__spi_regs_inst__DOT__sclk_sync = 0;
    CData/*0:0*/ __Vdly__chip_core__DOT__spi_regs_inst__DOT__spi_state;
    __Vdly__chip_core__DOT__spi_regs_inst__DOT__spi_state = 0;
    CData/*2:0*/ __Vdly__chip_core__DOT__spi_regs_inst__DOT__bit_cnt;
    __Vdly__chip_core__DOT__spi_regs_inst__DOT__bit_cnt = 0;
    CData/*7:0*/ __Vdly__chip_core__DOT__wave_controller_x_inst__DOT__wave_cycle_cnt;
    __Vdly__chip_core__DOT__wave_controller_x_inst__DOT__wave_cycle_cnt = 0;
    CData/*0:0*/ __Vdly__chip_core__DOT__wave_controller_x_inst__DOT__capture_pending;
    __Vdly__chip_core__DOT__wave_controller_x_inst__DOT__capture_pending = 0;
    CData/*1:0*/ __Vdly__chip_core__DOT__wave_controller_x_inst__DOT__capture_step;
    __Vdly__chip_core__DOT__wave_controller_x_inst__DOT__capture_step = 0;
    CData/*0:0*/ __Vdly__chip_core__DOT__latch_phase90_x;
    __Vdly__chip_core__DOT__latch_phase90_x = 0;
    CData/*0:0*/ __Vdly__chip_core__DOT__latch_phase270_x;
    __Vdly__chip_core__DOT__latch_phase270_x = 0;
    SData/*8:0*/ __Vdly__chip_core__DOT__wave_controller_x_inst__DOT__ds_acc;
    __Vdly__chip_core__DOT__wave_controller_x_inst__DOT__ds_acc = 0;
    CData/*0:0*/ __Vdly__chip_core__DOT__wave_controller_x_inst__DOT__cal_burst_active;
    __Vdly__chip_core__DOT__wave_controller_x_inst__DOT__cal_burst_active = 0;
    CData/*1:0*/ __Vdly__chip_core__DOT__wave_controller_x_inst__DOT__cal_burst_count;
    __Vdly__chip_core__DOT__wave_controller_x_inst__DOT__cal_burst_count = 0;
    CData/*7:0*/ __Vdly__chip_core__DOT__wave_controller_y_inst__DOT__wave_cycle_cnt;
    __Vdly__chip_core__DOT__wave_controller_y_inst__DOT__wave_cycle_cnt = 0;
    CData/*0:0*/ __Vdly__chip_core__DOT__wave_controller_y_inst__DOT__capture_pending;
    __Vdly__chip_core__DOT__wave_controller_y_inst__DOT__capture_pending = 0;
    CData/*1:0*/ __Vdly__chip_core__DOT__wave_controller_y_inst__DOT__capture_step;
    __Vdly__chip_core__DOT__wave_controller_y_inst__DOT__capture_step = 0;
    CData/*0:0*/ __Vdly__chip_core__DOT__latch_phase90_y;
    __Vdly__chip_core__DOT__latch_phase90_y = 0;
    CData/*0:0*/ __Vdly__chip_core__DOT__latch_phase270_y;
    __Vdly__chip_core__DOT__latch_phase270_y = 0;
    SData/*8:0*/ __Vdly__chip_core__DOT__wave_controller_y_inst__DOT__ds_acc;
    __Vdly__chip_core__DOT__wave_controller_y_inst__DOT__ds_acc = 0;
    CData/*0:0*/ __Vdly__chip_core__DOT__wave_controller_y_inst__DOT__cal_burst_active;
    __Vdly__chip_core__DOT__wave_controller_y_inst__DOT__cal_burst_active = 0;
    CData/*1:0*/ __Vdly__chip_core__DOT__wave_controller_y_inst__DOT__cal_burst_count;
    __Vdly__chip_core__DOT__wave_controller_y_inst__DOT__cal_burst_count = 0;
    CData/*3:0*/ __Vdly__chip_core__DOT__signal_processor_x_inst__DOT__comp_pipe;
    __Vdly__chip_core__DOT__signal_processor_x_inst__DOT__comp_pipe = 0;
    CData/*3:0*/ __Vdly__chip_core__DOT__signal_processor_x_inst__DOT__s90_pipe;
    __Vdly__chip_core__DOT__signal_processor_x_inst__DOT__s90_pipe = 0;
    CData/*3:0*/ __Vdly__chip_core__DOT__signal_processor_x_inst__DOT__s270_pipe;
    __Vdly__chip_core__DOT__signal_processor_x_inst__DOT__s270_pipe = 0;
    CData/*3:0*/ __Vdly__chip_core__DOT__signal_processor_y_inst__DOT__comp_pipe;
    __Vdly__chip_core__DOT__signal_processor_y_inst__DOT__comp_pipe = 0;
    CData/*3:0*/ __Vdly__chip_core__DOT__signal_processor_y_inst__DOT__s90_pipe;
    __Vdly__chip_core__DOT__signal_processor_y_inst__DOT__s90_pipe = 0;
    CData/*3:0*/ __Vdly__chip_core__DOT__signal_processor_y_inst__DOT__s270_pipe;
    __Vdly__chip_core__DOT__signal_processor_y_inst__DOT__s270_pipe = 0;
    // Body
    __Vdly__chip_core__DOT__wave_controller_x_inst__DOT__ds_acc 
        = vlSelfRef.chip_core__DOT__wave_controller_x_inst__DOT__ds_acc;
    __Vdly__chip_core__DOT__wave_controller_y_inst__DOT__ds_acc 
        = vlSelfRef.chip_core__DOT__wave_controller_y_inst__DOT__ds_acc;
    __Vdly__chip_core__DOT__spi_regs_inst__DOT__cs_sync 
        = vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__cs_sync;
    __Vdly__chip_core__DOT__spi_regs_inst__DOT__sclk_sync 
        = vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__sclk_sync;
    __Vdly__chip_core__DOT__spi_regs_inst__DOT__spi_state 
        = vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__spi_state;
    __Vdly__chip_core__DOT__spi_regs_inst__DOT__bit_cnt 
        = vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__bit_cnt;
    __Vdly__chip_core__DOT__signal_processor_x_inst__DOT__s90_pipe 
        = vlSelfRef.chip_core__DOT__signal_processor_x_inst__DOT__s90_pipe;
    __Vdly__chip_core__DOT__signal_processor_y_inst__DOT__s90_pipe 
        = vlSelfRef.chip_core__DOT__signal_processor_y_inst__DOT__s90_pipe;
    __Vdly__chip_core__DOT__signal_processor_x_inst__DOT__comp_pipe 
        = vlSelfRef.chip_core__DOT__signal_processor_x_inst__DOT__comp_pipe;
    __Vdly__chip_core__DOT__signal_processor_y_inst__DOT__comp_pipe 
        = vlSelfRef.chip_core__DOT__signal_processor_y_inst__DOT__comp_pipe;
    __Vdly__chip_core__DOT__signal_processor_x_inst__DOT__s270_pipe 
        = vlSelfRef.chip_core__DOT__signal_processor_x_inst__DOT__s270_pipe;
    __Vdly__chip_core__DOT__signal_processor_y_inst__DOT__s270_pipe 
        = vlSelfRef.chip_core__DOT__signal_processor_y_inst__DOT__s270_pipe;
    __Vdly__chip_core__DOT__wave_controller_x_inst__DOT__cal_burst_count 
        = vlSelfRef.chip_core__DOT__wave_controller_x_inst__DOT__cal_burst_count;
    __Vdly__chip_core__DOT__wave_controller_y_inst__DOT__cal_burst_count 
        = vlSelfRef.chip_core__DOT__wave_controller_y_inst__DOT__cal_burst_count;
    __Vdly__chip_core__DOT__wave_controller_x_inst__DOT__cal_burst_active 
        = vlSelfRef.chip_core__DOT__wave_controller_x_inst__DOT__cal_burst_active;
    __Vdly__chip_core__DOT__wave_controller_y_inst__DOT__cal_burst_active 
        = vlSelfRef.chip_core__DOT__wave_controller_y_inst__DOT__cal_burst_active;
    __Vdly__chip_core__DOT__wave_controller_x_inst__DOT__capture_pending 
        = vlSelfRef.chip_core__DOT__wave_controller_x_inst__DOT__capture_pending;
    __Vdly__chip_core__DOT__wave_controller_y_inst__DOT__capture_pending 
        = vlSelfRef.chip_core__DOT__wave_controller_y_inst__DOT__capture_pending;
    __Vdly__chip_core__DOT__wave_controller_x_inst__DOT__wave_cycle_cnt 
        = vlSelfRef.chip_core__DOT__wave_controller_x_inst__DOT__wave_cycle_cnt;
    __Vdly__chip_core__DOT__wave_controller_y_inst__DOT__wave_cycle_cnt 
        = vlSelfRef.chip_core__DOT__wave_controller_y_inst__DOT__wave_cycle_cnt;
    __Vdly__chip_core__DOT__wave_controller_x_inst__DOT__capture_step 
        = vlSelfRef.chip_core__DOT__wave_controller_x_inst__DOT__capture_step;
    __Vdly__chip_core__DOT__wave_controller_y_inst__DOT__capture_step 
        = vlSelfRef.chip_core__DOT__wave_controller_y_inst__DOT__capture_step;
    __Vdly__chip_core__DOT__latch_phase90_x = vlSelfRef.chip_core__DOT__latch_phase90_x;
    __Vdly__chip_core__DOT__latch_phase270_x = vlSelfRef.chip_core__DOT__latch_phase270_x;
    __Vdly__chip_core__DOT__latch_phase90_y = vlSelfRef.chip_core__DOT__latch_phase90_y;
    __Vdly__chip_core__DOT__latch_phase270_y = vlSelfRef.chip_core__DOT__latch_phase270_y;
    vlSelfRef.chip_core__DOT__spi_miso_oe = ((IData)(vlSelfRef.rst_n) 
                                             && (1U 
                                                 & (~ 
                                                    ((IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__cs_sync) 
                                                     >> 1U))));
    vlSelfRef.chip_core__DOT__mems_drv_x = ((IData)(vlSelfRef.rst_n) 
                                            && (1U 
                                                & ((IData)(vlSelfRef.chip_core__DOT__cfg_done)
                                                    ? 
                                                   ((IData)(vlSelfRef.chip_core__DOT__cal_start)
                                                     ? 
                                                    ((IData)(vlSelfRef.chip_core__DOT__wave_controller_x_inst__DOT__ds_acc) 
                                                     >> 8U)
                                                     : 
                                                    ((IData)(vlSelfRef.chip_core__DOT__wave_controller_x_inst__DOT__ds_acc) 
                                                     >> 8U))
                                                    : 
                                                   ((IData)(vlSelfRef.chip_core__DOT__wave_controller_x_inst__DOT__ds_acc) 
                                                    >> 8U))));
    vlSelfRef.chip_core__DOT__mems_drv_y = ((IData)(vlSelfRef.rst_n) 
                                            && (1U 
                                                & ((IData)(vlSelfRef.chip_core__DOT__cfg_done)
                                                    ? 
                                                   ((IData)(vlSelfRef.chip_core__DOT__cal_start)
                                                     ? 
                                                    ((IData)(vlSelfRef.chip_core__DOT__wave_controller_y_inst__DOT__ds_acc) 
                                                     >> 8U)
                                                     : 
                                                    ((IData)(vlSelfRef.chip_core__DOT__wave_controller_y_inst__DOT__ds_acc) 
                                                     >> 8U))
                                                    : 
                                                   ((IData)(vlSelfRef.chip_core__DOT__wave_controller_y_inst__DOT__ds_acc) 
                                                    >> 8U))));
    vlSelfRef.chip_core__DOT__wave_controller_x_inst__DOT__comp_sync4 
        = ((IData)(vlSelfRef.rst_n) && ((IData)(vlSelfRef.chip_core__DOT__soft_rst_n) 
                                        && (IData)(vlSelfRef.chip_core__DOT__wave_controller_x_inst__DOT__comp_sync3)));
    vlSelfRef.chip_core__DOT__wave_controller_y_inst__DOT__comp_sync4 
        = ((IData)(vlSelfRef.rst_n) && ((IData)(vlSelfRef.chip_core__DOT__soft_rst_n) 
                                        && (IData)(vlSelfRef.chip_core__DOT__wave_controller_y_inst__DOT__comp_sync3)));
    if (vlSelfRef.rst_n) {
        __Vdly__chip_core__DOT__wave_controller_x_inst__DOT__ds_acc 
            = (0x1ffU & ((0xffU & (IData)(vlSelfRef.chip_core__DOT__wave_controller_x_inst__DOT__ds_acc)) 
                         + (IData)(vlSelfRef.chip_core__DOT__wave_controller_x_inst__DOT__ds_code)));
        __Vdly__chip_core__DOT__wave_controller_y_inst__DOT__ds_acc 
            = (0x1ffU & ((0xffU & (IData)(vlSelfRef.chip_core__DOT__wave_controller_y_inst__DOT__ds_acc)) 
                         + (IData)(vlSelfRef.chip_core__DOT__wave_controller_y_inst__DOT__ds_code)));
        __Vdly__chip_core__DOT__spi_regs_inst__DOT__cs_sync 
            = ((2U & ((IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__cs_sync) 
                      << 1U)) | (1U & vlSelfRef.bidir_in));
        vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__mosi_sync 
            = ((2U & ((IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__mosi_sync) 
                      << 1U)) | (1U & (vlSelfRef.bidir_in 
                                       >> 2U)));
        __Vdly__chip_core__DOT__spi_regs_inst__DOT__sclk_sync 
            = ((2U & ((IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__sclk_sync) 
                      << 1U)) | (1U & (vlSelfRef.bidir_in 
                                       >> 1U)));
        if (vlSelfRef.chip_core__DOT__soft_rst_n) {
            __Vdly__chip_core__DOT__signal_processor_x_inst__DOT__s90_pipe 
                = ((0xeU & ((IData)(vlSelfRef.chip_core__DOT__signal_processor_x_inst__DOT__s90_pipe) 
                            << 1U)) | (IData)(vlSelfRef.chip_core__DOT__latch_phase90_x));
            __Vdly__chip_core__DOT__signal_processor_y_inst__DOT__s90_pipe 
                = ((0xeU & ((IData)(vlSelfRef.chip_core__DOT__signal_processor_y_inst__DOT__s90_pipe) 
                            << 1U)) | (IData)(vlSelfRef.chip_core__DOT__latch_phase90_y));
            __Vdly__chip_core__DOT__signal_processor_x_inst__DOT__comp_pipe 
                = ((0xeU & ((IData)(vlSelfRef.chip_core__DOT__signal_processor_x_inst__DOT__comp_pipe) 
                            << 1U)) | (IData)(vlSelfRef.chip_core__DOT__comp_x));
            __Vdly__chip_core__DOT__signal_processor_y_inst__DOT__comp_pipe 
                = ((0xeU & ((IData)(vlSelfRef.chip_core__DOT__signal_processor_y_inst__DOT__comp_pipe) 
                            << 1U)) | (IData)(vlSelfRef.chip_core__DOT__comp_y));
            __Vdly__chip_core__DOT__signal_processor_x_inst__DOT__s270_pipe 
                = ((0xeU & ((IData)(vlSelfRef.chip_core__DOT__signal_processor_x_inst__DOT__s270_pipe) 
                            << 1U)) | (IData)(vlSelfRef.chip_core__DOT__latch_phase270_x));
            __Vdly__chip_core__DOT__signal_processor_y_inst__DOT__s270_pipe 
                = ((0xeU & ((IData)(vlSelfRef.chip_core__DOT__signal_processor_y_inst__DOT__s270_pipe) 
                            << 1U)) | (IData)(vlSelfRef.chip_core__DOT__latch_phase270_y));
            if ((8U & (IData)(vlSelfRef.chip_core__DOT__signal_processor_x_inst__DOT__s90_pipe))) {
                vlSelfRef.chip_core__DOT__signal_processor_x_inst__DOT__s90 
                    = (1U & ((IData)(vlSelfRef.chip_core__DOT__signal_processor_x_inst__DOT__comp_pipe) 
                             >> 3U));
                vlSelfRef.chip_core__DOT__signal_processor_x_inst__DOT__s90_valid = 1U;
            }
            if (vlSelfRef.chip_core__DOT__signal_processor_x_inst__DOT__vote_now) {
                if (vlSelfRef.chip_core__DOT__signal_processor_x_inst__DOT__window_done) {
                    vlSelfRef.chip_core__DOT__signal_processor_x_inst__DOT__cycle_count = 0U;
                    vlSelfRef.chip_core__DOT__signal_processor_x_inst__DOT__cnt_out = 0U;
                    vlSelfRef.chip_core__DOT__signal_processor_x_inst__DOT__cnt_in = 0U;
                    if ((0xdU <= (IData)(vlSelfRef.chip_core__DOT__signal_processor_x_inst__DOT__next_in))) {
                        vlSelfRef.chip_core__DOT__dir_x = 1U;
                    } else if ((0xdU <= (IData)(vlSelfRef.chip_core__DOT__signal_processor_x_inst__DOT__next_out))) {
                        vlSelfRef.chip_core__DOT__dir_x = 0U;
                    }
                    vlSelfRef.chip_core__DOT__move_en_x 
                        = ((0xdU <= (IData)(vlSelfRef.chip_core__DOT__signal_processor_x_inst__DOT__next_in)) 
                           || (0xdU <= (IData)(vlSelfRef.chip_core__DOT__signal_processor_x_inst__DOT__next_out)));
                    vlSelfRef.chip_core__DOT__votes_in_phase_x 
                        = vlSelfRef.chip_core__DOT__signal_processor_x_inst__DOT__next_in;
                    vlSelfRef.chip_core__DOT__votes_out_phase_x 
                        = vlSelfRef.chip_core__DOT__signal_processor_x_inst__DOT__next_out;
                    vlSelfRef.chip_core__DOT__jitter_flag_x 
                        = ((0xdU > (IData)(vlSelfRef.chip_core__DOT__signal_processor_x_inst__DOT__next_in)) 
                           && (0xdU > (IData)(vlSelfRef.chip_core__DOT__signal_processor_x_inst__DOT__next_out)));
                } else {
                    vlSelfRef.chip_core__DOT__signal_processor_x_inst__DOT__cycle_count 
                        = (0xfU & ((IData)(1U) + (IData)(vlSelfRef.chip_core__DOT__signal_processor_x_inst__DOT__cycle_count)));
                    vlSelfRef.chip_core__DOT__signal_processor_x_inst__DOT__cnt_out 
                        = vlSelfRef.chip_core__DOT__signal_processor_x_inst__DOT__next_out;
                    vlSelfRef.chip_core__DOT__signal_processor_x_inst__DOT__cnt_in 
                        = vlSelfRef.chip_core__DOT__signal_processor_x_inst__DOT__next_in;
                }
                vlSelfRef.chip_core__DOT__signal_processor_x_inst__DOT__s90_valid = 0U;
                vlSelfRef.chip_core__DOT__phase_state_x 
                    = vlSelfRef.chip_core__DOT__signal_processor_x_inst__DOT__state_now;
            }
            if ((8U & (IData)(vlSelfRef.chip_core__DOT__signal_processor_y_inst__DOT__s90_pipe))) {
                vlSelfRef.chip_core__DOT__signal_processor_y_inst__DOT__s90 
                    = (1U & ((IData)(vlSelfRef.chip_core__DOT__signal_processor_y_inst__DOT__comp_pipe) 
                             >> 3U));
                vlSelfRef.chip_core__DOT__signal_processor_y_inst__DOT__s90_valid = 1U;
            }
            if (vlSelfRef.chip_core__DOT__signal_processor_y_inst__DOT__vote_now) {
                if (vlSelfRef.chip_core__DOT__signal_processor_y_inst__DOT__window_done) {
                    vlSelfRef.chip_core__DOT__signal_processor_y_inst__DOT__cycle_count = 0U;
                    vlSelfRef.chip_core__DOT__signal_processor_y_inst__DOT__cnt_out = 0U;
                    vlSelfRef.chip_core__DOT__signal_processor_y_inst__DOT__cnt_in = 0U;
                    if ((0xdU <= (IData)(vlSelfRef.chip_core__DOT__signal_processor_y_inst__DOT__next_in))) {
                        vlSelfRef.chip_core__DOT__dir_y = 1U;
                    } else if ((0xdU <= (IData)(vlSelfRef.chip_core__DOT__signal_processor_y_inst__DOT__next_out))) {
                        vlSelfRef.chip_core__DOT__dir_y = 0U;
                    }
                    vlSelfRef.chip_core__DOT__move_en_y 
                        = ((0xdU <= (IData)(vlSelfRef.chip_core__DOT__signal_processor_y_inst__DOT__next_in)) 
                           || (0xdU <= (IData)(vlSelfRef.chip_core__DOT__signal_processor_y_inst__DOT__next_out)));
                    vlSelfRef.chip_core__DOT__votes_in_phase_y 
                        = vlSelfRef.chip_core__DOT__signal_processor_y_inst__DOT__next_in;
                    vlSelfRef.chip_core__DOT__votes_out_phase_y 
                        = vlSelfRef.chip_core__DOT__signal_processor_y_inst__DOT__next_out;
                    vlSelfRef.chip_core__DOT__jitter_flag_y 
                        = ((0xdU > (IData)(vlSelfRef.chip_core__DOT__signal_processor_y_inst__DOT__next_in)) 
                           && (0xdU > (IData)(vlSelfRef.chip_core__DOT__signal_processor_y_inst__DOT__next_out)));
                } else {
                    vlSelfRef.chip_core__DOT__signal_processor_y_inst__DOT__cycle_count 
                        = (0xfU & ((IData)(1U) + (IData)(vlSelfRef.chip_core__DOT__signal_processor_y_inst__DOT__cycle_count)));
                    vlSelfRef.chip_core__DOT__signal_processor_y_inst__DOT__cnt_out 
                        = vlSelfRef.chip_core__DOT__signal_processor_y_inst__DOT__next_out;
                    vlSelfRef.chip_core__DOT__signal_processor_y_inst__DOT__cnt_in 
                        = vlSelfRef.chip_core__DOT__signal_processor_y_inst__DOT__next_in;
                }
                vlSelfRef.chip_core__DOT__signal_processor_y_inst__DOT__s90_valid = 0U;
                vlSelfRef.chip_core__DOT__phase_state_y 
                    = vlSelfRef.chip_core__DOT__signal_processor_y_inst__DOT__state_now;
            }
            if (vlSelfRef.chip_core__DOT__wave_controller_x_inst__DOT__nco_en) {
                if ((1U & ((~ (IData)(vlSelfRef.chip_core__DOT__cal_timeout_x)) 
                           & (~ (IData)(vlSelfRef.chip_core__DOT__cal_done_x))))) {
                    if (vlSelfRef.chip_core__DOT__wave_controller_x_inst__DOT__phase_overflow) {
                        __Vdly__chip_core__DOT__wave_controller_x_inst__DOT__wave_cycle_cnt 
                            = (0xffU & ((IData)(1U) 
                                        + (IData)(vlSelfRef.chip_core__DOT__wave_controller_x_inst__DOT__wave_cycle_cnt)));
                    }
                    if ((0xffU == (IData)(vlSelfRef.chip_core__DOT__wave_controller_x_inst__DOT__wave_cycle_cnt))) {
                        vlSelfRef.chip_core__DOT__cal_timeout_x = 1U;
                    }
                    if ((((IData)(vlSelfRef.chip_core__DOT__wave_controller_x_inst__DOT__comp_posedge) 
                          | (IData)(vlSelfRef.chip_core__DOT__wave_controller_x_inst__DOT__comp_negedge)) 
                         & (IData)(vlSelfRef.chip_core__DOT__wave_controller_x_inst__DOT__capture_pending))) {
                        vlSelfRef.chip_core__DOT__raw_edge1_x 
                            = vlSelfRef.chip_core__DOT__wave_controller_x_inst__DOT__phase_acc;
                        vlSelfRef.chip_core__DOT__delay_wave_cycle_x 
                            = vlSelfRef.chip_core__DOT__wave_controller_x_inst__DOT__wave_cycle_cnt;
                        __Vdly__chip_core__DOT__wave_controller_x_inst__DOT__capture_pending = 0U;
                        __Vdly__chip_core__DOT__wave_controller_x_inst__DOT__capture_step = 0U;
                    }
                    if ((1U & (~ (IData)(vlSelfRef.chip_core__DOT__wave_controller_x_inst__DOT__capture_pending)))) {
                        if (((0U == (IData)(vlSelfRef.chip_core__DOT__wave_controller_x_inst__DOT__cycle_delta)) 
                             | ((1U == (IData)(vlSelfRef.chip_core__DOT__wave_controller_x_inst__DOT__cycle_delta)) 
                                & (vlSelfRef.chip_core__DOT__wave_controller_x_inst__DOT__phase_acc 
                                   < vlSelfRef.chip_core__DOT__wave_controller_x_inst__DOT__step_baseline)))) {
                            if ((0U == (IData)(vlSelfRef.chip_core__DOT__wave_controller_x_inst__DOT__capture_step))) {
                                if (((IData)(vlSelfRef.chip_core__DOT__wave_controller_x_inst__DOT__comp_negedge) 
                                     | (IData)(vlSelfRef.chip_core__DOT__wave_controller_x_inst__DOT__comp_posedge))) {
                                    if (vlSelfRef.chip_core__DOT__wave_controller_x_inst__DOT__wave_is_valid) {
                                        vlSelfRef.chip_core__DOT__raw_edge2_x 
                                            = vlSelfRef.chip_core__DOT__wave_controller_x_inst__DOT__phase_acc;
                                        __Vdly__chip_core__DOT__wave_controller_x_inst__DOT__capture_step = 1U;
                                        vlSelfRef.chip_core__DOT__delay_wave_cycle_x 
                                            = vlSelfRef.chip_core__DOT__wave_controller_x_inst__DOT__wave_cycle_cnt;
                                        vlSelfRef.chip_core__DOT__cal_dir_x 
                                            = vlSelfRef.chip_core__DOT__wave_controller_x_inst__DOT__comp_negedge;
                                    } else {
                                        vlSelfRef.chip_core__DOT__raw_edge1_x 
                                            = vlSelfRef.chip_core__DOT__wave_controller_x_inst__DOT__phase_acc;
                                        vlSelfRef.chip_core__DOT__delay_wave_cycle_x 
                                            = vlSelfRef.chip_core__DOT__wave_controller_x_inst__DOT__wave_cycle_cnt;
                                        __Vdly__chip_core__DOT__wave_controller_x_inst__DOT__capture_pending = 0U;
                                        __Vdly__chip_core__DOT__wave_controller_x_inst__DOT__capture_step = 0U;
                                    }
                                }
                            } else if ((1U == (IData)(vlSelfRef.chip_core__DOT__wave_controller_x_inst__DOT__capture_step))) {
                                if (((IData)(vlSelfRef.chip_core__DOT__wave_controller_x_inst__DOT__comp_posedge) 
                                     | (IData)(vlSelfRef.chip_core__DOT__wave_controller_x_inst__DOT__comp_negedge))) {
                                    if (vlSelfRef.chip_core__DOT__wave_controller_x_inst__DOT__wave_is_valid) {
                                        vlSelfRef.chip_core__DOT__raw_edge3_x 
                                            = vlSelfRef.chip_core__DOT__wave_controller_x_inst__DOT__phase_acc;
                                        __Vdly__chip_core__DOT__wave_controller_x_inst__DOT__capture_step = 2U;
                                        vlSelfRef.chip_core__DOT__cal_done_x = 1U;
                                    } else {
                                        vlSelfRef.chip_core__DOT__raw_edge1_x 
                                            = vlSelfRef.chip_core__DOT__wave_controller_x_inst__DOT__phase_acc;
                                        vlSelfRef.chip_core__DOT__delay_wave_cycle_x 
                                            = vlSelfRef.chip_core__DOT__wave_controller_x_inst__DOT__wave_cycle_cnt;
                                        __Vdly__chip_core__DOT__wave_controller_x_inst__DOT__capture_pending = 0U;
                                        __Vdly__chip_core__DOT__wave_controller_x_inst__DOT__capture_step = 0U;
                                    }
                                }
                            }
                        } else {
                            __Vdly__chip_core__DOT__wave_controller_x_inst__DOT__capture_step = 0U;
                            __Vdly__chip_core__DOT__wave_controller_x_inst__DOT__capture_pending = 1U;
                        }
                    }
                }
                if ((1U & ((~ (IData)(vlSelfRef.chip_core__DOT__cal_timeout_y)) 
                           & (~ (IData)(vlSelfRef.chip_core__DOT__cal_done_y))))) {
                    if (vlSelfRef.chip_core__DOT__wave_controller_y_inst__DOT__phase_overflow) {
                        __Vdly__chip_core__DOT__wave_controller_y_inst__DOT__wave_cycle_cnt 
                            = (0xffU & ((IData)(1U) 
                                        + (IData)(vlSelfRef.chip_core__DOT__wave_controller_y_inst__DOT__wave_cycle_cnt)));
                    }
                    if ((0xffU == (IData)(vlSelfRef.chip_core__DOT__wave_controller_y_inst__DOT__wave_cycle_cnt))) {
                        vlSelfRef.chip_core__DOT__cal_timeout_y = 1U;
                    }
                    if ((((IData)(vlSelfRef.chip_core__DOT__wave_controller_y_inst__DOT__comp_posedge) 
                          | (IData)(vlSelfRef.chip_core__DOT__wave_controller_y_inst__DOT__comp_negedge)) 
                         & (IData)(vlSelfRef.chip_core__DOT__wave_controller_y_inst__DOT__capture_pending))) {
                        vlSelfRef.chip_core__DOT__raw_edge1_y 
                            = vlSelfRef.chip_core__DOT__wave_controller_y_inst__DOT__phase_acc;
                        vlSelfRef.chip_core__DOT__delay_wave_cycle_y 
                            = vlSelfRef.chip_core__DOT__wave_controller_y_inst__DOT__wave_cycle_cnt;
                        __Vdly__chip_core__DOT__wave_controller_y_inst__DOT__capture_pending = 0U;
                        __Vdly__chip_core__DOT__wave_controller_y_inst__DOT__capture_step = 0U;
                    }
                    if ((1U & (~ (IData)(vlSelfRef.chip_core__DOT__wave_controller_y_inst__DOT__capture_pending)))) {
                        if (((0U == (IData)(vlSelfRef.chip_core__DOT__wave_controller_y_inst__DOT__cycle_delta)) 
                             | ((1U == (IData)(vlSelfRef.chip_core__DOT__wave_controller_y_inst__DOT__cycle_delta)) 
                                & (vlSelfRef.chip_core__DOT__wave_controller_y_inst__DOT__phase_acc 
                                   < vlSelfRef.chip_core__DOT__wave_controller_y_inst__DOT__step_baseline)))) {
                            if ((0U == (IData)(vlSelfRef.chip_core__DOT__wave_controller_y_inst__DOT__capture_step))) {
                                if (((IData)(vlSelfRef.chip_core__DOT__wave_controller_y_inst__DOT__comp_negedge) 
                                     | (IData)(vlSelfRef.chip_core__DOT__wave_controller_y_inst__DOT__comp_posedge))) {
                                    if (vlSelfRef.chip_core__DOT__wave_controller_y_inst__DOT__wave_is_valid) {
                                        vlSelfRef.chip_core__DOT__raw_edge2_y 
                                            = vlSelfRef.chip_core__DOT__wave_controller_y_inst__DOT__phase_acc;
                                        __Vdly__chip_core__DOT__wave_controller_y_inst__DOT__capture_step = 1U;
                                        vlSelfRef.chip_core__DOT__delay_wave_cycle_y 
                                            = vlSelfRef.chip_core__DOT__wave_controller_y_inst__DOT__wave_cycle_cnt;
                                        vlSelfRef.chip_core__DOT__cal_dir_y 
                                            = vlSelfRef.chip_core__DOT__wave_controller_y_inst__DOT__comp_negedge;
                                    } else {
                                        vlSelfRef.chip_core__DOT__raw_edge1_y 
                                            = vlSelfRef.chip_core__DOT__wave_controller_y_inst__DOT__phase_acc;
                                        vlSelfRef.chip_core__DOT__delay_wave_cycle_y 
                                            = vlSelfRef.chip_core__DOT__wave_controller_y_inst__DOT__wave_cycle_cnt;
                                        __Vdly__chip_core__DOT__wave_controller_y_inst__DOT__capture_pending = 0U;
                                        __Vdly__chip_core__DOT__wave_controller_y_inst__DOT__capture_step = 0U;
                                    }
                                }
                            } else if ((1U == (IData)(vlSelfRef.chip_core__DOT__wave_controller_y_inst__DOT__capture_step))) {
                                if (((IData)(vlSelfRef.chip_core__DOT__wave_controller_y_inst__DOT__comp_posedge) 
                                     | (IData)(vlSelfRef.chip_core__DOT__wave_controller_y_inst__DOT__comp_negedge))) {
                                    if (vlSelfRef.chip_core__DOT__wave_controller_y_inst__DOT__wave_is_valid) {
                                        vlSelfRef.chip_core__DOT__raw_edge3_y 
                                            = vlSelfRef.chip_core__DOT__wave_controller_y_inst__DOT__phase_acc;
                                        __Vdly__chip_core__DOT__wave_controller_y_inst__DOT__capture_step = 2U;
                                        vlSelfRef.chip_core__DOT__cal_done_y = 1U;
                                    } else {
                                        vlSelfRef.chip_core__DOT__raw_edge1_y 
                                            = vlSelfRef.chip_core__DOT__wave_controller_y_inst__DOT__phase_acc;
                                        vlSelfRef.chip_core__DOT__delay_wave_cycle_y 
                                            = vlSelfRef.chip_core__DOT__wave_controller_y_inst__DOT__wave_cycle_cnt;
                                        __Vdly__chip_core__DOT__wave_controller_y_inst__DOT__capture_pending = 0U;
                                        __Vdly__chip_core__DOT__wave_controller_y_inst__DOT__capture_step = 0U;
                                    }
                                }
                            }
                        } else {
                            __Vdly__chip_core__DOT__wave_controller_y_inst__DOT__capture_step = 0U;
                            __Vdly__chip_core__DOT__wave_controller_y_inst__DOT__capture_pending = 1U;
                        }
                    }
                }
            }
            if (((IData)(vlSelfRef.chip_core__DOT__cfg_done) 
                 & (~ (IData)(vlSelfRef.chip_core__DOT__cal_start)))) {
                if (((0x1fffffU & (vlSelfRef.chip_core__DOT__cfg_phase90_offset_x 
                                   - vlSelfRef.chip_core__DOT__wave_controller_x_inst__DOT__phase_acc)) 
                     < (IData)(vlSelfRef.chip_core__DOT__cfg_f_MEMS_fcw_x))) {
                    __Vdly__chip_core__DOT__latch_phase90_x = 1U;
                } else if (vlSelfRef.chip_core__DOT__latch_phase90_ack_x) {
                    __Vdly__chip_core__DOT__latch_phase90_x = 0U;
                }
                if (((0x1fffffU & (vlSelfRef.chip_core__DOT__cfg_phase270_offset_x 
                                   - vlSelfRef.chip_core__DOT__wave_controller_x_inst__DOT__phase_acc)) 
                     < (IData)(vlSelfRef.chip_core__DOT__cfg_f_MEMS_fcw_x))) {
                    __Vdly__chip_core__DOT__latch_phase270_x = 1U;
                } else if (vlSelfRef.chip_core__DOT__latch_phase270_ack_x) {
                    __Vdly__chip_core__DOT__latch_phase270_x = 0U;
                }
                if (((IData)(vlSelfRef.chip_core__DOT__latch_phase90_x) 
                     & (IData)(vlSelfRef.chip_core__DOT__latch_phase270_x))) {
                    vlSelfRef.chip_core__DOT__latch_error_x = 1U;
                    __Vdly__chip_core__DOT__latch_phase90_x = 0U;
                    __Vdly__chip_core__DOT__latch_phase270_x = 0U;
                }
                if (((0x1fffffU & (vlSelfRef.chip_core__DOT__cfg_phase90_offset_y 
                                   - vlSelfRef.chip_core__DOT__wave_controller_y_inst__DOT__phase_acc)) 
                     < (IData)(vlSelfRef.chip_core__DOT__cfg_f_MEMS_fcw_y))) {
                    __Vdly__chip_core__DOT__latch_phase90_y = 1U;
                } else if (vlSelfRef.chip_core__DOT__latch_phase90_ack_y) {
                    __Vdly__chip_core__DOT__latch_phase90_y = 0U;
                }
                if (((0x1fffffU & (vlSelfRef.chip_core__DOT__cfg_phase270_offset_y 
                                   - vlSelfRef.chip_core__DOT__wave_controller_y_inst__DOT__phase_acc)) 
                     < (IData)(vlSelfRef.chip_core__DOT__cfg_f_MEMS_fcw_y))) {
                    __Vdly__chip_core__DOT__latch_phase270_y = 1U;
                } else if (vlSelfRef.chip_core__DOT__latch_phase270_ack_y) {
                    __Vdly__chip_core__DOT__latch_phase270_y = 0U;
                }
                if (((IData)(vlSelfRef.chip_core__DOT__latch_phase90_y) 
                     & (IData)(vlSelfRef.chip_core__DOT__latch_phase270_y))) {
                    vlSelfRef.chip_core__DOT__latch_error_y = 1U;
                    __Vdly__chip_core__DOT__latch_phase90_y = 0U;
                    __Vdly__chip_core__DOT__latch_phase270_y = 0U;
                }
            } else {
                __Vdly__chip_core__DOT__latch_phase90_x = 0U;
                __Vdly__chip_core__DOT__latch_phase270_x = 0U;
                __Vdly__chip_core__DOT__latch_phase90_y = 0U;
                __Vdly__chip_core__DOT__latch_phase270_y = 0U;
            }
        } else {
            __Vdly__chip_core__DOT__signal_processor_x_inst__DOT__s90_pipe = 0U;
            __Vdly__chip_core__DOT__signal_processor_y_inst__DOT__s90_pipe = 0U;
            __Vdly__chip_core__DOT__signal_processor_x_inst__DOT__comp_pipe = 0U;
            __Vdly__chip_core__DOT__signal_processor_y_inst__DOT__comp_pipe = 0U;
            __Vdly__chip_core__DOT__signal_processor_x_inst__DOT__s270_pipe = 0U;
            __Vdly__chip_core__DOT__signal_processor_y_inst__DOT__s270_pipe = 0U;
            vlSelfRef.chip_core__DOT__signal_processor_x_inst__DOT__cycle_count = 0U;
            vlSelfRef.chip_core__DOT__signal_processor_y_inst__DOT__cycle_count = 0U;
            vlSelfRef.chip_core__DOT__signal_processor_x_inst__DOT__s90 = 0U;
            vlSelfRef.chip_core__DOT__signal_processor_y_inst__DOT__s90 = 0U;
            vlSelfRef.chip_core__DOT__signal_processor_x_inst__DOT__cnt_out = 0U;
            vlSelfRef.chip_core__DOT__signal_processor_x_inst__DOT__cnt_in = 0U;
            vlSelfRef.chip_core__DOT__signal_processor_y_inst__DOT__cnt_out = 0U;
            vlSelfRef.chip_core__DOT__signal_processor_y_inst__DOT__cnt_in = 0U;
            vlSelfRef.chip_core__DOT__signal_processor_x_inst__DOT__s90_valid = 0U;
            vlSelfRef.chip_core__DOT__signal_processor_y_inst__DOT__s90_valid = 0U;
            vlSelfRef.chip_core__DOT__dir_x = 0U;
            vlSelfRef.chip_core__DOT__move_en_x = 0U;
            vlSelfRef.chip_core__DOT__dir_y = 0U;
            vlSelfRef.chip_core__DOT__move_en_y = 0U;
            vlSelfRef.chip_core__DOT__phase_state_x = 0U;
            vlSelfRef.chip_core__DOT__phase_state_y = 0U;
            vlSelfRef.chip_core__DOT__votes_in_phase_x = 0U;
            vlSelfRef.chip_core__DOT__votes_out_phase_x = 0U;
            vlSelfRef.chip_core__DOT__votes_in_phase_y = 0U;
            vlSelfRef.chip_core__DOT__votes_out_phase_y = 0U;
            vlSelfRef.chip_core__DOT__jitter_flag_x = 0U;
            vlSelfRef.chip_core__DOT__jitter_flag_y = 0U;
            __Vdly__chip_core__DOT__wave_controller_x_inst__DOT__capture_step = 0U;
            __Vdly__chip_core__DOT__wave_controller_x_inst__DOT__wave_cycle_cnt = 0U;
            vlSelfRef.chip_core__DOT__cal_dir_x = 0U;
            vlSelfRef.chip_core__DOT__delay_wave_cycle_x = 0U;
            __Vdly__chip_core__DOT__wave_controller_x_inst__DOT__capture_pending = 1U;
            vlSelfRef.chip_core__DOT__cal_timeout_x = 0U;
            vlSelfRef.chip_core__DOT__cal_done_x = 0U;
            vlSelfRef.chip_core__DOT__raw_edge1_x = 0U;
            vlSelfRef.chip_core__DOT__raw_edge2_x = 0U;
            vlSelfRef.chip_core__DOT__raw_edge3_x = 0U;
            __Vdly__chip_core__DOT__wave_controller_y_inst__DOT__capture_step = 0U;
            __Vdly__chip_core__DOT__wave_controller_y_inst__DOT__wave_cycle_cnt = 0U;
            vlSelfRef.chip_core__DOT__cal_dir_y = 0U;
            vlSelfRef.chip_core__DOT__delay_wave_cycle_y = 0U;
            __Vdly__chip_core__DOT__wave_controller_y_inst__DOT__capture_pending = 1U;
            vlSelfRef.chip_core__DOT__cal_timeout_y = 0U;
            vlSelfRef.chip_core__DOT__cal_done_y = 0U;
            vlSelfRef.chip_core__DOT__raw_edge1_y = 0U;
            vlSelfRef.chip_core__DOT__raw_edge2_y = 0U;
            vlSelfRef.chip_core__DOT__raw_edge3_y = 0U;
            __Vdly__chip_core__DOT__latch_phase90_x = 0U;
            __Vdly__chip_core__DOT__latch_phase270_x = 0U;
            vlSelfRef.chip_core__DOT__latch_error_x = 0U;
            __Vdly__chip_core__DOT__latch_phase90_y = 0U;
            __Vdly__chip_core__DOT__latch_phase270_y = 0U;
            vlSelfRef.chip_core__DOT__latch_error_y = 0U;
        }
        if (vlSelfRef.chip_core__DOT__cfg_done) {
            if (vlSelfRef.chip_core__DOT__cal_start) {
                if (vlSelfRef.chip_core__DOT__wave_controller_x_inst__DOT__phase_overflow) {
                    if (vlSelfRef.chip_core__DOT__wave_controller_x_inst__DOT__cal_burst_armed) {
                        vlSelfRef.chip_core__DOT__wave_controller_x_inst__DOT__cal_burst_armed = 0U;
                        __Vdly__chip_core__DOT__wave_controller_x_inst__DOT__cal_burst_active = 1U;
                        __Vdly__chip_core__DOT__wave_controller_x_inst__DOT__cal_burst_count = 0U;
                    } else if (vlSelfRef.chip_core__DOT__wave_controller_x_inst__DOT__cal_burst_active) {
                        if ((1U == (IData)(vlSelfRef.chip_core__DOT__wave_controller_x_inst__DOT__cal_burst_count))) {
                            __Vdly__chip_core__DOT__wave_controller_x_inst__DOT__cal_burst_active = 0U;
                        } else {
                            __Vdly__chip_core__DOT__wave_controller_x_inst__DOT__cal_burst_count 
                                = (3U & ((IData)(1U) 
                                         + (IData)(vlSelfRef.chip_core__DOT__wave_controller_x_inst__DOT__cal_burst_count)));
                        }
                    }
                }
                if (vlSelfRef.chip_core__DOT__wave_controller_y_inst__DOT__phase_overflow) {
                    if (vlSelfRef.chip_core__DOT__wave_controller_y_inst__DOT__cal_burst_armed) {
                        vlSelfRef.chip_core__DOT__wave_controller_y_inst__DOT__cal_burst_armed = 0U;
                        __Vdly__chip_core__DOT__wave_controller_y_inst__DOT__cal_burst_active = 1U;
                        __Vdly__chip_core__DOT__wave_controller_y_inst__DOT__cal_burst_count = 0U;
                    } else if (vlSelfRef.chip_core__DOT__wave_controller_y_inst__DOT__cal_burst_active) {
                        if ((1U == (IData)(vlSelfRef.chip_core__DOT__wave_controller_y_inst__DOT__cal_burst_count))) {
                            __Vdly__chip_core__DOT__wave_controller_y_inst__DOT__cal_burst_active = 0U;
                        } else {
                            __Vdly__chip_core__DOT__wave_controller_y_inst__DOT__cal_burst_count 
                                = (3U & ((IData)(1U) 
                                         + (IData)(vlSelfRef.chip_core__DOT__wave_controller_y_inst__DOT__cal_burst_count)));
                        }
                    }
                }
            } else {
                vlSelfRef.chip_core__DOT__wave_controller_x_inst__DOT__cal_burst_armed = 1U;
                __Vdly__chip_core__DOT__wave_controller_x_inst__DOT__cal_burst_active = 0U;
                __Vdly__chip_core__DOT__wave_controller_x_inst__DOT__cal_burst_count = 0U;
                vlSelfRef.chip_core__DOT__wave_controller_y_inst__DOT__cal_burst_armed = 1U;
                __Vdly__chip_core__DOT__wave_controller_y_inst__DOT__cal_burst_active = 0U;
                __Vdly__chip_core__DOT__wave_controller_y_inst__DOT__cal_burst_count = 0U;
            }
        } else {
            vlSelfRef.chip_core__DOT__wave_controller_x_inst__DOT__cal_burst_armed = 1U;
            __Vdly__chip_core__DOT__wave_controller_x_inst__DOT__cal_burst_active = 0U;
            __Vdly__chip_core__DOT__wave_controller_x_inst__DOT__cal_burst_count = 0U;
            vlSelfRef.chip_core__DOT__wave_controller_y_inst__DOT__cal_burst_armed = 1U;
            __Vdly__chip_core__DOT__wave_controller_y_inst__DOT__cal_burst_active = 0U;
            __Vdly__chip_core__DOT__wave_controller_y_inst__DOT__cal_burst_count = 0U;
        }
        vlSelfRef.chip_core__DOT__wave_controller_x_inst__DOT__cal_burst_count 
            = __Vdly__chip_core__DOT__wave_controller_x_inst__DOT__cal_burst_count;
        vlSelfRef.chip_core__DOT__wave_controller_x_inst__DOT__cal_burst_active 
            = __Vdly__chip_core__DOT__wave_controller_x_inst__DOT__cal_burst_active;
        vlSelfRef.chip_core__DOT__wave_controller_y_inst__DOT__cal_burst_count 
            = __Vdly__chip_core__DOT__wave_controller_y_inst__DOT__cal_burst_count;
        vlSelfRef.chip_core__DOT__wave_controller_y_inst__DOT__cal_burst_active 
            = __Vdly__chip_core__DOT__wave_controller_y_inst__DOT__cal_burst_active;
        vlSelfRef.chip_core__DOT__wave_controller_x_inst__DOT__ds_acc 
            = __Vdly__chip_core__DOT__wave_controller_x_inst__DOT__ds_acc;
        vlSelfRef.chip_core__DOT__wave_controller_y_inst__DOT__ds_acc 
            = __Vdly__chip_core__DOT__wave_controller_y_inst__DOT__ds_acc;
        if ((1U & (~ ((IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__cs_sync) 
                      >> 1U)))) {
            if (vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__sclk_rise) {
                vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__rx_shift 
                    = vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__rx_shift_next;
            }
        }
        vlSelfRef.chip_core__DOT__state_machine_inst__DOT__state_q 
            = vlSelfRef.chip_core__DOT__state_machine_inst__DOT__state_d;
        if (vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__reg_wr_en) {
            if ((1U & (~ ((IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__reg_wr_addr) 
                          >> 6U)))) {
                if ((1U & (~ ((IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__reg_wr_addr) 
                              >> 5U)))) {
                    if ((1U & (~ ((IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__reg_wr_addr) 
                                  >> 4U)))) {
                        if ((1U & (~ ((IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__reg_wr_addr) 
                                      >> 3U)))) {
                            if ((4U & (IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__reg_wr_addr))) {
                                if ((2U & (IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__reg_wr_addr))) {
                                    vlSelfRef.chip_core__DOT__cfg_phase0_offset_x 
                                        = ((1U & (IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__reg_wr_addr))
                                            ? ((0xffffU 
                                                & vlSelfRef.chip_core__DOT__cfg_phase0_offset_x) 
                                               | (0x1f0000U 
                                                  & ((IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__reg_wr_data) 
                                                     << 0x10U)))
                                            : ((0x1f00ffU 
                                                & vlSelfRef.chip_core__DOT__cfg_phase0_offset_x) 
                                               | ((IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__reg_wr_data) 
                                                  << 8U)));
                                } else if ((1U & (IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__reg_wr_addr))) {
                                    vlSelfRef.chip_core__DOT__cfg_phase0_offset_x 
                                        = ((0x1fff00U 
                                            & vlSelfRef.chip_core__DOT__cfg_phase0_offset_x) 
                                           | (IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__reg_wr_data));
                                }
                            }
                        }
                    }
                    if ((0x10U & (IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__reg_wr_addr))) {
                        if ((1U & (~ ((IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__reg_wr_addr) 
                                      >> 3U)))) {
                            if ((1U & (~ ((IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__reg_wr_addr) 
                                          >> 2U)))) {
                                if ((1U & (~ ((IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__reg_wr_addr) 
                                              >> 1U)))) {
                                    if ((1U & (~ (IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__reg_wr_addr)))) {
                                        vlSelfRef.chip_core__DOT__cfg_phase0_offset_y 
                                            = ((0xffffU 
                                                & vlSelfRef.chip_core__DOT__cfg_phase0_offset_y) 
                                               | (0x1f0000U 
                                                  & ((IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__reg_wr_data) 
                                                     << 0x10U)));
                                    }
                                }
                            }
                            if ((4U & (IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__reg_wr_addr))) {
                                if ((2U & (IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__reg_wr_addr))) {
                                    if ((1U & (IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__reg_wr_addr))) {
                                        vlSelfRef.chip_core__DOT__phase_offset_imported 
                                            = (1U & 
                                               ((IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__reg_wr_data) 
                                                >> 2U));
                                        vlSelfRef.chip_core__DOT__boot_complete 
                                            = (1U & (IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__reg_wr_data));
                                    }
                                }
                            }
                        }
                    } else if ((8U & (IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__reg_wr_addr))) {
                        if ((4U & (IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__reg_wr_addr))) {
                            if ((2U & (IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__reg_wr_addr))) {
                                vlSelfRef.chip_core__DOT__cfg_phase0_offset_y 
                                    = ((1U & (IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__reg_wr_addr))
                                        ? ((0x1f00ffU 
                                            & vlSelfRef.chip_core__DOT__cfg_phase0_offset_y) 
                                           | ((IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__reg_wr_data) 
                                              << 8U))
                                        : ((0x1fff00U 
                                            & vlSelfRef.chip_core__DOT__cfg_phase0_offset_y) 
                                           | (IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__reg_wr_data)));
                            }
                        }
                    }
                }
            }
        }
        vlSelfRef.chip_core__DOT__signal_processor_x_inst__DOT__comp_pipe 
            = __Vdly__chip_core__DOT__signal_processor_x_inst__DOT__comp_pipe;
        vlSelfRef.chip_core__DOT__signal_processor_y_inst__DOT__comp_pipe 
            = __Vdly__chip_core__DOT__signal_processor_y_inst__DOT__comp_pipe;
        vlSelfRef.chip_core__DOT__wave_controller_x_inst__DOT__capture_pending 
            = __Vdly__chip_core__DOT__wave_controller_x_inst__DOT__capture_pending;
        vlSelfRef.chip_core__DOT__wave_controller_x_inst__DOT__wave_cycle_cnt 
            = __Vdly__chip_core__DOT__wave_controller_x_inst__DOT__wave_cycle_cnt;
        vlSelfRef.chip_core__DOT__wave_controller_x_inst__DOT__capture_step 
            = __Vdly__chip_core__DOT__wave_controller_x_inst__DOT__capture_step;
        vlSelfRef.chip_core__DOT__wave_controller_y_inst__DOT__capture_pending 
            = __Vdly__chip_core__DOT__wave_controller_y_inst__DOT__capture_pending;
        vlSelfRef.chip_core__DOT__wave_controller_y_inst__DOT__wave_cycle_cnt 
            = __Vdly__chip_core__DOT__wave_controller_y_inst__DOT__wave_cycle_cnt;
        vlSelfRef.chip_core__DOT__wave_controller_y_inst__DOT__capture_step 
            = __Vdly__chip_core__DOT__wave_controller_y_inst__DOT__capture_step;
        vlSelfRef.chip_core__DOT__latch_phase90_x = __Vdly__chip_core__DOT__latch_phase90_x;
        vlSelfRef.chip_core__DOT__latch_phase270_x 
            = __Vdly__chip_core__DOT__latch_phase270_x;
    } else {
        __Vdly__chip_core__DOT__wave_controller_x_inst__DOT__ds_acc = 0U;
        __Vdly__chip_core__DOT__wave_controller_y_inst__DOT__ds_acc = 0U;
        __Vdly__chip_core__DOT__spi_regs_inst__DOT__cs_sync = 3U;
        vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__mosi_sync = 0U;
        __Vdly__chip_core__DOT__spi_regs_inst__DOT__sclk_sync = 0U;
        __Vdly__chip_core__DOT__signal_processor_x_inst__DOT__s90_pipe = 0U;
        __Vdly__chip_core__DOT__signal_processor_y_inst__DOT__s90_pipe = 0U;
        __Vdly__chip_core__DOT__signal_processor_x_inst__DOT__comp_pipe = 0U;
        __Vdly__chip_core__DOT__signal_processor_y_inst__DOT__comp_pipe = 0U;
        __Vdly__chip_core__DOT__signal_processor_x_inst__DOT__s270_pipe = 0U;
        __Vdly__chip_core__DOT__signal_processor_y_inst__DOT__s270_pipe = 0U;
        vlSelfRef.chip_core__DOT__signal_processor_x_inst__DOT__cycle_count = 0U;
        vlSelfRef.chip_core__DOT__signal_processor_y_inst__DOT__cycle_count = 0U;
        vlSelfRef.chip_core__DOT__wave_controller_x_inst__DOT__cal_burst_armed = 1U;
        __Vdly__chip_core__DOT__wave_controller_x_inst__DOT__cal_burst_active = 0U;
        __Vdly__chip_core__DOT__wave_controller_x_inst__DOT__cal_burst_count = 0U;
        vlSelfRef.chip_core__DOT__wave_controller_x_inst__DOT__cal_burst_count 
            = __Vdly__chip_core__DOT__wave_controller_x_inst__DOT__cal_burst_count;
        vlSelfRef.chip_core__DOT__wave_controller_x_inst__DOT__cal_burst_active 
            = __Vdly__chip_core__DOT__wave_controller_x_inst__DOT__cal_burst_active;
        vlSelfRef.chip_core__DOT__wave_controller_y_inst__DOT__cal_burst_armed = 1U;
        __Vdly__chip_core__DOT__wave_controller_y_inst__DOT__cal_burst_active = 0U;
        __Vdly__chip_core__DOT__wave_controller_y_inst__DOT__cal_burst_count = 0U;
        vlSelfRef.chip_core__DOT__wave_controller_y_inst__DOT__cal_burst_count 
            = __Vdly__chip_core__DOT__wave_controller_y_inst__DOT__cal_burst_count;
        vlSelfRef.chip_core__DOT__wave_controller_y_inst__DOT__cal_burst_active 
            = __Vdly__chip_core__DOT__wave_controller_y_inst__DOT__cal_burst_active;
        vlSelfRef.chip_core__DOT__wave_controller_x_inst__DOT__ds_acc 
            = __Vdly__chip_core__DOT__wave_controller_x_inst__DOT__ds_acc;
        vlSelfRef.chip_core__DOT__wave_controller_y_inst__DOT__ds_acc 
            = __Vdly__chip_core__DOT__wave_controller_y_inst__DOT__ds_acc;
        vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__rx_shift = 0U;
        vlSelfRef.chip_core__DOT__state_machine_inst__DOT__state_q = 0U;
        vlSelfRef.chip_core__DOT__cfg_phase0_offset_x = 0U;
        vlSelfRef.chip_core__DOT__cfg_phase0_offset_y = 0U;
        vlSelfRef.chip_core__DOT__phase_offset_imported = 0U;
        vlSelfRef.chip_core__DOT__boot_complete = 0U;
        vlSelfRef.chip_core__DOT__signal_processor_x_inst__DOT__s90 = 0U;
        vlSelfRef.chip_core__DOT__signal_processor_x_inst__DOT__comp_pipe 
            = __Vdly__chip_core__DOT__signal_processor_x_inst__DOT__comp_pipe;
        vlSelfRef.chip_core__DOT__signal_processor_y_inst__DOT__s90 = 0U;
        vlSelfRef.chip_core__DOT__signal_processor_y_inst__DOT__comp_pipe 
            = __Vdly__chip_core__DOT__signal_processor_y_inst__DOT__comp_pipe;
        vlSelfRef.chip_core__DOT__signal_processor_x_inst__DOT__cnt_out = 0U;
        vlSelfRef.chip_core__DOT__signal_processor_x_inst__DOT__cnt_in = 0U;
        vlSelfRef.chip_core__DOT__signal_processor_y_inst__DOT__cnt_out = 0U;
        vlSelfRef.chip_core__DOT__signal_processor_y_inst__DOT__cnt_in = 0U;
        vlSelfRef.chip_core__DOT__signal_processor_x_inst__DOT__s90_valid = 0U;
        vlSelfRef.chip_core__DOT__signal_processor_y_inst__DOT__s90_valid = 0U;
        vlSelfRef.chip_core__DOT__dir_x = 0U;
        vlSelfRef.chip_core__DOT__move_en_x = 0U;
        vlSelfRef.chip_core__DOT__dir_y = 0U;
        vlSelfRef.chip_core__DOT__move_en_y = 0U;
        vlSelfRef.chip_core__DOT__phase_state_x = 0U;
        vlSelfRef.chip_core__DOT__phase_state_y = 0U;
        vlSelfRef.chip_core__DOT__votes_in_phase_x = 0U;
        vlSelfRef.chip_core__DOT__votes_out_phase_x = 0U;
        vlSelfRef.chip_core__DOT__votes_in_phase_y = 0U;
        vlSelfRef.chip_core__DOT__votes_out_phase_y = 0U;
        vlSelfRef.chip_core__DOT__jitter_flag_x = 0U;
        vlSelfRef.chip_core__DOT__jitter_flag_y = 0U;
        __Vdly__chip_core__DOT__wave_controller_x_inst__DOT__capture_step = 0U;
        __Vdly__chip_core__DOT__wave_controller_x_inst__DOT__wave_cycle_cnt = 0U;
        vlSelfRef.chip_core__DOT__cal_dir_x = 0U;
        vlSelfRef.chip_core__DOT__delay_wave_cycle_x = 0U;
        __Vdly__chip_core__DOT__wave_controller_x_inst__DOT__capture_pending = 1U;
        vlSelfRef.chip_core__DOT__cal_timeout_x = 0U;
        vlSelfRef.chip_core__DOT__cal_done_x = 0U;
        vlSelfRef.chip_core__DOT__raw_edge1_x = 0U;
        vlSelfRef.chip_core__DOT__raw_edge2_x = 0U;
        vlSelfRef.chip_core__DOT__raw_edge3_x = 0U;
        vlSelfRef.chip_core__DOT__wave_controller_x_inst__DOT__capture_pending 
            = __Vdly__chip_core__DOT__wave_controller_x_inst__DOT__capture_pending;
        vlSelfRef.chip_core__DOT__wave_controller_x_inst__DOT__wave_cycle_cnt 
            = __Vdly__chip_core__DOT__wave_controller_x_inst__DOT__wave_cycle_cnt;
        vlSelfRef.chip_core__DOT__wave_controller_x_inst__DOT__capture_step 
            = __Vdly__chip_core__DOT__wave_controller_x_inst__DOT__capture_step;
        __Vdly__chip_core__DOT__wave_controller_y_inst__DOT__capture_step = 0U;
        __Vdly__chip_core__DOT__wave_controller_y_inst__DOT__wave_cycle_cnt = 0U;
        vlSelfRef.chip_core__DOT__cal_dir_y = 0U;
        vlSelfRef.chip_core__DOT__delay_wave_cycle_y = 0U;
        __Vdly__chip_core__DOT__wave_controller_y_inst__DOT__capture_pending = 1U;
        vlSelfRef.chip_core__DOT__cal_timeout_y = 0U;
        vlSelfRef.chip_core__DOT__cal_done_y = 0U;
        vlSelfRef.chip_core__DOT__raw_edge1_y = 0U;
        vlSelfRef.chip_core__DOT__raw_edge2_y = 0U;
        vlSelfRef.chip_core__DOT__raw_edge3_y = 0U;
        vlSelfRef.chip_core__DOT__wave_controller_y_inst__DOT__capture_pending 
            = __Vdly__chip_core__DOT__wave_controller_y_inst__DOT__capture_pending;
        vlSelfRef.chip_core__DOT__wave_controller_y_inst__DOT__wave_cycle_cnt 
            = __Vdly__chip_core__DOT__wave_controller_y_inst__DOT__wave_cycle_cnt;
        vlSelfRef.chip_core__DOT__wave_controller_y_inst__DOT__capture_step 
            = __Vdly__chip_core__DOT__wave_controller_y_inst__DOT__capture_step;
        __Vdly__chip_core__DOT__latch_phase90_x = 0U;
        __Vdly__chip_core__DOT__latch_phase270_x = 0U;
        vlSelfRef.chip_core__DOT__latch_error_x = 0U;
        vlSelfRef.chip_core__DOT__latch_phase90_x = __Vdly__chip_core__DOT__latch_phase90_x;
        vlSelfRef.chip_core__DOT__latch_phase270_x 
            = __Vdly__chip_core__DOT__latch_phase270_x;
        __Vdly__chip_core__DOT__latch_phase90_y = 0U;
        __Vdly__chip_core__DOT__latch_phase270_y = 0U;
        vlSelfRef.chip_core__DOT__latch_error_y = 0U;
    }
    vlSelfRef.chip_core__DOT__latch_phase90_y = __Vdly__chip_core__DOT__latch_phase90_y;
    vlSelfRef.chip_core__DOT__latch_phase270_y = __Vdly__chip_core__DOT__latch_phase270_y;
    vlSelfRef.bidir_oe = 0xfffffU;
    vlSelfRef.bidir_ie = (0xfffffU & (~ vlSelfRef.bidir_oe));
    vlSelfRef.bidir_oe = (0xffffeU & vlSelfRef.bidir_oe);
    vlSelfRef.bidir_ie = (1U | vlSelfRef.bidir_ie);
    vlSelfRef.bidir_oe = (0xffffdU & vlSelfRef.bidir_oe);
    vlSelfRef.bidir_ie = (2U | vlSelfRef.bidir_ie);
    vlSelfRef.bidir_oe = (0xffffbU & vlSelfRef.bidir_oe);
    vlSelfRef.bidir_ie = (4U | vlSelfRef.bidir_ie);
    vlSelfRef.bidir_oe = ((0xffff7U & vlSelfRef.bidir_oe) 
                          | ((IData)(vlSelfRef.chip_core__DOT__spi_miso_oe) 
                             << 3U));
    vlSelfRef.bidir_ie = (0xffff7U & vlSelfRef.bidir_ie);
    vlSelfRef.bidir_oe = (0x10U | vlSelfRef.bidir_oe);
    vlSelfRef.bidir_ie = (0xfffefU & vlSelfRef.bidir_ie);
    vlSelfRef.bidir_oe = (0x20U | vlSelfRef.bidir_oe);
    vlSelfRef.bidir_ie = (0xfffdfU & vlSelfRef.bidir_ie);
    vlSelfRef.bidir_oe = (0x40U | vlSelfRef.bidir_oe);
    vlSelfRef.bidir_ie = (0xfffbfU & vlSelfRef.bidir_ie);
    vlSelfRef.bidir_oe = (0x80U | vlSelfRef.bidir_oe);
    vlSelfRef.bidir_ie = (0xfff7fU & vlSelfRef.bidir_ie);
    vlSelfRef.bidir_oe = (0x100U | vlSelfRef.bidir_oe);
    vlSelfRef.bidir_ie = (0xffeffU & vlSelfRef.bidir_ie);
    vlSelfRef.bidir_oe = (0x200U | vlSelfRef.bidir_oe);
    vlSelfRef.bidir_ie = (0xffdffU & vlSelfRef.bidir_ie);
    vlSelfRef.chip_core__DOT__cal_start = 0U;
    if ((2U == (IData)(vlSelfRef.chip_core__DOT__state_machine_inst__DOT__state_q))) {
        vlSelfRef.chip_core__DOT__cal_start = 1U;
    }
    vlSelfRef.chip_core__DOT__signal_processor_x_inst__DOT__state_now 
        = (((IData)(vlSelfRef.chip_core__DOT__signal_processor_x_inst__DOT__s90) 
            << 1U) | (1U & ((IData)(vlSelfRef.chip_core__DOT__signal_processor_x_inst__DOT__comp_pipe) 
                            >> 3U)));
    vlSelfRef.chip_core__DOT__signal_processor_y_inst__DOT__state_now 
        = (((IData)(vlSelfRef.chip_core__DOT__signal_processor_y_inst__DOT__s90) 
            << 1U) | (1U & ((IData)(vlSelfRef.chip_core__DOT__signal_processor_y_inst__DOT__comp_pipe) 
                            >> 3U)));
    vlSelfRef.chip_core__DOT__wave_controller_x_inst__DOT__cycle_delta 
        = (0xffU & ((IData)(vlSelfRef.chip_core__DOT__wave_controller_x_inst__DOT__wave_cycle_cnt) 
                    - (IData)(vlSelfRef.chip_core__DOT__delay_wave_cycle_x)));
    vlSelfRef.chip_core__DOT__wave_controller_x_inst__DOT__step_baseline 
        = ((0U == (IData)(vlSelfRef.chip_core__DOT__wave_controller_x_inst__DOT__capture_step))
            ? vlSelfRef.chip_core__DOT__raw_edge1_x
            : vlSelfRef.chip_core__DOT__raw_edge2_x);
    vlSelfRef.chip_core__DOT__wave_controller_y_inst__DOT__cycle_delta 
        = (0xffU & ((IData)(vlSelfRef.chip_core__DOT__wave_controller_y_inst__DOT__wave_cycle_cnt) 
                    - (IData)(vlSelfRef.chip_core__DOT__delay_wave_cycle_y)));
    vlSelfRef.chip_core__DOT__wave_controller_y_inst__DOT__step_baseline 
        = ((0U == (IData)(vlSelfRef.chip_core__DOT__wave_controller_y_inst__DOT__capture_step))
            ? vlSelfRef.chip_core__DOT__raw_edge1_y
            : vlSelfRef.chip_core__DOT__raw_edge2_y);
    vlSelfRef.chip_core__DOT__wave_controller_x_inst__DOT__comp_sync3 
        = ((IData)(vlSelfRef.rst_n) && ((IData)(vlSelfRef.chip_core__DOT__soft_rst_n) 
                                        && (IData)(vlSelfRef.chip_core__DOT__wave_controller_x_inst__DOT__comp_sync2)));
    vlSelfRef.chip_core__DOT__wave_controller_y_inst__DOT__comp_sync3 
        = ((IData)(vlSelfRef.rst_n) && ((IData)(vlSelfRef.chip_core__DOT__soft_rst_n) 
                                        && (IData)(vlSelfRef.chip_core__DOT__wave_controller_y_inst__DOT__comp_sync2)));
    vlSelfRef.chip_core__DOT__latch_phase90_ack_x = 
        ((IData)(vlSelfRef.rst_n) && ((IData)(vlSelfRef.chip_core__DOT__soft_rst_n) 
                                      && (1U & ((IData)(vlSelfRef.chip_core__DOT__signal_processor_x_inst__DOT__s90_pipe) 
                                                >> 3U))));
    vlSelfRef.chip_core__DOT__latch_phase270_ack_x 
        = ((IData)(vlSelfRef.rst_n) && ((IData)(vlSelfRef.chip_core__DOT__soft_rst_n) 
                                        && (1U & ((IData)(vlSelfRef.chip_core__DOT__signal_processor_x_inst__DOT__s270_pipe) 
                                                  >> 3U))));
    vlSelfRef.chip_core__DOT__latch_phase90_ack_y = 
        ((IData)(vlSelfRef.rst_n) && ((IData)(vlSelfRef.chip_core__DOT__soft_rst_n) 
                                      && (1U & ((IData)(vlSelfRef.chip_core__DOT__signal_processor_y_inst__DOT__s90_pipe) 
                                                >> 3U))));
    vlSelfRef.chip_core__DOT__latch_phase270_ack_y 
        = ((IData)(vlSelfRef.rst_n) && ((IData)(vlSelfRef.chip_core__DOT__soft_rst_n) 
                                        && (1U & ((IData)(vlSelfRef.chip_core__DOT__signal_processor_y_inst__DOT__s270_pipe) 
                                                  >> 3U))));
    vlSelfRef.chip_core__DOT__signal_processor_x_inst__DOT__s90_pipe 
        = __Vdly__chip_core__DOT__signal_processor_x_inst__DOT__s90_pipe;
    vlSelfRef.chip_core__DOT__signal_processor_x_inst__DOT__s270_pipe 
        = __Vdly__chip_core__DOT__signal_processor_x_inst__DOT__s270_pipe;
    vlSelfRef.chip_core__DOT__signal_processor_y_inst__DOT__s90_pipe 
        = __Vdly__chip_core__DOT__signal_processor_y_inst__DOT__s90_pipe;
    vlSelfRef.chip_core__DOT__signal_processor_y_inst__DOT__s270_pipe 
        = __Vdly__chip_core__DOT__signal_processor_y_inst__DOT__s270_pipe;
    vlSelfRef.chip_core__DOT__wave_controller_x_inst__DOT__comp_posedge 
        = ((~ (IData)(vlSelfRef.chip_core__DOT__wave_controller_x_inst__DOT__comp_sync4)) 
           & (IData)(vlSelfRef.chip_core__DOT__wave_controller_x_inst__DOT__comp_sync3));
    vlSelfRef.chip_core__DOT__wave_controller_x_inst__DOT__comp_negedge 
        = ((~ (IData)(vlSelfRef.chip_core__DOT__wave_controller_x_inst__DOT__comp_sync3)) 
           & (IData)(vlSelfRef.chip_core__DOT__wave_controller_x_inst__DOT__comp_sync4));
    vlSelfRef.chip_core__DOT__wave_controller_x_inst__DOT__comp_sync2 
        = ((IData)(vlSelfRef.rst_n) && ((IData)(vlSelfRef.chip_core__DOT__soft_rst_n) 
                                        && (IData)(vlSelfRef.chip_core__DOT__wave_controller_x_inst__DOT__comp_sync1)));
    vlSelfRef.chip_core__DOT__wave_controller_y_inst__DOT__comp_posedge 
        = ((~ (IData)(vlSelfRef.chip_core__DOT__wave_controller_y_inst__DOT__comp_sync4)) 
           & (IData)(vlSelfRef.chip_core__DOT__wave_controller_y_inst__DOT__comp_sync3));
    vlSelfRef.chip_core__DOT__wave_controller_y_inst__DOT__comp_negedge 
        = ((~ (IData)(vlSelfRef.chip_core__DOT__wave_controller_y_inst__DOT__comp_sync3)) 
           & (IData)(vlSelfRef.chip_core__DOT__wave_controller_y_inst__DOT__comp_sync4));
    vlSelfRef.chip_core__DOT__wave_controller_y_inst__DOT__comp_sync2 
        = ((IData)(vlSelfRef.rst_n) && ((IData)(vlSelfRef.chip_core__DOT__soft_rst_n) 
                                        && (IData)(vlSelfRef.chip_core__DOT__wave_controller_y_inst__DOT__comp_sync1)));
    if (vlSelfRef.rst_n) {
        if (vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__reg_wr_en) {
            if ((1U & (~ ((IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__reg_wr_addr) 
                          >> 6U)))) {
                if ((1U & (~ ((IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__reg_wr_addr) 
                              >> 5U)))) {
                    if ((1U & (~ ((IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__reg_wr_addr) 
                                  >> 4U)))) {
                        if ((8U & (IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__reg_wr_addr))) {
                            if ((1U & (~ ((IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__reg_wr_addr) 
                                          >> 2U)))) {
                                if ((2U & (IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__reg_wr_addr))) {
                                    if ((1U & (~ (IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__reg_wr_addr)))) {
                                        vlSelfRef.chip_core__DOT__cfg_phase90_offset_x 
                                            = ((0xffffU 
                                                & vlSelfRef.chip_core__DOT__cfg_phase90_offset_x) 
                                               | (0x1f0000U 
                                                  & ((IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__reg_wr_data) 
                                                     << 0x10U)));
                                    }
                                } else {
                                    vlSelfRef.chip_core__DOT__cfg_phase90_offset_x 
                                        = ((1U & (IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__reg_wr_addr))
                                            ? ((0x1f00ffU 
                                                & vlSelfRef.chip_core__DOT__cfg_phase90_offset_x) 
                                               | ((IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__reg_wr_data) 
                                                  << 8U))
                                            : ((0x1fff00U 
                                                & vlSelfRef.chip_core__DOT__cfg_phase90_offset_x) 
                                               | (IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__reg_wr_data)));
                                }
                            }
                            if ((4U & (IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__reg_wr_addr))) {
                                if ((1U & (~ ((IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__reg_wr_addr) 
                                              >> 1U)))) {
                                    vlSelfRef.chip_core__DOT__cfg_phase270_offset_x 
                                        = ((1U & (IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__reg_wr_addr))
                                            ? ((0xffffU 
                                                & vlSelfRef.chip_core__DOT__cfg_phase270_offset_x) 
                                               | (0x1f0000U 
                                                  & ((IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__reg_wr_data) 
                                                     << 0x10U)))
                                            : ((0x1f00ffU 
                                                & vlSelfRef.chip_core__DOT__cfg_phase270_offset_x) 
                                               | ((IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__reg_wr_data) 
                                                  << 8U)));
                                }
                            } else if ((2U & (IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__reg_wr_addr))) {
                                if ((1U & (IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__reg_wr_addr))) {
                                    vlSelfRef.chip_core__DOT__cfg_phase270_offset_x 
                                        = ((0x1fff00U 
                                            & vlSelfRef.chip_core__DOT__cfg_phase270_offset_x) 
                                           | (IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__reg_wr_data));
                                }
                            }
                        }
                        if ((1U & (~ ((IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__reg_wr_addr) 
                                      >> 3U)))) {
                            if ((1U & (~ ((IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__reg_wr_addr) 
                                          >> 2U)))) {
                                if ((2U & (IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__reg_wr_addr))) {
                                    if ((1U & (~ (IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__reg_wr_addr)))) {
                                        vlSelfRef.chip_core__DOT__cfg_f_MEMS_fcw_x 
                                            = ((0xffU 
                                                & (IData)(vlSelfRef.chip_core__DOT__cfg_f_MEMS_fcw_x)) 
                                               | ((IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__reg_wr_data) 
                                                  << 8U));
                                    }
                                } else if ((1U & (IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__reg_wr_addr))) {
                                    vlSelfRef.chip_core__DOT__cfg_f_MEMS_fcw_x 
                                        = ((0xff00U 
                                            & (IData)(vlSelfRef.chip_core__DOT__cfg_f_MEMS_fcw_x)) 
                                           | (IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__reg_wr_data));
                                }
                            }
                        }
                    }
                }
            }
        }
    } else {
        vlSelfRef.chip_core__DOT__cfg_phase90_offset_x = 0U;
        vlSelfRef.chip_core__DOT__cfg_phase270_offset_x = 0U;
        vlSelfRef.chip_core__DOT__cfg_f_MEMS_fcw_x = 0U;
    }
    chip_core__DOT__cal_phase0_offset_x = (0x1fffffU 
                                           & (vlSelfRef.chip_core__DOT__raw_edge3_x 
                                              - VL_SHIFTL_III(21,21,32, (IData)(vlSelfRef.chip_core__DOT__cfg_f_MEMS_fcw_x), 2U)));
    chip_core__DOT__cal_phase90_offset_x = (0x1fffffU 
                                            & ((vlSelfRef.chip_core__DOT__raw_edge1_x 
                                                + VL_SHIFTR_III(21,21,32, 
                                                                (0x1fffffU 
                                                                 & (vlSelfRef.chip_core__DOT__raw_edge2_x 
                                                                    - vlSelfRef.chip_core__DOT__raw_edge1_x)), 1U)) 
                                               - VL_SHIFTL_III(21,21,32, (IData)(vlSelfRef.chip_core__DOT__cfg_f_MEMS_fcw_x), 2U)));
    chip_core__DOT__cal_phase270_offset_x = (0x1fffffU 
                                             & ((vlSelfRef.chip_core__DOT__raw_edge2_x 
                                                 + 
                                                 VL_SHIFTR_III(21,21,32, 
                                                               (0x1fffffU 
                                                                & (vlSelfRef.chip_core__DOT__raw_edge3_x 
                                                                   - vlSelfRef.chip_core__DOT__raw_edge2_x)), 1U)) 
                                                - VL_SHIFTL_III(21,21,32, (IData)(vlSelfRef.chip_core__DOT__cfg_f_MEMS_fcw_x), 2U)));
    vlSelfRef.chip_core__DOT__signal_processor_x_inst__DOT__vote_now 
        = (((IData)(vlSelfRef.chip_core__DOT__signal_processor_x_inst__DOT__s270_pipe) 
            >> 3U) & (IData)(vlSelfRef.chip_core__DOT__signal_processor_x_inst__DOT__s90_valid));
    if (vlSelfRef.rst_n) {
        if (vlSelfRef.chip_core__DOT__soft_rst_n) {
            if (vlSelfRef.chip_core__DOT__wave_controller_x_inst__DOT__nco_en) {
                vlSelfRef.chip_core__DOT__wave_controller_x_inst__DOT__phase_acc 
                    = (0x1fffffU & vlSelfRef.chip_core__DOT__wave_controller_x_inst__DOT__phase_next);
            }
        } else {
            vlSelfRef.chip_core__DOT__wave_controller_x_inst__DOT__phase_acc = 0U;
        }
    } else {
        vlSelfRef.chip_core__DOT__wave_controller_x_inst__DOT__phase_acc = 0U;
    }
    chip_core__DOT__wave_controller_x_inst__DOT__raw_delta 
        = (0x1fffffU & (vlSelfRef.chip_core__DOT__wave_controller_x_inst__DOT__phase_acc 
                        - vlSelfRef.chip_core__DOT__wave_controller_x_inst__DOT__step_baseline));
    vlSelfRef.chip_core__DOT__wave_controller_x_inst__DOT__phase_next 
        = (0x3fffffU & (vlSelfRef.chip_core__DOT__wave_controller_x_inst__DOT__phase_acc 
                        + (IData)(vlSelfRef.chip_core__DOT__cfg_f_MEMS_fcw_x)));
    __Vtableidx2 = (0x3fU & ((0x80000U & vlSelfRef.chip_core__DOT__wave_controller_x_inst__DOT__phase_acc)
                              ? ((IData)(0x3fU) - (vlSelfRef.chip_core__DOT__wave_controller_x_inst__DOT__phase_acc 
                                                   >> 0xdU))
                              : (vlSelfRef.chip_core__DOT__wave_controller_x_inst__DOT__phase_acc 
                                 >> 0xdU)));
    chip_core__DOT__wave_controller_x_inst__DOT__u_sine__DOT__q_val 
        = Vchip_core__ConstPool__TABLE_hf93cdd76_0[__Vtableidx2];
    if (vlSelfRef.rst_n) {
        if (vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__reg_wr_en) {
            if ((1U & (~ ((IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__reg_wr_addr) 
                          >> 6U)))) {
                if ((1U & (~ ((IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__reg_wr_addr) 
                              >> 5U)))) {
                    if ((0x10U & (IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__reg_wr_addr))) {
                        if ((1U & (~ ((IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__reg_wr_addr) 
                                      >> 3U)))) {
                            if ((1U & (~ ((IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__reg_wr_addr) 
                                          >> 2U)))) {
                                if ((2U & (IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__reg_wr_addr))) {
                                    vlSelfRef.chip_core__DOT__cfg_phase90_offset_y 
                                        = ((1U & (IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__reg_wr_addr))
                                            ? ((0xffffU 
                                                & vlSelfRef.chip_core__DOT__cfg_phase90_offset_y) 
                                               | (0x1f0000U 
                                                  & ((IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__reg_wr_data) 
                                                     << 0x10U)))
                                            : ((0x1f00ffU 
                                                & vlSelfRef.chip_core__DOT__cfg_phase90_offset_y) 
                                               | ((IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__reg_wr_data) 
                                                  << 8U)));
                                } else if ((1U & (IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__reg_wr_addr))) {
                                    vlSelfRef.chip_core__DOT__cfg_phase90_offset_y 
                                        = ((0x1fff00U 
                                            & vlSelfRef.chip_core__DOT__cfg_phase90_offset_y) 
                                           | (IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__reg_wr_data));
                                }
                            }
                            if ((4U & (IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__reg_wr_addr))) {
                                if ((2U & (IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__reg_wr_addr))) {
                                    if ((1U & (~ (IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__reg_wr_addr)))) {
                                        vlSelfRef.chip_core__DOT__cfg_phase270_offset_y 
                                            = ((0xffffU 
                                                & vlSelfRef.chip_core__DOT__cfg_phase270_offset_y) 
                                               | (0x1f0000U 
                                                  & ((IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__reg_wr_data) 
                                                     << 0x10U)));
                                    }
                                    if ((1U & (IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__reg_wr_addr))) {
                                        vlSelfRef.chip_core__DOT__cfg_done 
                                            = (1U & 
                                               ((IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__reg_wr_data) 
                                                >> 1U));
                                    }
                                } else {
                                    vlSelfRef.chip_core__DOT__cfg_phase270_offset_y 
                                        = ((1U & (IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__reg_wr_addr))
                                            ? ((0x1f00ffU 
                                                & vlSelfRef.chip_core__DOT__cfg_phase270_offset_y) 
                                               | ((IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__reg_wr_data) 
                                                  << 8U))
                                            : ((0x1fff00U 
                                                & vlSelfRef.chip_core__DOT__cfg_phase270_offset_y) 
                                               | (IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__reg_wr_data)));
                                }
                            }
                        }
                    }
                    if ((1U & (~ ((IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__reg_wr_addr) 
                                  >> 4U)))) {
                        if ((1U & (~ ((IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__reg_wr_addr) 
                                      >> 3U)))) {
                            if ((4U & (IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__reg_wr_addr))) {
                                if ((1U & (~ ((IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__reg_wr_addr) 
                                              >> 1U)))) {
                                    if ((1U & (~ (IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__reg_wr_addr)))) {
                                        vlSelfRef.chip_core__DOT__cfg_f_MEMS_fcw_y 
                                            = ((0xffU 
                                                & (IData)(vlSelfRef.chip_core__DOT__cfg_f_MEMS_fcw_y)) 
                                               | ((IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__reg_wr_data) 
                                                  << 8U));
                                    }
                                }
                            } else if ((2U & (IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__reg_wr_addr))) {
                                if ((1U & (IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__reg_wr_addr))) {
                                    vlSelfRef.chip_core__DOT__cfg_f_MEMS_fcw_y 
                                        = ((0xff00U 
                                            & (IData)(vlSelfRef.chip_core__DOT__cfg_f_MEMS_fcw_y)) 
                                           | (IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__reg_wr_data));
                                }
                            }
                        }
                    }
                }
            }
        }
        if (vlSelfRef.chip_core__DOT__soft_rst_n) {
            if (vlSelfRef.chip_core__DOT__wave_controller_x_inst__DOT__nco_en) {
                vlSelfRef.chip_core__DOT__wave_controller_y_inst__DOT__phase_acc 
                    = (0x1fffffU & vlSelfRef.chip_core__DOT__wave_controller_y_inst__DOT__phase_next);
            }
        } else {
            vlSelfRef.chip_core__DOT__wave_controller_y_inst__DOT__phase_acc = 0U;
        }
    } else {
        vlSelfRef.chip_core__DOT__cfg_phase90_offset_y = 0U;
        vlSelfRef.chip_core__DOT__cfg_phase270_offset_y = 0U;
        vlSelfRef.chip_core__DOT__cfg_done = 0U;
        vlSelfRef.chip_core__DOT__cfg_f_MEMS_fcw_y = 0U;
        vlSelfRef.chip_core__DOT__wave_controller_y_inst__DOT__phase_acc = 0U;
    }
    vlSelfRef.chip_core__DOT__wave_controller_x_inst__DOT__nco_en 
        = ((IData)(vlSelfRef.chip_core__DOT__cal_start) 
           | (IData)(vlSelfRef.chip_core__DOT__cfg_done));
    chip_core__DOT__cal_phase0_offset_y = (0x1fffffU 
                                           & (vlSelfRef.chip_core__DOT__raw_edge3_y 
                                              - VL_SHIFTL_III(21,21,32, (IData)(vlSelfRef.chip_core__DOT__cfg_f_MEMS_fcw_y), 2U)));
    chip_core__DOT__cal_phase90_offset_y = (0x1fffffU 
                                            & ((vlSelfRef.chip_core__DOT__raw_edge1_y 
                                                + VL_SHIFTR_III(21,21,32, 
                                                                (0x1fffffU 
                                                                 & (vlSelfRef.chip_core__DOT__raw_edge2_y 
                                                                    - vlSelfRef.chip_core__DOT__raw_edge1_y)), 1U)) 
                                               - VL_SHIFTL_III(21,21,32, (IData)(vlSelfRef.chip_core__DOT__cfg_f_MEMS_fcw_y), 2U)));
    chip_core__DOT__cal_phase270_offset_y = (0x1fffffU 
                                             & ((vlSelfRef.chip_core__DOT__raw_edge2_y 
                                                 + 
                                                 VL_SHIFTR_III(21,21,32, 
                                                               (0x1fffffU 
                                                                & (vlSelfRef.chip_core__DOT__raw_edge3_y 
                                                                   - vlSelfRef.chip_core__DOT__raw_edge2_y)), 1U)) 
                                                - VL_SHIFTL_III(21,21,32, (IData)(vlSelfRef.chip_core__DOT__cfg_f_MEMS_fcw_y), 2U)));
    vlSelfRef.chip_core__DOT__signal_processor_y_inst__DOT__vote_now 
        = (((IData)(vlSelfRef.chip_core__DOT__signal_processor_y_inst__DOT__s270_pipe) 
            >> 3U) & (IData)(vlSelfRef.chip_core__DOT__signal_processor_y_inst__DOT__s90_valid));
    chip_core__DOT__wave_controller_y_inst__DOT__raw_delta 
        = (0x1fffffU & (vlSelfRef.chip_core__DOT__wave_controller_y_inst__DOT__phase_acc 
                        - vlSelfRef.chip_core__DOT__wave_controller_y_inst__DOT__step_baseline));
    vlSelfRef.chip_core__DOT__wave_controller_y_inst__DOT__phase_next 
        = (0x3fffffU & (vlSelfRef.chip_core__DOT__wave_controller_y_inst__DOT__phase_acc 
                        + (IData)(vlSelfRef.chip_core__DOT__cfg_f_MEMS_fcw_y)));
    __Vtableidx3 = (0x3fU & ((0x80000U & vlSelfRef.chip_core__DOT__wave_controller_y_inst__DOT__phase_acc)
                              ? ((IData)(0x3fU) - (vlSelfRef.chip_core__DOT__wave_controller_y_inst__DOT__phase_acc 
                                                   >> 0xdU))
                              : (vlSelfRef.chip_core__DOT__wave_controller_y_inst__DOT__phase_acc 
                                 >> 0xdU)));
    chip_core__DOT__wave_controller_y_inst__DOT__u_sine__DOT__q_val 
        = Vchip_core__ConstPool__TABLE_hf93cdd76_0[__Vtableidx3];
    if (vlSelfRef.chip_core__DOT__signal_processor_x_inst__DOT__vote_now) {
        vlSelfRef.chip_core__DOT__signal_processor_x_inst__DOT__window_done 
            = (0xeU == (IData)(vlSelfRef.chip_core__DOT__signal_processor_x_inst__DOT__cycle_count));
        vlSelfRef.chip_core__DOT__signal_processor_x_inst__DOT__next_in 
            = vlSelfRef.chip_core__DOT__signal_processor_x_inst__DOT__cnt_in;
        vlSelfRef.chip_core__DOT__signal_processor_x_inst__DOT__next_out 
            = vlSelfRef.chip_core__DOT__signal_processor_x_inst__DOT__cnt_out;
        if ((2U == (IData)(vlSelfRef.chip_core__DOT__signal_processor_x_inst__DOT__state_now))) {
            vlSelfRef.chip_core__DOT__signal_processor_x_inst__DOT__next_in 
                = (0xfU & ((IData)(1U) + (IData)(vlSelfRef.chip_core__DOT__signal_processor_x_inst__DOT__cnt_in)));
        }
        if ((2U != (IData)(vlSelfRef.chip_core__DOT__signal_processor_x_inst__DOT__state_now))) {
            if ((1U == (IData)(vlSelfRef.chip_core__DOT__signal_processor_x_inst__DOT__state_now))) {
                vlSelfRef.chip_core__DOT__signal_processor_x_inst__DOT__next_out 
                    = (0xfU & ((IData)(1U) + (IData)(vlSelfRef.chip_core__DOT__signal_processor_x_inst__DOT__cnt_out)));
            }
        }
    } else {
        vlSelfRef.chip_core__DOT__signal_processor_x_inst__DOT__window_done = 0U;
        vlSelfRef.chip_core__DOT__signal_processor_x_inst__DOT__next_in 
            = vlSelfRef.chip_core__DOT__signal_processor_x_inst__DOT__cnt_in;
        vlSelfRef.chip_core__DOT__signal_processor_x_inst__DOT__next_out 
            = vlSelfRef.chip_core__DOT__signal_processor_x_inst__DOT__cnt_out;
    }
    vlSelfRef.chip_core__DOT__wave_controller_x_inst__DOT__wave_is_valid 
        = (IData)((0U != (0x180000U & chip_core__DOT__wave_controller_x_inst__DOT__raw_delta)));
    chip_core__DOT__wave_controller_x_inst__DOT__sine_amp 
        = (0xffU & ((0x100000U & vlSelfRef.chip_core__DOT__wave_controller_x_inst__DOT__phase_acc)
                     ? ((IData)(0x80U) - (IData)(chip_core__DOT__wave_controller_x_inst__DOT__u_sine__DOT__q_val))
                     : ((IData)(0x80U) + (IData)(chip_core__DOT__wave_controller_x_inst__DOT__u_sine__DOT__q_val))));
    vlSelfRef.chip_core__DOT__wave_controller_x_inst__DOT__phase_overflow 
        = ((IData)(vlSelfRef.chip_core__DOT__wave_controller_x_inst__DOT__nco_en) 
           & (vlSelfRef.chip_core__DOT__wave_controller_x_inst__DOT__phase_next 
              >> 0x15U));
    if (vlSelfRef.chip_core__DOT__signal_processor_y_inst__DOT__vote_now) {
        vlSelfRef.chip_core__DOT__signal_processor_y_inst__DOT__window_done 
            = (0xeU == (IData)(vlSelfRef.chip_core__DOT__signal_processor_y_inst__DOT__cycle_count));
        vlSelfRef.chip_core__DOT__signal_processor_y_inst__DOT__next_in 
            = vlSelfRef.chip_core__DOT__signal_processor_y_inst__DOT__cnt_in;
        vlSelfRef.chip_core__DOT__signal_processor_y_inst__DOT__next_out 
            = vlSelfRef.chip_core__DOT__signal_processor_y_inst__DOT__cnt_out;
        if ((2U == (IData)(vlSelfRef.chip_core__DOT__signal_processor_y_inst__DOT__state_now))) {
            vlSelfRef.chip_core__DOT__signal_processor_y_inst__DOT__next_in 
                = (0xfU & ((IData)(1U) + (IData)(vlSelfRef.chip_core__DOT__signal_processor_y_inst__DOT__cnt_in)));
        }
        if ((2U != (IData)(vlSelfRef.chip_core__DOT__signal_processor_y_inst__DOT__state_now))) {
            if ((1U == (IData)(vlSelfRef.chip_core__DOT__signal_processor_y_inst__DOT__state_now))) {
                vlSelfRef.chip_core__DOT__signal_processor_y_inst__DOT__next_out 
                    = (0xfU & ((IData)(1U) + (IData)(vlSelfRef.chip_core__DOT__signal_processor_y_inst__DOT__cnt_out)));
            }
        }
    } else {
        vlSelfRef.chip_core__DOT__signal_processor_y_inst__DOT__window_done = 0U;
        vlSelfRef.chip_core__DOT__signal_processor_y_inst__DOT__next_in 
            = vlSelfRef.chip_core__DOT__signal_processor_y_inst__DOT__cnt_in;
        vlSelfRef.chip_core__DOT__signal_processor_y_inst__DOT__next_out 
            = vlSelfRef.chip_core__DOT__signal_processor_y_inst__DOT__cnt_out;
    }
    vlSelfRef.chip_core__DOT__wave_controller_y_inst__DOT__wave_is_valid 
        = (IData)((0U != (0x180000U & chip_core__DOT__wave_controller_y_inst__DOT__raw_delta)));
    vlSelfRef.chip_core__DOT__wave_controller_y_inst__DOT__phase_overflow 
        = ((IData)(vlSelfRef.chip_core__DOT__wave_controller_x_inst__DOT__nco_en) 
           & (vlSelfRef.chip_core__DOT__wave_controller_y_inst__DOT__phase_next 
              >> 0x15U));
    chip_core__DOT__wave_controller_y_inst__DOT__sine_amp 
        = (0xffU & ((0x100000U & vlSelfRef.chip_core__DOT__wave_controller_y_inst__DOT__phase_acc)
                     ? ((IData)(0x80U) - (IData)(chip_core__DOT__wave_controller_y_inst__DOT__u_sine__DOT__q_val))
                     : ((IData)(0x80U) + (IData)(chip_core__DOT__wave_controller_y_inst__DOT__u_sine__DOT__q_val))));
    vlSelfRef.chip_core__DOT__wave_controller_x_inst__DOT__comp_sync1 
        = ((IData)(vlSelfRef.rst_n) && ((IData)(vlSelfRef.chip_core__DOT__soft_rst_n) 
                                        && (IData)(vlSelfRef.chip_core__DOT__wave_controller_x_inst__DOT__comp_sync0)));
    vlSelfRef.chip_core__DOT__wave_controller_y_inst__DOT__comp_sync1 
        = ((IData)(vlSelfRef.rst_n) && ((IData)(vlSelfRef.chip_core__DOT__soft_rst_n) 
                                        && (IData)(vlSelfRef.chip_core__DOT__wave_controller_y_inst__DOT__comp_sync0)));
    vlSelfRef.chip_core__DOT__wave_controller_x_inst__DOT__ds_code = 0x80U;
    vlSelfRef.chip_core__DOT__wave_controller_y_inst__DOT__ds_code = 0x80U;
    if (vlSelfRef.chip_core__DOT__cfg_done) {
        if (vlSelfRef.chip_core__DOT__cal_start) {
            vlSelfRef.chip_core__DOT__wave_controller_x_inst__DOT__ds_code 
                = ((IData)(vlSelfRef.chip_core__DOT__wave_controller_x_inst__DOT__cal_burst_active)
                    ? (IData)(chip_core__DOT__wave_controller_x_inst__DOT__sine_amp)
                    : 0x80U);
            vlSelfRef.chip_core__DOT__wave_controller_y_inst__DOT__ds_code 
                = ((IData)(vlSelfRef.chip_core__DOT__wave_controller_y_inst__DOT__cal_burst_active)
                    ? (IData)(chip_core__DOT__wave_controller_y_inst__DOT__sine_amp)
                    : 0x80U);
        } else {
            vlSelfRef.chip_core__DOT__wave_controller_x_inst__DOT__ds_code 
                = chip_core__DOT__wave_controller_x_inst__DOT__sine_amp;
            vlSelfRef.chip_core__DOT__wave_controller_y_inst__DOT__ds_code 
                = chip_core__DOT__wave_controller_y_inst__DOT__sine_amp;
        }
    }
    vlSelfRef.chip_core__DOT__wave_controller_x_inst__DOT__comp_sync0 
        = ((IData)(vlSelfRef.rst_n) && ((IData)(vlSelfRef.chip_core__DOT__soft_rst_n) 
                                        && (IData)(vlSelfRef.chip_core__DOT__comp_x)));
    vlSelfRef.chip_core__DOT__wave_controller_y_inst__DOT__comp_sync0 
        = ((IData)(vlSelfRef.rst_n) && ((IData)(vlSelfRef.chip_core__DOT__soft_rst_n) 
                                        && (IData)(vlSelfRef.chip_core__DOT__comp_y)));
    if (vlSelfRef.rst_n) {
        if (vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__reg_wr_en) {
            if ((1U & (~ ((IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__reg_wr_addr) 
                          >> 6U)))) {
                if ((1U & (~ ((IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__reg_wr_addr) 
                              >> 5U)))) {
                    if ((0x10U & (IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__reg_wr_addr))) {
                        if ((1U & (~ ((IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__reg_wr_addr) 
                                      >> 3U)))) {
                            if ((4U & (IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__reg_wr_addr))) {
                                if ((2U & (IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__reg_wr_addr))) {
                                    if ((1U & (IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__reg_wr_addr))) {
                                        vlSelfRef.chip_core__DOT__soft_rst_n 
                                            = (1U & 
                                               ((IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__reg_wr_data) 
                                                >> 3U));
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__reg_wr_en = 0U;
        if ((2U & (IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__cs_sync))) {
            __Vdly__chip_core__DOT__spi_regs_inst__DOT__spi_state = 0U;
            __Vdly__chip_core__DOT__spi_regs_inst__DOT__bit_cnt = 0U;
        } else {
            if (vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__sclk_rise) {
                if ((7U == (IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__bit_cnt))) {
                    __Vdly__chip_core__DOT__spi_regs_inst__DOT__bit_cnt = 0U;
                    if (vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__spi_state) {
                        if (vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__spi_state) {
                            if (vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__rw_n) {
                                vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__reg_wr_en = 1U;
                                vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__reg_wr_addr 
                                    = vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__spi_addr;
                                vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__reg_wr_data 
                                    = vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__rx_shift_next;
                            }
                            vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__spi_addr 
                                = (0x7fU & ((IData)(1U) 
                                            + (IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__spi_addr)));
                        }
                    } else {
                        vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__spi_addr 
                            = (0x7fU & (IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__rx_shift_next));
                        vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__rw_n 
                            = (1U & ((IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__rx_shift_next) 
                                     >> 7U));
                        __Vdly__chip_core__DOT__spi_regs_inst__DOT__spi_state = 1U;
                    }
                } else {
                    __Vdly__chip_core__DOT__spi_regs_inst__DOT__bit_cnt 
                        = (7U & ((IData)(1U) + (IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__bit_cnt)));
                }
            }
            if (((~ ((IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__sclk_sync) 
                     >> 1U)) & (IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__sclk_d))) {
                vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__tx_shift 
                    = (((IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__spi_state) 
                        & (0U == (IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__bit_cnt)))
                        ? (IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__reg_rd_data)
                        : (0xfeU & ((IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__tx_shift) 
                                    << 1U)));
            }
        }
    } else {
        vlSelfRef.chip_core__DOT__soft_rst_n = 0U;
        vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__spi_addr = 0U;
        __Vdly__chip_core__DOT__spi_regs_inst__DOT__spi_state = 0U;
        __Vdly__chip_core__DOT__spi_regs_inst__DOT__bit_cnt = 0U;
        vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__tx_shift = 0U;
        vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__rw_n = 0U;
        vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__reg_wr_en = 0U;
        vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__reg_wr_addr = 0U;
        vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__reg_wr_data = 0U;
    }
    __Vtableidx1 = (((((IData)(vlSelfRef.chip_core__DOT__boot_complete) 
                       << 8U) | (((IData)(vlSelfRef.chip_core__DOT__phase_offset_imported) 
                                  << 7U) | ((IData)(vlSelfRef.chip_core__DOT__cfg_done) 
                                            << 6U))) 
                     | ((((IData)(vlSelfRef.chip_core__DOT__cal_timeout_x) 
                          | (IData)(vlSelfRef.chip_core__DOT__cal_timeout_y)) 
                         << 5U) | (((IData)(vlSelfRef.chip_core__DOT__cal_done_x) 
                                    | (IData)(vlSelfRef.chip_core__DOT__cal_done_y)) 
                                   << 4U))) | (((IData)(vlSelfRef.chip_core__DOT__soft_rst_n) 
                                                << 3U) 
                                               | (IData)(vlSelfRef.chip_core__DOT__state_machine_inst__DOT__state_q)));
    vlSelfRef.chip_core__DOT__state_machine_inst__DOT__state_d 
        = Vchip_core__ConstPool__TABLE_hb77d79b6_0[__Vtableidx1];
    vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__spi_state 
        = __Vdly__chip_core__DOT__spi_regs_inst__DOT__spi_state;
    vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__bit_cnt 
        = __Vdly__chip_core__DOT__spi_regs_inst__DOT__bit_cnt;
    vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__rx_shift_next 
        = ((0xfeU & ((IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__rx_shift) 
                     << 1U)) | (1U & ((IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__mosi_sync) 
                                      >> 1U)));
    vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__cs_sync 
        = __Vdly__chip_core__DOT__spi_regs_inst__DOT__cs_sync;
    vlSelfRef.bidir_out = ((0xfff87U & vlSelfRef.bidir_out) 
                           | ((((IData)(vlSelfRef.chip_core__DOT__move_en_y) 
                                << 6U) | ((IData)(vlSelfRef.chip_core__DOT__dir_x) 
                                          << 5U)) | 
                              (((IData)(vlSelfRef.chip_core__DOT__move_en_x) 
                                << 4U) | (8U & ((IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__tx_shift) 
                                                >> 4U)))));
    vlSelfRef.bidir_out = ((0xffc7fU & vlSelfRef.bidir_out) 
                           | (((IData)(vlSelfRef.chip_core__DOT__mems_drv_y) 
                               << 9U) | (((IData)(vlSelfRef.chip_core__DOT__mems_drv_x) 
                                          << 8U) | 
                                         ((IData)(vlSelfRef.chip_core__DOT__dir_y) 
                                          << 7U))));
    vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__reg_rd_data 
        = (0xffU & ((0x40U & (IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__spi_addr))
                     ? ((0x20U & (IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__spi_addr))
                         ? 0U : ((0x10U & (IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__spi_addr))
                                  ? 0U : ((8U & (IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__spi_addr))
                                           ? ((4U & (IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__spi_addr))
                                               ? ((2U 
                                                   & (IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__spi_addr))
                                                   ? 0U
                                                   : 
                                                  ((1U 
                                                    & (IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__spi_addr))
                                                    ? (IData)(vlSelfRef.chip_core__DOT__state_machine_inst__DOT__state_q)
                                                    : 
                                                   ((((IData)(vlSelfRef.chip_core__DOT__latch_error_y) 
                                                      << 5U) 
                                                     | ((IData)(vlSelfRef.chip_core__DOT__latch_error_x) 
                                                        << 4U)) 
                                                    | ((((IData)(vlSelfRef.chip_core__DOT__cal_timeout_y) 
                                                         << 3U) 
                                                        | ((IData)(vlSelfRef.chip_core__DOT__cal_timeout_x) 
                                                           << 2U)) 
                                                       | (((IData)(vlSelfRef.chip_core__DOT__cal_dir_y) 
                                                           << 1U) 
                                                          | (IData)(vlSelfRef.chip_core__DOT__cal_dir_x))))))
                                               : ((2U 
                                                   & (IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__spi_addr))
                                                   ? 
                                                  ((1U 
                                                    & (IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__spi_addr))
                                                    ? (IData)(vlSelfRef.chip_core__DOT__votes_out_phase_y)
                                                    : (IData)(vlSelfRef.chip_core__DOT__votes_in_phase_y))
                                                   : 
                                                  ((1U 
                                                    & (IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__spi_addr))
                                                    ? (IData)(vlSelfRef.chip_core__DOT__votes_out_phase_x)
                                                    : (IData)(vlSelfRef.chip_core__DOT__votes_in_phase_x))))
                                           : ((4U & (IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__spi_addr))
                                               ? ((2U 
                                                   & (IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__spi_addr))
                                                   ? 
                                                  ((1U 
                                                    & (IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__spi_addr))
                                                    ? 
                                                   (((IData)(vlSelfRef.chip_core__DOT__phase_state_y) 
                                                     << 2U) 
                                                    | (IData)(vlSelfRef.chip_core__DOT__phase_state_x))
                                                    : 
                                                   (((IData)(vlSelfRef.chip_core__DOT__jitter_flag_y) 
                                                     << 1U) 
                                                    | (IData)(vlSelfRef.chip_core__DOT__jitter_flag_x)))
                                                   : 
                                                  ((1U 
                                                    & (IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__spi_addr))
                                                    ? 
                                                   (0x1fU 
                                                    & (chip_core__DOT__cal_phase270_offset_y 
                                                       >> 0x10U))
                                                    : 
                                                   (chip_core__DOT__cal_phase270_offset_y 
                                                    >> 8U)))
                                               : ((2U 
                                                   & (IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__spi_addr))
                                                   ? 
                                                  ((1U 
                                                    & (IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__spi_addr))
                                                    ? chip_core__DOT__cal_phase270_offset_y
                                                    : 
                                                   (0x1fU 
                                                    & (chip_core__DOT__cal_phase90_offset_y 
                                                       >> 0x10U)))
                                                   : 
                                                  ((1U 
                                                    & (IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__spi_addr))
                                                    ? 
                                                   (chip_core__DOT__cal_phase90_offset_y 
                                                    >> 8U)
                                                    : chip_core__DOT__cal_phase90_offset_y))))))
                     : ((0x20U & (IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__spi_addr))
                         ? ((0x10U & (IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__spi_addr))
                             ? ((8U & (IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__spi_addr))
                                 ? ((4U & (IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__spi_addr))
                                     ? ((2U & (IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__spi_addr))
                                         ? ((1U & (IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__spi_addr))
                                             ? (0x1fU 
                                                & (chip_core__DOT__cal_phase0_offset_y 
                                                   >> 0x10U))
                                             : (chip_core__DOT__cal_phase0_offset_y 
                                                >> 8U))
                                         : ((1U & (IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__spi_addr))
                                             ? chip_core__DOT__cal_phase0_offset_y
                                             : (0x1fU 
                                                & (chip_core__DOT__cal_phase270_offset_x 
                                                   >> 0x10U))))
                                     : ((2U & (IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__spi_addr))
                                         ? ((1U & (IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__spi_addr))
                                             ? (chip_core__DOT__cal_phase270_offset_x 
                                                >> 8U)
                                             : chip_core__DOT__cal_phase270_offset_x)
                                         : ((1U & (IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__spi_addr))
                                             ? (0x1fU 
                                                & (chip_core__DOT__cal_phase90_offset_x 
                                                   >> 0x10U))
                                             : (chip_core__DOT__cal_phase90_offset_x 
                                                >> 8U))))
                                 : ((4U & (IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__spi_addr))
                                     ? ((2U & (IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__spi_addr))
                                         ? ((1U & (IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__spi_addr))
                                             ? chip_core__DOT__cal_phase90_offset_x
                                             : (0x1fU 
                                                & (chip_core__DOT__cal_phase0_offset_x 
                                                   >> 0x10U)))
                                         : ((1U & (IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__spi_addr))
                                             ? (chip_core__DOT__cal_phase0_offset_x 
                                                >> 8U)
                                             : chip_core__DOT__cal_phase0_offset_x))
                                     : ((2U & (IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__spi_addr))
                                         ? ((1U & (IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__spi_addr))
                                             ? (0x1fU 
                                                & (vlSelfRef.chip_core__DOT__raw_edge3_y 
                                                   >> 0x10U))
                                             : (vlSelfRef.chip_core__DOT__raw_edge3_y 
                                                >> 8U))
                                         : ((1U & (IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__spi_addr))
                                             ? vlSelfRef.chip_core__DOT__raw_edge3_y
                                             : (0x1fU 
                                                & (vlSelfRef.chip_core__DOT__raw_edge2_y 
                                                   >> 0x10U))))))
                             : ((8U & (IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__spi_addr))
                                 ? ((4U & (IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__spi_addr))
                                     ? ((2U & (IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__spi_addr))
                                         ? ((1U & (IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__spi_addr))
                                             ? (vlSelfRef.chip_core__DOT__raw_edge2_y 
                                                >> 8U)
                                             : vlSelfRef.chip_core__DOT__raw_edge2_y)
                                         : ((1U & (IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__spi_addr))
                                             ? (0x1fU 
                                                & (vlSelfRef.chip_core__DOT__raw_edge1_y 
                                                   >> 0x10U))
                                             : (vlSelfRef.chip_core__DOT__raw_edge1_y 
                                                >> 8U)))
                                     : ((2U & (IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__spi_addr))
                                         ? ((1U & (IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__spi_addr))
                                             ? vlSelfRef.chip_core__DOT__raw_edge1_y
                                             : (0x1fU 
                                                & (vlSelfRef.chip_core__DOT__raw_edge3_x 
                                                   >> 0x10U)))
                                         : ((1U & (IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__spi_addr))
                                             ? (vlSelfRef.chip_core__DOT__raw_edge3_x 
                                                >> 8U)
                                             : vlSelfRef.chip_core__DOT__raw_edge3_x)))
                                 : ((4U & (IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__spi_addr))
                                     ? ((2U & (IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__spi_addr))
                                         ? ((1U & (IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__spi_addr))
                                             ? (0x1fU 
                                                & (vlSelfRef.chip_core__DOT__raw_edge2_x 
                                                   >> 0x10U))
                                             : (vlSelfRef.chip_core__DOT__raw_edge2_x 
                                                >> 8U))
                                         : ((1U & (IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__spi_addr))
                                             ? vlSelfRef.chip_core__DOT__raw_edge2_x
                                             : (0x1fU 
                                                & (vlSelfRef.chip_core__DOT__raw_edge1_x 
                                                   >> 0x10U))))
                                     : ((2U & (IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__spi_addr))
                                         ? ((1U & (IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__spi_addr))
                                             ? (vlSelfRef.chip_core__DOT__raw_edge1_x 
                                                >> 8U)
                                             : vlSelfRef.chip_core__DOT__raw_edge1_x)
                                         : ((1U & (IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__spi_addr))
                                             ? (IData)(vlSelfRef.chip_core__DOT__delay_wave_cycle_y)
                                             : (IData)(vlSelfRef.chip_core__DOT__delay_wave_cycle_x))))))
                         : ((0x10U & (IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__spi_addr))
                             ? ((8U & (IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__spi_addr))
                                 ? 0U : ((4U & (IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__spi_addr))
                                          ? ((2U & (IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__spi_addr))
                                              ? ((1U 
                                                  & (IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__spi_addr))
                                                  ? 
                                                 (((IData)(vlSelfRef.chip_core__DOT__soft_rst_n) 
                                                   << 3U) 
                                                  | (((IData)(vlSelfRef.chip_core__DOT__phase_offset_imported) 
                                                      << 2U) 
                                                     | (((IData)(vlSelfRef.chip_core__DOT__cfg_done) 
                                                         << 1U) 
                                                        | (IData)(vlSelfRef.chip_core__DOT__boot_complete))))
                                                  : 
                                                 (0x1fU 
                                                  & (vlSelfRef.chip_core__DOT__cfg_phase270_offset_y 
                                                     >> 0x10U)))
                                              : ((1U 
                                                  & (IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__spi_addr))
                                                  ? 
                                                 (vlSelfRef.chip_core__DOT__cfg_phase270_offset_y 
                                                  >> 8U)
                                                  : vlSelfRef.chip_core__DOT__cfg_phase270_offset_y))
                                          : ((2U & (IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__spi_addr))
                                              ? ((1U 
                                                  & (IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__spi_addr))
                                                  ? 
                                                 (0x1fU 
                                                  & (vlSelfRef.chip_core__DOT__cfg_phase90_offset_y 
                                                     >> 0x10U))
                                                  : 
                                                 (vlSelfRef.chip_core__DOT__cfg_phase90_offset_y 
                                                  >> 8U))
                                              : ((1U 
                                                  & (IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__spi_addr))
                                                  ? vlSelfRef.chip_core__DOT__cfg_phase90_offset_y
                                                  : 
                                                 (0x1fU 
                                                  & (vlSelfRef.chip_core__DOT__cfg_phase0_offset_y 
                                                     >> 0x10U))))))
                             : ((8U & (IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__spi_addr))
                                 ? ((4U & (IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__spi_addr))
                                     ? ((2U & (IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__spi_addr))
                                         ? ((1U & (IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__spi_addr))
                                             ? (vlSelfRef.chip_core__DOT__cfg_phase0_offset_y 
                                                >> 8U)
                                             : vlSelfRef.chip_core__DOT__cfg_phase0_offset_y)
                                         : ((1U & (IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__spi_addr))
                                             ? (0x1fU 
                                                & (vlSelfRef.chip_core__DOT__cfg_phase270_offset_x 
                                                   >> 0x10U))
                                             : (vlSelfRef.chip_core__DOT__cfg_phase270_offset_x 
                                                >> 8U)))
                                     : ((2U & (IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__spi_addr))
                                         ? ((1U & (IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__spi_addr))
                                             ? vlSelfRef.chip_core__DOT__cfg_phase270_offset_x
                                             : (0x1fU 
                                                & (vlSelfRef.chip_core__DOT__cfg_phase90_offset_x 
                                                   >> 0x10U)))
                                         : ((1U & (IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__spi_addr))
                                             ? (vlSelfRef.chip_core__DOT__cfg_phase90_offset_x 
                                                >> 8U)
                                             : vlSelfRef.chip_core__DOT__cfg_phase90_offset_x)))
                                 : ((4U & (IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__spi_addr))
                                     ? ((2U & (IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__spi_addr))
                                         ? ((1U & (IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__spi_addr))
                                             ? (0x1fU 
                                                & (vlSelfRef.chip_core__DOT__cfg_phase0_offset_x 
                                                   >> 0x10U))
                                             : (vlSelfRef.chip_core__DOT__cfg_phase0_offset_x 
                                                >> 8U))
                                         : ((1U & (IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__spi_addr))
                                             ? vlSelfRef.chip_core__DOT__cfg_phase0_offset_x
                                             : ((IData)(vlSelfRef.chip_core__DOT__cfg_f_MEMS_fcw_y) 
                                                >> 8U)))
                                     : ((2U & (IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__spi_addr))
                                         ? ((1U & (IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__spi_addr))
                                             ? (IData)(vlSelfRef.chip_core__DOT__cfg_f_MEMS_fcw_y)
                                             : ((IData)(vlSelfRef.chip_core__DOT__cfg_f_MEMS_fcw_x) 
                                                >> 8U))
                                         : ((1U & (IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__spi_addr))
                                             ? (IData)(vlSelfRef.chip_core__DOT__cfg_f_MEMS_fcw_x)
                                             : 0U))))))));
    vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__sclk_d 
        = ((IData)(vlSelfRef.rst_n) & ((IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__sclk_sync) 
                                       >> 1U));
    vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__sclk_sync 
        = __Vdly__chip_core__DOT__spi_regs_inst__DOT__sclk_sync;
    vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__sclk_rise 
        = ((~ (IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__sclk_d)) 
           & ((IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__sclk_sync) 
              >> 1U));
}

void Vchip_core___024root___eval_triggers__act(Vchip_core___024root* vlSelf);

bool Vchip_core___024root___eval_phase__act(Vchip_core___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    Vchip_core__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vchip_core___024root___eval_phase__act\n"); );
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Init
    VlTriggerVec<2> __VpreTriggered;
    CData/*0:0*/ __VactExecute;
    // Body
    Vchip_core___024root___eval_triggers__act(vlSelf);
    __VactExecute = vlSelfRef.__VactTriggered.any();
    if (__VactExecute) {
        __VpreTriggered.andNot(vlSelfRef.__VactTriggered, vlSelfRef.__VnbaTriggered);
        vlSelfRef.__VnbaTriggered.thisOr(vlSelfRef.__VactTriggered);
        Vchip_core___024root___eval_act(vlSelf);
    }
    return (__VactExecute);
}

bool Vchip_core___024root___eval_phase__nba(Vchip_core___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    Vchip_core__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vchip_core___024root___eval_phase__nba\n"); );
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Init
    CData/*0:0*/ __VnbaExecute;
    // Body
    __VnbaExecute = vlSelfRef.__VnbaTriggered.any();
    if (__VnbaExecute) {
        Vchip_core___024root___eval_nba(vlSelf);
        vlSelfRef.__VnbaTriggered.clear();
    }
    return (__VnbaExecute);
}

#ifdef VL_DEBUG
VL_ATTR_COLD void Vchip_core___024root___dump_triggers__nba(Vchip_core___024root* vlSelf);
#endif  // VL_DEBUG
#ifdef VL_DEBUG
VL_ATTR_COLD void Vchip_core___024root___dump_triggers__act(Vchip_core___024root* vlSelf);
#endif  // VL_DEBUG

void Vchip_core___024root___eval(Vchip_core___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    Vchip_core__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vchip_core___024root___eval\n"); );
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Init
    IData/*31:0*/ __VnbaIterCount;
    CData/*0:0*/ __VnbaContinue;
    // Body
    __VnbaIterCount = 0U;
    __VnbaContinue = 1U;
    while (__VnbaContinue) {
        if (VL_UNLIKELY((0x64U < __VnbaIterCount))) {
#ifdef VL_DEBUG
            Vchip_core___024root___dump_triggers__nba(vlSelf);
#endif
            VL_FATAL_MT("chip_core.sv", 20, "", "NBA region did not converge.");
        }
        __VnbaIterCount = ((IData)(1U) + __VnbaIterCount);
        __VnbaContinue = 0U;
        vlSelfRef.__VactIterCount = 0U;
        vlSelfRef.__VactContinue = 1U;
        while (vlSelfRef.__VactContinue) {
            if (VL_UNLIKELY((0x64U < vlSelfRef.__VactIterCount))) {
#ifdef VL_DEBUG
                Vchip_core___024root___dump_triggers__act(vlSelf);
#endif
                VL_FATAL_MT("chip_core.sv", 20, "", "Active region did not converge.");
            }
            vlSelfRef.__VactIterCount = ((IData)(1U) 
                                         + vlSelfRef.__VactIterCount);
            vlSelfRef.__VactContinue = 0U;
            if (Vchip_core___024root___eval_phase__act(vlSelf)) {
                vlSelfRef.__VactContinue = 1U;
            }
        }
        if (Vchip_core___024root___eval_phase__nba(vlSelf)) {
            __VnbaContinue = 1U;
        }
    }
}

#ifdef VL_DEBUG
void Vchip_core___024root___eval_debug_assertions(Vchip_core___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    Vchip_core__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vchip_core___024root___eval_debug_assertions\n"); );
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    if (VL_UNLIKELY((vlSelfRef.VDD & 0xfeU))) {
        Verilated::overWidthError("VDD");}
    if (VL_UNLIKELY((vlSelfRef.VSS & 0xfeU))) {
        Verilated::overWidthError("VSS");}
    if (VL_UNLIKELY((vlSelfRef.clk & 0xfeU))) {
        Verilated::overWidthError("clk");}
    if (VL_UNLIKELY((vlSelfRef.rst_n & 0xfeU))) {
        Verilated::overWidthError("rst_n");}
    if (VL_UNLIKELY((vlSelfRef.input_in & 0xfeU))) {
        Verilated::overWidthError("input_in");}
    if (VL_UNLIKELY((vlSelfRef.bidir_in & 0xfff00000U))) {
        Verilated::overWidthError("bidir_in");}
    if (VL_UNLIKELY((vlSelfRef.analog & 0ULL))) {
        Verilated::overWidthError("analog");}
}
#endif  // VL_DEBUG
