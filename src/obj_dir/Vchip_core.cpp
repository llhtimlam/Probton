// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Model implementation (design independent parts)

#include "Vchip_core__pch.h"

//============================================================
// Constructors

Vchip_core::Vchip_core(VerilatedContext* _vcontextp__, const char* _vcname__)
    : VerilatedModel{*_vcontextp__}
    , vlSymsp{new Vchip_core__Syms(contextp(), _vcname__, this)}
    , clk{vlSymsp->TOP.clk}
    , rst_n{vlSymsp->TOP.rst_n}
    , VDD{vlSymsp->TOP.VDD}
    , VSS{vlSymsp->TOP.VSS}
    , input_in{vlSymsp->TOP.input_in}
    , input_pu{vlSymsp->TOP.input_pu}
    , input_pd{vlSymsp->TOP.input_pd}
    , bidir_in{vlSymsp->TOP.bidir_in}
    , bidir_out{vlSymsp->TOP.bidir_out}
    , bidir_oe{vlSymsp->TOP.bidir_oe}
    , bidir_cs{vlSymsp->TOP.bidir_cs}
    , bidir_sl{vlSymsp->TOP.bidir_sl}
    , bidir_ie{vlSymsp->TOP.bidir_ie}
    , bidir_pu{vlSymsp->TOP.bidir_pu}
    , bidir_pd{vlSymsp->TOP.bidir_pd}
    , analog{vlSymsp->TOP.analog}
    , rootp{&(vlSymsp->TOP)}
{
    // Register model with the context
    contextp()->addModel(this);
}

Vchip_core::Vchip_core(const char* _vcname__)
    : Vchip_core(Verilated::threadContextp(), _vcname__)
{
}

//============================================================
// Destructor

Vchip_core::~Vchip_core() {
    delete vlSymsp;
}

//============================================================
// Evaluation function

#ifdef VL_DEBUG
void Vchip_core___024root___eval_debug_assertions(Vchip_core___024root* vlSelf);
#endif  // VL_DEBUG
void Vchip_core___024root___eval_static(Vchip_core___024root* vlSelf);
void Vchip_core___024root___eval_initial(Vchip_core___024root* vlSelf);
void Vchip_core___024root___eval_settle(Vchip_core___024root* vlSelf);
void Vchip_core___024root___eval(Vchip_core___024root* vlSelf);

void Vchip_core::eval_step() {
    VL_DEBUG_IF(VL_DBG_MSGF("+++++TOP Evaluate Vchip_core::eval_step\n"); );
#ifdef VL_DEBUG
    // Debug assertions
    Vchip_core___024root___eval_debug_assertions(&(vlSymsp->TOP));
#endif  // VL_DEBUG
    vlSymsp->__Vm_deleter.deleteAll();
    if (VL_UNLIKELY(!vlSymsp->__Vm_didInit)) {
        vlSymsp->__Vm_didInit = true;
        VL_DEBUG_IF(VL_DBG_MSGF("+ Initial\n"););
        Vchip_core___024root___eval_static(&(vlSymsp->TOP));
        Vchip_core___024root___eval_initial(&(vlSymsp->TOP));
        Vchip_core___024root___eval_settle(&(vlSymsp->TOP));
    }
    VL_DEBUG_IF(VL_DBG_MSGF("+ Eval\n"););
    Vchip_core___024root___eval(&(vlSymsp->TOP));
    // Evaluate cleanup
    Verilated::endOfEval(vlSymsp->__Vm_evalMsgQp);
}

//============================================================
// Events and timing
bool Vchip_core::eventsPending() { return false; }

uint64_t Vchip_core::nextTimeSlot() {
    VL_FATAL_MT(__FILE__, __LINE__, "", "No delays in the design");
    return 0;
}

//============================================================
// Utilities

const char* Vchip_core::name() const {
    return vlSymsp->name();
}

//============================================================
// Invoke final blocks

void Vchip_core___024root___eval_final(Vchip_core___024root* vlSelf);

VL_ATTR_COLD void Vchip_core::final() {
    Vchip_core___024root___eval_final(&(vlSymsp->TOP));
}

//============================================================
// Implementations of abstract methods from VerilatedModel

const char* Vchip_core::hierName() const { return vlSymsp->name(); }
const char* Vchip_core::modelName() const { return "Vchip_core"; }
unsigned Vchip_core::threads() const { return 1; }
void Vchip_core::prepareClone() const { contextp()->prepareClone(); }
void Vchip_core::atClone() const {
    contextp()->threadPoolpOnClone();
}
