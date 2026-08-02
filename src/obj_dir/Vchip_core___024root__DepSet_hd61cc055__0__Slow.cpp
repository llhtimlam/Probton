// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vchip_core.h for the primary calling header

#include "Vchip_core__pch.h"
#include "Vchip_core___024root.h"

VL_ATTR_COLD void Vchip_core___024root___eval_static(Vchip_core___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    Vchip_core__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vchip_core___024root___eval_static\n"); );
    auto& vlSelfRef = std::ref(*vlSelf).get();
}

VL_ATTR_COLD void Vchip_core___024root___eval_initial__TOP(Vchip_core___024root* vlSelf);

VL_ATTR_COLD void Vchip_core___024root___eval_initial(Vchip_core___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    Vchip_core__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vchip_core___024root___eval_initial\n"); );
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    Vchip_core___024root___eval_initial__TOP(vlSelf);
    vlSelfRef.__Vtrigprevexpr___TOP__clk__0 = vlSelfRef.clk;
    vlSelfRef.__Vtrigprevexpr___TOP__rst_n__0 = vlSelfRef.rst_n;
}

VL_ATTR_COLD void Vchip_core___024root___eval_initial__TOP(Vchip_core___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    Vchip_core__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vchip_core___024root___eval_initial__TOP\n"); );
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    vlSelfRef.bidir_cs = 0U;
    vlSelfRef.bidir_cs = (7U | (0xffc00U & vlSelfRef.bidir_cs));
    vlSelfRef.bidir_sl = 0U;
    vlSelfRef.bidir_sl = (8U | (0xffc07U & vlSelfRef.bidir_sl));
    vlSelfRef.bidir_pu = 0U;
    vlSelfRef.bidir_pu = (1U | (0xffc00U & vlSelfRef.bidir_pu));
    vlSelfRef.bidir_pd = 0U;
    vlSelfRef.bidir_pd = (0xffc00U & vlSelfRef.bidir_pd);
    vlSelfRef.input_pu = 0U;
    vlSelfRef.input_pd = 0U;
    vlSelfRef.VDD = 0U;
    vlSelfRef.VSS = 0U;
}

VL_ATTR_COLD void Vchip_core___024root___eval_final(Vchip_core___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    Vchip_core__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vchip_core___024root___eval_final\n"); );
    auto& vlSelfRef = std::ref(*vlSelf).get();
}

#ifdef VL_DEBUG
VL_ATTR_COLD void Vchip_core___024root___dump_triggers__stl(Vchip_core___024root* vlSelf);
#endif  // VL_DEBUG
VL_ATTR_COLD bool Vchip_core___024root___eval_phase__stl(Vchip_core___024root* vlSelf);

VL_ATTR_COLD void Vchip_core___024root___eval_settle(Vchip_core___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    Vchip_core__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vchip_core___024root___eval_settle\n"); );
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Init
    IData/*31:0*/ __VstlIterCount;
    CData/*0:0*/ __VstlContinue;
    // Body
    __VstlIterCount = 0U;
    vlSelfRef.__VstlFirstIteration = 1U;
    __VstlContinue = 1U;
    while (__VstlContinue) {
        if (VL_UNLIKELY((0x64U < __VstlIterCount))) {
#ifdef VL_DEBUG
            Vchip_core___024root___dump_triggers__stl(vlSelf);
#endif
            VL_FATAL_MT("chip_core.sv", 20, "", "Settle region did not converge.");
        }
        __VstlIterCount = ((IData)(1U) + __VstlIterCount);
        __VstlContinue = 0U;
        if (Vchip_core___024root___eval_phase__stl(vlSelf)) {
            __VstlContinue = 1U;
        }
        vlSelfRef.__VstlFirstIteration = 0U;
    }
}

#ifdef VL_DEBUG
VL_ATTR_COLD void Vchip_core___024root___dump_triggers__stl(Vchip_core___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    Vchip_core__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vchip_core___024root___dump_triggers__stl\n"); );
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    if ((1U & (~ vlSelfRef.__VstlTriggered.any()))) {
        VL_DBG_MSGF("         No triggers active\n");
    }
    if ((1ULL & vlSelfRef.__VstlTriggered.word(0U))) {
        VL_DBG_MSGF("         'stl' region trigger index 0 is active: Internal 'stl' trigger - first iteration\n");
    }
}
#endif  // VL_DEBUG

VL_ATTR_COLD void Vchip_core___024root___stl_sequent__TOP__0(Vchip_core___024root* vlSelf);

VL_ATTR_COLD void Vchip_core___024root___eval_stl(Vchip_core___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    Vchip_core__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vchip_core___024root___eval_stl\n"); );
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    if ((1ULL & vlSelfRef.__VstlTriggered.word(0U))) {
        Vchip_core___024root___stl_sequent__TOP__0(vlSelf);
    }
}

