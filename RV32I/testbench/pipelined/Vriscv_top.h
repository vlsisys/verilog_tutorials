// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Primary design header
//
// This header should be included by all source files instantiating the design.
// The class here is then constructed to instantiate the design.
// See the Verilator manual for examples.

#ifndef _VRISCV_TOP_H_
#define _VRISCV_TOP_H_  // guard

#include "verilated_heavy.h"

//==========

class Vriscv_top__Syms;
class Vriscv_top_VerilatedVcd;


//----------

VL_MODULE(Vriscv_top) {
  public:
    
    // PORTS
    // The application code writes and reads these signals to
    // propagate new values into/out from the Verilated model.
    VL_IN8(i_clk,0,0);
    VL_OUT8(o_riscv_dmem_wr_en,0,0);
    VL_OUT8(o_riscv_dmem_strb,3,0);
    VL_IN8(i_rstn,0,0);
    VL_OUT(o_riscv_imem_pc,31,0);
    VL_OUT(o_riscv_imem_instr,31,0);
    VL_OUT(o_riscv_dmem_addr,31,0);
    VL_OUT(o_riscv_dmem_wr_data,31,0);
    VL_OUT(o_riscv_dmem_rd_data,31,0);
    
    // LOCAL SIGNALS
    // Internals; generally not touched by application code
    // Anonymous structures to workaround compiler member-count bugs
    struct {
        CData/*0:0*/ riscv_top__DOT__u_riscv_cpu__DOT__u_riscv_hazard__DOT__stall;
        CData/*3:0*/ riscv_top__DOT__u_riscv_cpu__DOT__u_riscv_dmem_interface__DOT__dmem_intf_strb;
        WData/*95:0*/ riscv_top__DOT__u_riscv_cpu__DOT__mux_concat_pc[3];
        WData/*95:0*/ riscv_top__DOT__u_riscv_cpu__DOT__mux_concat_fwd_a[3];
        WData/*95:0*/ riscv_top__DOT__u_riscv_cpu__DOT__mux_concat_fwd_b[3];
        WData/*127:0*/ riscv_top__DOT__u_riscv_cpu__DOT__mux_concat_rd[4];
        WData/*255:0*/ riscv_top__DOT__u_riscv_cpu__DOT__u_riscv_ctrl__DOT__DEBUG_INSTR[8];
        IData/*31:0*/ riscv_top__DOT__u_riscv_cpu__DOT__u_riscv_dmem_interface__DOT__byte_aligned_dmem_rd_data;
        WData/*1023:0*/ riscv_top__DOT__u_riscv_imem__DOT__FILE_TEXT_MIF[32];
        WData/*1023:0*/ riscv_top__DOT__u_riscv_dmem__DOT__FILE_DATA_MIF[32];
        IData/*31:0*/ riscv_top__DOT__u_riscv_dmem__DOT__i;
        QData/*63:0*/ riscv_top__DOT__u_riscv_cpu__DOT__mux_concat_alu_a;
        QData/*63:0*/ riscv_top__DOT__u_riscv_cpu__DOT__mux_concat_alu_b;
        QData/*63:0*/ riscv_top__DOT__u_riscv_cpu__DOT__u_riscv_alu__DOT__DEBUG_ALU_OP;
        CData/*2:0*/ riscv_top__DOT__u_riscv_cpu__DOT__funct3[3];
        CData/*6:0*/ riscv_top__DOT__u_riscv_cpu__DOT__opcode[2];
        CData/*0:0*/ riscv_top__DOT__u_riscv_cpu__DOT__funct7_5b[1];
        CData/*0:0*/ riscv_top__DOT__u_riscv_cpu__DOT__w_reg_wr_en[1];
        CData/*1:0*/ riscv_top__DOT__u_riscv_cpu__DOT__w_src_rd[1];
        CData/*0:0*/ riscv_top__DOT__u_riscv_cpu__DOT__w_mem_wr_en[1];
        CData/*3:0*/ riscv_top__DOT__u_riscv_cpu__DOT__w_alu_ctrl[1];
        CData/*0:0*/ riscv_top__DOT__u_riscv_cpu__DOT__w_src_alu_a[1];
        CData/*0:0*/ riscv_top__DOT__u_riscv_cpu__DOT__w_src_alu_b[1];
        CData/*2:0*/ riscv_top__DOT__u_riscv_cpu__DOT__src_imm[1];
        CData/*0:0*/ riscv_top__DOT__u_riscv_cpu__DOT__reg_wr_en[3];
        CData/*1:0*/ riscv_top__DOT__u_riscv_cpu__DOT__src_rd[3];
        CData/*0:0*/ riscv_top__DOT__u_riscv_cpu__DOT__mem_wr_en[2];
        CData/*3:0*/ riscv_top__DOT__u_riscv_cpu__DOT__alu_ctrl[1];
        CData/*0:0*/ riscv_top__DOT__u_riscv_cpu__DOT__src_alu_a[1];
        CData/*0:0*/ riscv_top__DOT__u_riscv_cpu__DOT__src_alu_b[1];
        CData/*1:0*/ riscv_top__DOT__u_riscv_cpu__DOT__src_pc[1];
        IData/*31:0*/ riscv_top__DOT__u_riscv_cpu__DOT__pc[3];
        IData/*31:0*/ riscv_top__DOT__u_riscv_cpu__DOT__pc4[5];
        IData/*31:0*/ riscv_top__DOT__u_riscv_cpu__DOT__pcimm[1];
        IData/*31:0*/ riscv_top__DOT__u_riscv_cpu__DOT__instr[1];
        IData/*31:0*/ riscv_top__DOT__u_riscv_cpu__DOT__w_imm[1];
        IData/*31:0*/ riscv_top__DOT__u_riscv_cpu__DOT__imm[3];
        CData/*4:0*/ riscv_top__DOT__u_riscv_cpu__DOT__rs1[2];
        CData/*4:0*/ riscv_top__DOT__u_riscv_cpu__DOT__rs2[2];
        IData/*31:0*/ riscv_top__DOT__u_riscv_cpu__DOT__w_rs1_data[1];
        IData/*31:0*/ riscv_top__DOT__u_riscv_cpu__DOT__w_rs2_data[1];
        IData/*31:0*/ riscv_top__DOT__u_riscv_cpu__DOT__rs1_data[1];
        IData/*31:0*/ riscv_top__DOT__u_riscv_cpu__DOT__rs2_data[1];
        CData/*4:0*/ riscv_top__DOT__u_riscv_cpu__DOT__rd[4];
        IData/*31:0*/ riscv_top__DOT__u_riscv_cpu__DOT__rd_data[1];
        IData/*31:0*/ riscv_top__DOT__u_riscv_cpu__DOT__mem_rd_data[2];
        IData/*31:0*/ riscv_top__DOT__u_riscv_cpu__DOT__fwd_a[1];
        IData/*31:0*/ riscv_top__DOT__u_riscv_cpu__DOT__w_fwd_b[1];
        IData/*31:0*/ riscv_top__DOT__u_riscv_cpu__DOT__fwd_b[1];
        IData/*31:0*/ riscv_top__DOT__u_riscv_cpu__DOT__alu_a[1];
        IData/*31:0*/ riscv_top__DOT__u_riscv_cpu__DOT__alu_b[1];
        IData/*31:0*/ riscv_top__DOT__u_riscv_cpu__DOT__w_alu_out[1];
        IData/*31:0*/ riscv_top__DOT__u_riscv_cpu__DOT__alu_out[2];
        CData/*1:0*/ riscv_top__DOT__u_riscv_cpu__DOT__fwd_sel_a[1];
        CData/*1:0*/ riscv_top__DOT__u_riscv_cpu__DOT__fwd_sel_b[1];
        CData/*0:0*/ riscv_top__DOT__u_riscv_cpu__DOT__stall[2];
        CData/*0:0*/ riscv_top__DOT__u_riscv_cpu__DOT__flush[2];
        IData/*31:0*/ riscv_top__DOT__u_riscv_cpu__DOT__u_riscv_mux_pc__DOT__mux_input_arr[3];
        IData/*31:0*/ riscv_top__DOT__u_riscv_cpu__DOT__u_riscv_regfile__DOT__registers[32];
        IData/*31:0*/ riscv_top__DOT__u_riscv_cpu__DOT__u_riscv_mux_fwd_a__DOT__mux_input_arr[3];
        IData/*31:0*/ riscv_top__DOT__u_riscv_cpu__DOT__u_riscv_mux_fwd_b__DOT__mux_input_arr[3];
        IData/*31:0*/ riscv_top__DOT__u_riscv_cpu__DOT__u_riscv_mux_alu_a__DOT__mux_input_arr[2];
        IData/*31:0*/ riscv_top__DOT__u_riscv_cpu__DOT__u_riscv_mux_alu_b__DOT__mux_input_arr[2];
        IData/*31:0*/ riscv_top__DOT__u_riscv_cpu__DOT__u_riscv_mux_regfile_rd_data__DOT__mux_input_arr[4];
    };
    struct {
        IData/*31:0*/ riscv_top__DOT__u_riscv_imem__DOT__imem_arr[16384];
        IData/*31:0*/ riscv_top__DOT__u_riscv_dmem__DOT__dmem_arr[16384];
    };
    
    // LOCAL VARIABLES
    // Internals; generally not touched by application code
    CData/*2:0*/ riscv_top__DOT__u_riscv_cpu__DOT____Vcellout__u_riscv_ctrl__o_ctrl_src_imm;
    CData/*0:0*/ riscv_top__DOT__u_riscv_cpu__DOT____Vcellout__u_riscv_ctrl__o_ctrl_src_alu_b;
    CData/*3:0*/ riscv_top__DOT__u_riscv_cpu__DOT____Vcellout__u_riscv_ctrl__o_ctrl_alu_ctrl;
    CData/*1:0*/ riscv_top__DOT__u_riscv_cpu__DOT____Vcellout__u_riscv_ctrl__o_ctrl_src_rd;
    CData/*6:0*/ __Vtableidx1;
    CData/*6:0*/ __Vtableidx2;
    CData/*6:0*/ __Vtableidx3;
    CData/*3:0*/ __Vtableidx5;
    CData/*2:0*/ __Vtableidx6;
    CData/*0:0*/ __Vclklast__TOP__i_clk;
    SData/*10:0*/ __Vtableidx4;
    IData/*31:0*/ riscv_top__DOT__u_riscv_cpu__DOT____Vcellout__u_riscv_immext__o_imm_ext;
    IData/*31:0*/ riscv_top__DOT__u_riscv_cpu__DOT____Vcellout__u_riscv_alu__o_alu_out;
    CData/*0:0*/ __Vm_traceActivity[3];
    static CData/*2:0*/ __Vtable1_riscv_top__DOT__u_riscv_cpu__DOT____Vcellout__u_riscv_ctrl__o_ctrl_src_imm[128];
    static CData/*1:0*/ __Vtable2_riscv_top__DOT__u_riscv_cpu__DOT____Vcellout__u_riscv_ctrl__o_ctrl_src_rd[128];
    static CData/*0:0*/ __Vtable3_riscv_top__DOT__u_riscv_cpu__DOT____Vcellout__u_riscv_ctrl__o_ctrl_src_alu_b[128];
    static WData/*255:0*/ __Vtable4_riscv_top__DOT__u_riscv_cpu__DOT__u_riscv_ctrl__DOT__DEBUG_INSTR[2048][8];
    static QData/*63:0*/ __Vtable5_riscv_top__DOT__u_riscv_cpu__DOT__u_riscv_alu__DOT__DEBUG_ALU_OP[16];
    static CData/*3:0*/ __Vtable6_riscv_top__DOT__u_riscv_cpu__DOT__u_riscv_dmem_interface__DOT__dmem_intf_strb[8];
    
    // INTERNAL VARIABLES
    // Internals; generally not touched by application code
    Vriscv_top__Syms* __VlSymsp;  // Symbol table
    
    // CONSTRUCTORS
  private:
    VL_UNCOPYABLE(Vriscv_top);  ///< Copying not allowed
  public:
    /// Construct the model; called by application code
    /// The special name  may be used to make a wrapper with a
    /// single model invisible with respect to DPI scope names.
    Vriscv_top(const char* name = "TOP");
    /// Destroy the model; called (often implicitly) by application code
    ~Vriscv_top();
    /// Trace signals in the model; called by application code
    void trace(VerilatedVcdC* tfp, int levels, int options = 0);
    
    // API METHODS
    /// Evaluate the model.  Application must call when inputs change.
    void eval() { eval_step(); }
    /// Evaluate when calling multiple units/models per time step.
    void eval_step();
    /// Evaluate at end of a timestep for tracing, when using eval_step().
    /// Application must call after all eval() and before time changes.
    void eval_end_step() {}
    /// Simulation complete, run final blocks.  Application must call on completion.
    void final();
    
    // INTERNAL METHODS
  private:
    static void _eval_initial_loop(Vriscv_top__Syms* __restrict vlSymsp);
  public:
    void __Vconfigure(Vriscv_top__Syms* symsp, bool first);
  private:
    static QData _change_request(Vriscv_top__Syms* __restrict vlSymsp);
    static QData _change_request_1(Vriscv_top__Syms* __restrict vlSymsp);
    void _ctor_var_reset() VL_ATTR_COLD;
  public:
    static void _eval(Vriscv_top__Syms* __restrict vlSymsp);
  private:
#ifdef VL_DEBUG
    void _eval_debug_assertions();
#endif  // VL_DEBUG
  public:
    static void _eval_initial(Vriscv_top__Syms* __restrict vlSymsp) VL_ATTR_COLD;
    static void _eval_settle(Vriscv_top__Syms* __restrict vlSymsp) VL_ATTR_COLD;
    static void _initial__TOP__1(Vriscv_top__Syms* __restrict vlSymsp) VL_ATTR_COLD;
    static void _multiclk__TOP__5(Vriscv_top__Syms* __restrict vlSymsp);
    static void _sequent__TOP__2(Vriscv_top__Syms* __restrict vlSymsp);
    static void _sequent__TOP__3(Vriscv_top__Syms* __restrict vlSymsp);
    static void _settle__TOP__4(Vriscv_top__Syms* __restrict vlSymsp) VL_ATTR_COLD;
  private:
    static void traceChgSub0(void* userp, VerilatedVcd* tracep);
    static void traceChgTop0(void* userp, VerilatedVcd* tracep);
    static void traceCleanup(void* userp, VerilatedVcd* /*unused*/);
    static void traceFullSub0(void* userp, VerilatedVcd* tracep) VL_ATTR_COLD;
    static void traceFullTop0(void* userp, VerilatedVcd* tracep) VL_ATTR_COLD;
    static void traceInitSub0(void* userp, VerilatedVcd* tracep) VL_ATTR_COLD;
    static void traceInitTop(void* userp, VerilatedVcd* tracep) VL_ATTR_COLD;
    void traceRegister(VerilatedVcd* tracep) VL_ATTR_COLD;
    static void traceInit(void* userp, VerilatedVcd* tracep, uint32_t code) VL_ATTR_COLD;
} VL_ATTR_ALIGNED(VL_CACHE_LINE_BYTES);

//----------


#endif  // guard
