// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vchip_core.h for the primary calling header

#include "Vchip_core__pch.h"
#include "Vchip_core__Syms.h"
#include "Vchip_core___024root.h"

void Vchip_core___024root___ctor_var_reset(Vchip_core___024root* vlSelf);

Vchip_core___024root::Vchip_core___024root(Vchip_core__Syms* symsp, const char* v__name)
    : VerilatedModule{v__name}
    , vlSymsp{symsp}
 {
    // Reset structure values
    Vchip_core___024root___ctor_var_reset(this);
}

void Vchip_core___024root::__Vconfigure(bool first) {
    (void)first;  // Prevent unused variable warning
}

Vchip_core___024root::~Vchip_core___024root() {
}