extern const VlUnpacked<CData/*2:0*/, 512> Vchip_core__ConstPool__TABLE_hb77d79b6_0;
extern const VlUnpacked<CData/*6:0*/, 64> Vchip_core__ConstPool__TABLE_hf93cdd76_0;

VL_ATTR_COLD void Vchip_core___024root___stl_sequent__TOP__0(Vchip_core___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    Vchip_core__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vchip_core___024root___stl_sequent__TOP__0\n"); );
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
    // Body
    vlSelfRef.chip_core__DOT__wave_controller_x_inst__DOT__cycle_delta 
        = (0xffU & ((IData)(vlSelfRef.chip_core__DOT__wave_controller_x_inst__DOT__wave_cycle_cnt) 
                    - (IData)(vlSelfRef.chip_core__DOT__delay_wave_cycle_x)));
    vlSelfRef.chip_core__DOT__wave_controller_y_inst__DOT__cycle_delta 
        = (0xffU & ((IData)(vlSelfRef.chip_core__DOT__wave_controller_y_inst__DOT__wave_cycle_cnt) 
                    - (IData)(vlSelfRef.chip_core__DOT__delay_wave_cycle_y)));
    vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__sclk_rise 
        = ((~ (IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__sclk_d)) 
           & ((IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__sclk_sync) 
              >> 1U));
    vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__rx_shift_next 
        = ((0xfeU & ((IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__rx_shift) 
                     << 1U)) | (1U & ((IData)(vlSelfRef.chip_core__DOT__spi_regs_inst__DOT__mosi_sync) 
                                      >> 1U)));
    vlSelfRef.chip_core__DOT__wave_controller_x_inst__DOT__comp_posedge 
        = ((~ (IData)(vlSelfRef.chip_core__DOT__wave_controller_x_inst__DOT__comp_sync4)) 
           & (IData)(vlSelfRef.chip_core__DOT__wave_controller_x_inst__DOT__comp_sync3));
    vlSelfRef.chip_core__DOT__wave_controller_x_inst__DOT__comp_negedge 
        = ((~ (IData)(vlSelfRef.chip_core__DOT__wave_controller_x_inst__DOT__comp_sync3)) 
           & (IData)(vlSelfRef.chip_core__DOT__wave_controller_x_inst__DOT__comp_sync4));
    vlSelfRef.chip_core__DOT__wave_controller_y_inst__DOT__comp_posedge 
        = ((~ (IData)(vlSelfRef.chip_core__DOT__wave_controller_y_inst__DOT__comp_sync4)) 
           & (IData)(vlSelfRef.chip_core__DOT__wave_controller_y_inst__DOT__comp_sync3));
    vlSelfRef.chip_core__DOT__wave_controller_y_inst__DOT__comp_negedge 
        = ((~ (IData)(vlSelfRef.chip_core__DOT__wave_controller_y_inst__DOT__comp_sync3)) 
           & (IData)(vlSelfRef.chip_core__DOT__wave_controller_y_inst__DOT__comp_sync4));
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
    vlSelfRef.chip_core__DOT__analog__out__strong__out20 
        = ((0xffffffffffffff1ULL & vlSelfRef.chip_core__DOT__analog__out__strong__out20) 
           | ((QData)((IData)((((IData)(vlSelfRef.chip_core__DOT__analog_error_y_output) 
                                << 2U) | (((IData)(vlSelfRef.chip_core__DOT__analog_error_x_output) 
                                           << 1U) | (IData)(vlSelfRef.chip_core__DOT__analog_readout_output))))) 
              << 1U));
    vlSelfRef.chip_core__DOT__wave_controller_x_inst__DOT__phase_next 
        = (0x3fffffU & (vlSelfRef.chip_core__DOT__wave_controller_x_inst__DOT__phase_acc 
                        + (IData)(vlSelfRef.chip_core__DOT__cfg_f_MEMS_fcw_x)));
    vlSelfRef.chip_core__DOT__wave_controller_y_inst__DOT__phase_next 
        = (0x3fffffU & (vlSelfRef.chip_core__DOT__wave_controller_y_inst__DOT__phase_acc 
                        + (IData)(vlSelfRef.chip_core__DOT__cfg_f_MEMS_fcw_y)));
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
    vlSelfRef.chip_core__DOT__wave_controller_x_inst__DOT__step_baseline 
        = ((0U == (IData)(vlSelfRef.chip_core__DOT__wave_controller_x_inst__DOT__capture_step))
            ? vlSelfRef.chip_core__DOT__raw_edge1_x
            : vlSelfRef.chip_core__DOT__raw_edge2_x);
    vlSelfRef.chip_core__DOT__wave_controller_y_inst__DOT__step_baseline 
        = ((0U == (IData)(vlSelfRef.chip_core__DOT__wave_controller_y_inst__DOT__capture_step))
            ? vlSelfRef.chip_core__DOT__raw_edge1_y
            : vlSelfRef.chip_core__DOT__raw_edge2_y);
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
    vlSelfRef.chip_core__DOT__signal_processor_x_inst__DOT__state_now 
        = (((IData)(vlSelfRef.chip_core__DOT__signal_processor_x_inst__DOT__s90) 
            << 1U) | (1U & ((IData)(vlSelfRef.chip_core__DOT__signal_processor_x_inst__DOT__comp_pipe) 
                            >> 3U)));
    vlSelfRef.chip_core__DOT__signal_processor_y_inst__DOT__state_now 
        = (((IData)(vlSelfRef.chip_core__DOT__signal_processor_y_inst__DOT__s90) 
            << 1U) | (1U & ((IData)(vlSelfRef.chip_core__DOT__signal_processor_y_inst__DOT__comp_pipe) 
                            >> 3U)));
    __Vtableidx2 = (0x3fU & ((0x80000U & vlSelfRef.chip_core__DOT__wave_controller_x_inst__DOT__phase_acc)
                              ? ((IData)(0x3fU) - (vlSelfRef.chip_core__DOT__wave_controller_x_inst__DOT__phase_acc 
                                                   >> 0xdU))
                              : (vlSelfRef.chip_core__DOT__wave_controller_x_inst__DOT__phase_acc 
                                 >> 0xdU)));
    chip_core__DOT__wave_controller_x_inst__DOT__u_sine__DOT__q_val 
        = Vchip_core__ConstPool__TABLE_hf93cdd76_0[__Vtableidx2];
    __Vtableidx3 = (0x3fU & ((0x80000U & vlSelfRef.chip_core__DOT__wave_controller_y_inst__DOT__phase_acc)
                              ? ((IData)(0x3fU) - (vlSelfRef.chip_core__DOT__wave_controller_y_inst__DOT__phase_acc 
                                                   >> 0xdU))
                              : (vlSelfRef.chip_core__DOT__wave_controller_y_inst__DOT__phase_acc 
                                 >> 0xdU)));
    chip_core__DOT__wave_controller_y_inst__DOT__u_sine__DOT__q_val 
        = Vchip_core__ConstPool__TABLE_hf93cdd76_0[__Vtableidx3];
    vlSelfRef.chip_core__DOT__signal_processor_x_inst__DOT__vote_now 
        = (((IData)(vlSelfRef.chip_core__DOT__signal_processor_x_inst__DOT__s270_pipe) 
            >> 3U) & (IData)(vlSelfRef.chip_core__DOT__signal_processor_x_inst__DOT__s90_valid));
    vlSelfRef.chip_core__DOT__signal_processor_y_inst__DOT__vote_now 
        = (((IData)(vlSelfRef.chip_core__DOT__signal_processor_y_inst__DOT__s270_pipe) 
            >> 3U) & (IData)(vlSelfRef.chip_core__DOT__signal_processor_y_inst__DOT__s90_valid));
    vlSelfRef.chip_core__DOT__cal_start = 0U;
    if ((2U == (IData)(vlSelfRef.chip_core__DOT__state_machine_inst__DOT__state_q))) {
        vlSelfRef.chip_core__DOT__cal_start = 1U;
    }
    chip_core__DOT__cal_phase0_offset_x = (0x1fffffU 
                                           & (vlSelfRef.chip_core__DOT__raw_edge3_x 
                                              - VL_SHIFTL_III(21,21,32, (IData)(vlSelfRef.chip_core__DOT__cfg_f_MEMS_fcw_x), 2U)));
    chip_core__DOT__cal_phase0_offset_y = (0x1fffffU 
                                           & (vlSelfRef.chip_core__DOT__raw_edge3_y 
                                              - VL_SHIFTL_III(21,21,32, (IData)(vlSelfRef.chip_core__DOT__cfg_f_MEMS_fcw_y), 2U)));
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
    vlSelfRef.analog = vlSelfRef.chip_core__DOT__analog__out__strong__out20;
    chip_core__DOT__wave_controller_x_inst__DOT__raw_delta 
        = (0x1fffffU & (vlSelfRef.chip_core__DOT__wave_controller_x_inst__DOT__phase_acc 
                        - vlSelfRef.chip_core__DOT__wave_controller_x_inst__DOT__step_baseline));
    chip_core__DOT__wave_controller_y_inst__DOT__raw_delta 
        = (0x1fffffU & (vlSelfRef.chip_core__DOT__wave_controller_y_inst__DOT__phase_acc 
                        - vlSelfRef.chip_core__DOT__wave_controller_y_inst__DOT__step_baseline));
    chip_core__DOT__wave_controller_x_inst__DOT__sine_amp 
        = (0xffU & ((0x100000U & vlSelfRef.chip_core__DOT__wave_controller_x_inst__DOT__phase_acc)
                     ? ((IData)(0x80U) - (IData)(chip_core__DOT__wave_controller_x_inst__DOT__u_sine__DOT__q_val))
                     : ((IData)(0x80U) + (IData)(chip_core__DOT__wave_controller_x_inst__DOT__u_sine__DOT__q_val))));
    chip_core__DOT__wave_controller_y_inst__DOT__sine_amp 
        = (0xffU & ((0x100000U & vlSelfRef.chip_core__DOT__wave_controller_y_inst__DOT__phase_acc)
                     ? ((IData)(0x80U) - (IData)(chip_core__DOT__wave_controller_y_inst__DOT__u_sine__DOT__q_val))
                     : ((IData)(0x80U) + (IData)(chip_core__DOT__wave_controller_y_inst__DOT__u_sine__DOT__q_val))));
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
    vlSelfRef.chip_core__DOT__wave_controller_x_inst__DOT__nco_en 
        = ((IData)(vlSelfRef.chip_core__DOT__cal_start) 
           | (IData)(vlSelfRef.chip_core__DOT__cfg_done));
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
    vlSelfRef.chip_core__DOT__wave_controller_x_inst__DOT__wave_is_valid 
        = (IData)((0U != (0x180000U & chip_core__DOT__wave_controller_x_inst__DOT__raw_delta)));
    vlSelfRef.chip_core__DOT__wave_controller_y_inst__DOT__wave_is_valid 
        = (IData)((0U != (0x180000U & chip_core__DOT__wave_controller_y_inst__DOT__raw_delta)));
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
    vlSelfRef.chip_core__DOT__wave_controller_x_inst__DOT__phase_overflow 
        = ((IData)(vlSelfRef.chip_core__DOT__wave_controller_x_inst__DOT__nco_en) 
           & (vlSelfRef.chip_core__DOT__wave_controller_x_inst__DOT__phase_next 
              >> 0x15U));
    vlSelfRef.chip_core__DOT__wave_controller_y_inst__DOT__phase_overflow 
        = ((IData)(vlSelfRef.chip_core__DOT__wave_controller_x_inst__DOT__nco_en) 
           & (vlSelfRef.chip_core__DOT__wave_controller_y_inst__DOT__phase_next 
              >> 0x15U));
}

