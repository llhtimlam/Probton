// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Symbol table internal header
//
// Internal details; most calling programs do not need this header,
// unless using verilator public meta comments.

#ifndef VERILATED_VCHIP_CORE__SYMS_H_
#define VERILATED_VCHIP_CORE__SYMS_H_  // guard

#include "verilated.h"

// INCLUDE MODEL CLASS

#include "Vchip_core.h"

// INCLUDE MODULE CLASSES
#include "Vchip_core___024root.h"

// SYMS CLASS (contains all model state)
class alignas(VL_CACHE_LINE_BYTES)Vchip_core__Syms final : public VerilatedSyms {
  public:
    // INTERNAL STATE
    Vchip_core* const __Vm_modelp;
    VlDeleter __Vm_deleter;
    bool __Vm_didInit = false;

    // MODULE INSTANCE STATE
    Vchip_core___024root           TOP;

    // CONSTRUCTORS
    Vchip_core__Syms(VerilatedContext* contextp, const char* namep, Vchip_core* modelp);
    ~Vchip_core__Syms();

    // METHODS
    const char* name() { return TOP.name(); }
};

#endif  // guard