VL_ATTR_COLD void Vchip_core___024root___eval_triggers__stl(Vchip_core___024root* vlSelf);

VL_ATTR_COLD bool Vchip_core___024root___eval_phase__stl(Vchip_core___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    Vchip_core__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vchip_core___024root___eval_phase__stl\n"); );
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Init
    CData/*0:0*/ __VstlExecute;
    // Body
    Vchip_core___024root___eval_triggers__stl(vlSelf);
    __VstlExecute = vlSelfRef.__VstlTriggered.any();
    if (__VstlExecute) {
        Vchip_core___024root___eval_stl(vlSelf);
    }
    return (__VstlExecute);
}

#ifdef VL_DEBUG
VL_ATTR_COLD void Vchip_core___024root___dump_triggers__act(Vchip_core___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    Vchip_core__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vchip_core___024root___dump_triggers__act\n"); );
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    if ((1U & (~ vlSelfRef.__VactTriggered.any()))) {
        VL_DBG_MSGF("         No triggers active\n");
    }
    if ((1ULL & vlSelfRef.__VactTriggered.word(0U))) {
        VL_DBG_MSGF("         'act' region trigger index 0 is active: @(posedge clk)\n");
    }
    if ((2ULL & vlSelfRef.__VactTriggered.word(0U))) {
        VL_DBG_MSGF("         'act' region trigger index 1 is active: @(negedge rst_n)\n");
    }
}
#endif  // VL_DEBUG

#ifdef VL_DEBUG
VL_ATTR_COLD void Vchip_core___024root___dump_triggers__nba(Vchip_core___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    Vchip_core__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vchip_core___024root___dump_triggers__nba\n"); );
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    if ((1U & (~ vlSelfRef.__VnbaTriggered.any()))) {
        VL_DBG_MSGF("         No triggers active\n");
    }
    if ((1ULL & vlSelfRef.__VnbaTriggered.word(0U))) {
        VL_DBG_MSGF("         'nba' region trigger index 0 is active: @(posedge clk)\n");
    }
    if ((2ULL & vlSelfRef.__VnbaTriggered.word(0U))) {
        VL_DBG_MSGF("         'nba' region trigger index 1 is active: @(negedge rst_n)\n");
    }
}
#endif  // VL_DEBUG

VL_ATTR_COLD void Vchip_core___024root___ctor_var_reset(Vchip_core___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    Vchip_core__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vchip_core___024root___ctor_var_reset\n"); );
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    vlSelf->VDD = VL_RAND_RESET_I(1);
    vlSelf->VSS = VL_RAND_RESET_I(1);
    vlSelf->clk = VL_RAND_RESET_I(1);
    vlSelf->rst_n = VL_RAND_RESET_I(1);
    vlSelf->input_in = VL_RAND_RESET_I(1);
    vlSelf->input_pu = VL_RAND_RESET_I(1);
    vlSelf->input_pd = VL_RAND_RESET_I(1);
    vlSelf->bidir_in = VL_RAND_RESET_I(20);
    vlSelf->bidir_out = VL_RAND_RESET_I(20);
    vlSelf->bidir_oe = VL_RAND_RESET_I(20);
    vlSelf->bidir_cs = VL_RAND_RESET_I(20);
    vlSelf->bidir_sl = VL_RAND_RESET_I(20);
    vlSelf->bidir_ie = VL_RAND_RESET_I(20);
    vlSelf->bidir_pu = VL_RAND_RESET_I(20);
    vlSelf->bidir_pd = VL_RAND_RESET_I(20);
    vlSelf->analog = VL_RAND_RESET_Q(60);
    vlSelf->chip_core__DOT__analog_readout_output = VL_RAND_RESET_I(1);
    vlSelf->chip_core__DOT__analog_error_x_output = VL_RAND_RESET_I(1);
    vlSelf->chip_core__DOT__analog_error_y_output = VL_RAND_RESET_I(1);
    vlSelf->chip_core__DOT__spi_miso_oe = VL_RAND_RESET_I(1);
    vlSelf->chip_core__DOT__move_en_x = VL_RAND_RESET_I(1);
    vlSelf->chip_core__DOT__dir_x = VL_RAND_RESET_I(1);
    vlSelf->chip_core__DOT__move_en_y = VL_RAND_RESET_I(1);
    vlSelf->chip_core__DOT__dir_y = VL_RAND_RESET_I(1);
    vlSelf->chip_core__DOT__mems_drv_x = VL_RAND_RESET_I(1);
    vlSelf->chip_core__DOT__mems_drv_y = VL_RAND_RESET_I(1);
    vlSelf->chip_core__DOT__cfg_f_MEMS_fcw_x = VL_RAND_RESET_I(16);
    vlSelf->chip_core__DOT__cfg_f_MEMS_fcw_y = VL_RAND_RESET_I(16);
    vlSelf->chip_core__DOT__cfg_phase0_offset_x = VL_RAND_RESET_I(21);
    vlSelf->chip_core__DOT__cfg_phase90_offset_x = VL_RAND_RESET_I(21);
    vlSelf->chip_core__DOT__cfg_phase270_offset_x = VL_RAND_RESET_I(21);
    vlSelf->chip_core__DOT__cfg_phase0_offset_y = VL_RAND_RESET_I(21);
    vlSelf->chip_core__DOT__cfg_phase90_offset_y = VL_RAND_RESET_I(21);
    vlSelf->chip_core__DOT__cfg_phase270_offset_y = VL_RAND_RESET_I(21);
    vlSelf->chip_core__DOT__boot_complete = VL_RAND_RESET_I(1);
    vlSelf->chip_core__DOT__cfg_done = VL_RAND_RESET_I(1);
    vlSelf->chip_core__DOT__phase_offset_imported = VL_RAND_RESET_I(1);
    vlSelf->chip_core__DOT__soft_rst_n = VL_RAND_RESET_I(1);
    vlSelf->chip_core__DOT__delay_wave_cycle_x = VL_RAND_RESET_I(8);
    vlSelf->chip_core__DOT__delay_wave_cycle_y = VL_RAND_RESET_I(8);
    vlSelf->chip_core__DOT__raw_edge1_x = VL_RAND_RESET_I(21);
    vlSelf->chip_core__DOT__raw_edge2_x = VL_RAND_RESET_I(21);
    vlSelf->chip_core__DOT__raw_edge3_x = VL_RAND_RESET_I(21);
    vlSelf->chip_core__DOT__raw_edge1_y = VL_RAND_RESET_I(21);
    vlSelf->chip_core__DOT__raw_edge2_y = VL_RAND_RESET_I(21);
    vlSelf->chip_core__DOT__raw_edge3_y = VL_RAND_RESET_I(21);
    vlSelf->chip_core__DOT__cal_dir_x = VL_RAND_RESET_I(1);
    vlSelf->chip_core__DOT__cal_dir_y = VL_RAND_RESET_I(1);
    vlSelf->chip_core__DOT__latch_error_x = VL_RAND_RESET_I(1);
    vlSelf->chip_core__DOT__latch_error_y = VL_RAND_RESET_I(1);
    vlSelf->chip_core__DOT__jitter_flag_x = VL_RAND_RESET_I(1);
    vlSelf->chip_core__DOT__jitter_flag_y = VL_RAND_RESET_I(1);
    vlSelf->chip_core__DOT__phase_state_x = VL_RAND_RESET_I(2);
    vlSelf->chip_core__DOT__phase_state_y = VL_RAND_RESET_I(2);
    vlSelf->chip_core__DOT__votes_in_phase_x = VL_RAND_RESET_I(4);
    vlSelf->chip_core__DOT__votes_out_phase_x = VL_RAND_RESET_I(4);
    vlSelf->chip_core__DOT__votes_in_phase_y = VL_RAND_RESET_I(4);
    vlSelf->chip_core__DOT__votes_out_phase_y = VL_RAND_RESET_I(4);
    vlSelf->chip_core__DOT__cal_done_x = VL_RAND_RESET_I(1);
    vlSelf->chip_core__DOT__cal_done_y = VL_RAND_RESET_I(1);
    vlSelf->chip_core__DOT__cal_timeout_x = VL_RAND_RESET_I(1);
    vlSelf->chip_core__DOT__cal_timeout_y = VL_RAND_RESET_I(1);
    vlSelf->chip_core__DOT__cal_start = VL_RAND_RESET_I(1);
    vlSelf->chip_core__DOT__comp_x = VL_RAND_RESET_I(1);
    vlSelf->chip_core__DOT__comp_y = VL_RAND_RESET_I(1);
    vlSelf->chip_core__DOT__latch_phase90_x = VL_RAND_RESET_I(1);
    vlSelf->chip_core__DOT__latch_phase270_x = VL_RAND_RESET_I(1);
    vlSelf->chip_core__DOT__latch_phase90_ack_x = VL_RAND_RESET_I(1);
    vlSelf->chip_core__DOT__latch_phase270_ack_x = VL_RAND_RESET_I(1);
    vlSelf->chip_core__DOT__latch_phase90_y = VL_RAND_RESET_I(1);
    vlSelf->chip_core__DOT__latch_phase270_y = VL_RAND_RESET_I(1);
    vlSelf->chip_core__DOT__latch_phase90_ack_y = VL_RAND_RESET_I(1);
    vlSelf->chip_core__DOT__latch_phase270_ack_y = VL_RAND_RESET_I(1);
    vlSelf->chip_core__DOT__analog__out__strong__out20 = VL_RAND_RESET_Q(60);
    vlSelf->chip_core__DOT__spi_regs_inst__DOT__cs_sync = VL_RAND_RESET_I(2);
    vlSelf->chip_core__DOT__spi_regs_inst__DOT__sclk_sync = VL_RAND_RESET_I(2);
    vlSelf->chip_core__DOT__spi_regs_inst__DOT__mosi_sync = VL_RAND_RESET_I(2);
    vlSelf->chip_core__DOT__spi_regs_inst__DOT__sclk_d = VL_RAND_RESET_I(1);
    vlSelf->chip_core__DOT__spi_regs_inst__DOT__sclk_rise = VL_RAND_RESET_I(1);
    vlSelf->chip_core__DOT__spi_regs_inst__DOT__spi_state = VL_RAND_RESET_I(1);
    vlSelf->chip_core__DOT__spi_regs_inst__DOT__bit_cnt = VL_RAND_RESET_I(3);
    vlSelf->chip_core__DOT__spi_regs_inst__DOT__rw_n = VL_RAND_RESET_I(1);
    vlSelf->chip_core__DOT__spi_regs_inst__DOT__spi_addr = VL_RAND_RESET_I(7);
    vlSelf->chip_core__DOT__spi_regs_inst__DOT__rx_shift = VL_RAND_RESET_I(8);
    vlSelf->chip_core__DOT__spi_regs_inst__DOT__tx_shift = VL_RAND_RESET_I(8);
    vlSelf->chip_core__DOT__spi_regs_inst__DOT__reg_wr_en = VL_RAND_RESET_I(1);
    vlSelf->chip_core__DOT__spi_regs_inst__DOT__reg_wr_addr = VL_RAND_RESET_I(7);
    vlSelf->chip_core__DOT__spi_regs_inst__DOT__reg_wr_data = VL_RAND_RESET_I(8);
    vlSelf->chip_core__DOT__spi_regs_inst__DOT__rx_shift_next = VL_RAND_RESET_I(8);
    vlSelf->chip_core__DOT__spi_regs_inst__DOT__reg_rd_data = VL_RAND_RESET_I(8);
    vlSelf->chip_core__DOT__state_machine_inst__DOT__state_q = VL_RAND_RESET_I(3);
    vlSelf->chip_core__DOT__state_machine_inst__DOT__state_d = VL_RAND_RESET_I(3);
    vlSelf->chip_core__DOT__wave_controller_x_inst__DOT__phase_acc = VL_RAND_RESET_I(21);
    vlSelf->chip_core__DOT__wave_controller_x_inst__DOT__nco_en = VL_RAND_RESET_I(1);
    vlSelf->chip_core__DOT__wave_controller_x_inst__DOT__phase_next = VL_RAND_RESET_I(22);
    vlSelf->chip_core__DOT__wave_controller_x_inst__DOT__phase_overflow = VL_RAND_RESET_I(1);
    vlSelf->chip_core__DOT__wave_controller_x_inst__DOT__comp_sync0 = VL_RAND_RESET_I(1);
    vlSelf->chip_core__DOT__wave_controller_x_inst__DOT__comp_sync1 = VL_RAND_RESET_I(1);
    vlSelf->chip_core__DOT__wave_controller_x_inst__DOT__comp_sync2 = VL_RAND_RESET_I(1);
    vlSelf->chip_core__DOT__wave_controller_x_inst__DOT__comp_sync3 = VL_RAND_RESET_I(1);
    vlSelf->chip_core__DOT__wave_controller_x_inst__DOT__comp_sync4 = VL_RAND_RESET_I(1);
    vlSelf->chip_core__DOT__wave_controller_x_inst__DOT__comp_posedge = VL_RAND_RESET_I(1);
    vlSelf->chip_core__DOT__wave_controller_x_inst__DOT__comp_negedge = VL_RAND_RESET_I(1);
    vlSelf->chip_core__DOT__wave_controller_x_inst__DOT__wave_cycle_cnt = VL_RAND_RESET_I(8);
    vlSelf->chip_core__DOT__wave_controller_x_inst__DOT__capture_pending = VL_RAND_RESET_I(1);
    vlSelf->chip_core__DOT__wave_controller_x_inst__DOT__capture_step = VL_RAND_RESET_I(2);
    vlSelf->chip_core__DOT__wave_controller_x_inst__DOT__cycle_delta = VL_RAND_RESET_I(8);
    vlSelf->chip_core__DOT__wave_controller_x_inst__DOT__step_baseline = VL_RAND_RESET_I(21);
    vlSelf->chip_core__DOT__wave_controller_x_inst__DOT__wave_is_valid = VL_RAND_RESET_I(1);
    vlSelf->chip_core__DOT__wave_controller_x_inst__DOT__ds_acc = VL_RAND_RESET_I(9);
    vlSelf->chip_core__DOT__wave_controller_x_inst__DOT__ds_code = VL_RAND_RESET_I(8);
    vlSelf->chip_core__DOT__wave_controller_x_inst__DOT__cal_burst_armed = VL_RAND_RESET_I(1);
    vlSelf->chip_core__DOT__wave_controller_x_inst__DOT__cal_burst_active = VL_RAND_RESET_I(1);
    vlSelf->chip_core__DOT__wave_controller_x_inst__DOT__cal_burst_count = VL_RAND_RESET_I(2);
    vlSelf->chip_core__DOT__wave_controller_y_inst__DOT__phase_acc = VL_RAND_RESET_I(21);
    vlSelf->chip_core__DOT__wave_controller_y_inst__DOT__phase_next = VL_RAND_RESET_I(22);
    vlSelf->chip_core__DOT__wave_controller_y_inst__DOT__phase_overflow = VL_RAND_RESET_I(1);
    vlSelf->chip_core__DOT__wave_controller_y_inst__DOT__comp_sync0 = VL_RAND_RESET_I(1);
    vlSelf->chip_core__DOT__wave_controller_y_inst__DOT__comp_sync1 = VL_RAND_RESET_I(1);
    vlSelf->chip_core__DOT__wave_controller_y_inst__DOT__comp_sync2 = VL_RAND_RESET_I(1);
    vlSelf->chip_core__DOT__wave_controller_y_inst__DOT__comp_sync3 = VL_RAND_RESET_I(1);
    vlSelf->chip_core__DOT__wave_controller_y_inst__DOT__comp_sync4 = VL_RAND_RESET_I(1);
    vlSelf->chip_core__DOT__wave_controller_y_inst__DOT__comp_posedge = VL_RAND_RESET_I(1);
    vlSelf->chip_core__DOT__wave_controller_y_inst__DOT__comp_negedge = VL_RAND_RESET_I(1);
    vlSelf->chip_core__DOT__wave_controller_y_inst__DOT__wave_cycle_cnt = VL_RAND_RESET_I(8);
    vlSelf->chip_core__DOT__wave_controller_y_inst__DOT__capture_pending = VL_RAND_RESET_I(1);
    vlSelf->chip_core__DOT__wave_controller_y_inst__DOT__capture_step = VL_RAND_RESET_I(2);
    vlSelf->chip_core__DOT__wave_controller_y_inst__DOT__cycle_delta = VL_RAND_RESET_I(8);
    vlSelf->chip_core__DOT__wave_controller_y_inst__DOT__step_baseline = VL_RAND_RESET_I(21);
    vlSelf->chip_core__DOT__wave_controller_y_inst__DOT__wave_is_valid = VL_RAND_RESET_I(1);
    vlSelf->chip_core__DOT__wave_controller_y_inst__DOT__ds_acc = VL_RAND_RESET_I(9);
    vlSelf->chip_core__DOT__wave_controller_y_inst__DOT__ds_code = VL_RAND_RESET_I(8);
    vlSelf->chip_core__DOT__wave_controller_y_inst__DOT__cal_burst_armed = VL_RAND_RESET_I(1);
    vlSelf->chip_core__DOT__wave_controller_y_inst__DOT__cal_burst_active = VL_RAND_RESET_I(1);
    vlSelf->chip_core__DOT__wave_controller_y_inst__DOT__cal_burst_count = VL_RAND_RESET_I(2);
    vlSelf->chip_core__DOT__signal_processor_x_inst__DOT__comp_pipe = VL_RAND_RESET_I(4);
    vlSelf->chip_core__DOT__signal_processor_x_inst__DOT__s90_pipe = VL_RAND_RESET_I(4);
    vlSelf->chip_core__DOT__signal_processor_x_inst__DOT__s270_pipe = VL_RAND_RESET_I(4);
    vlSelf->chip_core__DOT__signal_processor_x_inst__DOT__s90 = VL_RAND_RESET_I(1);
    vlSelf->chip_core__DOT__signal_processor_x_inst__DOT__s90_valid = VL_RAND_RESET_I(1);
    vlSelf->chip_core__DOT__signal_processor_x_inst__DOT__vote_now = VL_RAND_RESET_I(1);
    vlSelf->chip_core__DOT__signal_processor_x_inst__DOT__state_now = VL_RAND_RESET_I(2);
    vlSelf->chip_core__DOT__signal_processor_x_inst__DOT__cnt_in = VL_RAND_RESET_I(4);
    vlSelf->chip_core__DOT__signal_processor_x_inst__DOT__cnt_out = VL_RAND_RESET_I(4);
    vlSelf->chip_core__DOT__signal_processor_x_inst__DOT__next_in = VL_RAND_RESET_I(4);
    vlSelf->chip_core__DOT__signal_processor_x_inst__DOT__next_out = VL_RAND_RESET_I(4);
    vlSelf->chip_core__DOT__signal_processor_x_inst__DOT__cycle_count = VL_RAND_RESET_I(4);
    vlSelf->chip_core__DOT__signal_processor_x_inst__DOT__window_done = VL_RAND_RESET_I(1);
    vlSelf->chip_core__DOT__signal_processor_y_inst__DOT__comp_pipe = VL_RAND_RESET_I(4);
    vlSelf->chip_core__DOT__signal_processor_y_inst__DOT__s90_pipe = VL_RAND_RESET_I(4);
    vlSelf->chip_core__DOT__signal_processor_y_inst__DOT__s270_pipe = VL_RAND_RESET_I(4);
    vlSelf->chip_core__DOT__signal_processor_y_inst__DOT__s90 = VL_RAND_RESET_I(1);
    vlSelf->chip_core__DOT__signal_processor_y_inst__DOT__s90_valid = VL_RAND_RESET_I(1);
    vlSelf->chip_core__DOT__signal_processor_y_inst__DOT__vote_now = VL_RAND_RESET_I(1);
    vlSelf->chip_core__DOT__signal_processor_y_inst__DOT__state_now = VL_RAND_RESET_I(2);
    vlSelf->chip_core__DOT__signal_processor_y_inst__DOT__cnt_in = VL_RAND_RESET_I(4);
    vlSelf->chip_core__DOT__signal_processor_y_inst__DOT__cnt_out = VL_RAND_RESET_I(4);
    vlSelf->chip_core__DOT__signal_processor_y_inst__DOT__next_in = VL_RAND_RESET_I(4);
    vlSelf->chip_core__DOT__signal_processor_y_inst__DOT__next_out = VL_RAND_RESET_I(4);
    vlSelf->chip_core__DOT__signal_processor_y_inst__DOT__cycle_count = VL_RAND_RESET_I(4);
    vlSelf->chip_core__DOT__signal_processor_y_inst__DOT__window_done = VL_RAND_RESET_I(1);
    vlSelf->__Vtrigprevexpr___TOP__clk__0 = VL_RAND_RESET_I(1);
    vlSelf->__Vtrigprevexpr___TOP__rst_n__0 = VL_RAND_RESET_I(1);
}
