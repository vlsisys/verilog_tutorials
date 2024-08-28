// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Tracing implementation internals
#include "verilated_vcd_c.h"
#include "Vriscv_top__Syms.h"


void Vriscv_top::traceChgTop0(void* userp, VerilatedVcd* tracep) {
    Vriscv_top__Syms* __restrict vlSymsp = static_cast<Vriscv_top__Syms*>(userp);
    Vriscv_top* const __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Variables
    if (VL_UNLIKELY(!vlSymsp->__Vm_activity)) return;
    // Body
    {
        vlTOPp->traceChgSub0(userp, tracep);
    }
}

void Vriscv_top::traceChgSub0(void* userp, VerilatedVcd* tracep) {
    Vriscv_top__Syms* __restrict vlSymsp = static_cast<Vriscv_top__Syms*>(userp);
    Vriscv_top* const __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    vluint32_t* const oldp = tracep->oldp(vlSymsp->__Vm_baseCode + 1);
    if (false && oldp) {}  // Prevent unused
    // Body
    {
        if (VL_UNLIKELY(vlTOPp->__Vm_traceActivity[0U])) {
            tracep->chgWData(oldp+0,(vlTOPp->riscv_top__DOT__u_riscv_imem__DOT__FILE_TEXT_MIF),1024);
            tracep->chgWData(oldp+32,(vlTOPp->riscv_top__DOT__u_riscv_dmem__DOT__FILE_DATA_MIF),1024);
        }
        if (VL_UNLIKELY(vlTOPp->__Vm_traceActivity[1U])) {
            tracep->chgCData(oldp+64,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__funct3[0]),3);
            tracep->chgCData(oldp+65,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__funct3[1]),3);
            tracep->chgCData(oldp+66,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__funct3[2]),3);
            tracep->chgCData(oldp+67,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__opcode[0]),7);
            tracep->chgCData(oldp+68,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__opcode[1]),7);
            tracep->chgBit(oldp+69,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__funct7_5b[0]));
            tracep->chgBit(oldp+70,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__w_reg_wr_en[0]));
            tracep->chgCData(oldp+71,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__w_src_rd[0]),2);
            tracep->chgBit(oldp+72,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__w_mem_wr_en[0]));
            tracep->chgCData(oldp+73,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__w_alu_ctrl[0]),4);
            tracep->chgBit(oldp+74,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__w_src_alu_a[0]));
            tracep->chgBit(oldp+75,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__w_src_alu_b[0]));
            tracep->chgCData(oldp+76,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__src_imm[0]),3);
            tracep->chgBit(oldp+77,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__reg_wr_en[0]));
            tracep->chgBit(oldp+78,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__reg_wr_en[1]));
            tracep->chgBit(oldp+79,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__reg_wr_en[2]));
            tracep->chgCData(oldp+80,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__src_rd[0]),2);
            tracep->chgCData(oldp+81,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__src_rd[1]),2);
            tracep->chgCData(oldp+82,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__src_rd[2]),2);
            tracep->chgBit(oldp+83,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__mem_wr_en[0]));
            tracep->chgBit(oldp+84,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__mem_wr_en[1]));
            tracep->chgCData(oldp+85,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__alu_ctrl[0]),4);
            tracep->chgBit(oldp+86,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__src_alu_a[0]));
            tracep->chgBit(oldp+87,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__src_alu_b[0]));
            tracep->chgCData(oldp+88,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__src_pc[0]),2);
            tracep->chgIData(oldp+89,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__pc[0]),32);
            tracep->chgIData(oldp+90,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__pc[1]),32);
            tracep->chgIData(oldp+91,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__pc[2]),32);
            tracep->chgIData(oldp+92,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__pc4[0]),32);
            tracep->chgIData(oldp+93,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__pc4[1]),32);
            tracep->chgIData(oldp+94,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__pc4[2]),32);
            tracep->chgIData(oldp+95,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__pc4[3]),32);
            tracep->chgIData(oldp+96,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__pc4[4]),32);
            tracep->chgIData(oldp+97,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__pcimm[0]),32);
            tracep->chgIData(oldp+98,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__instr[0]),32);
            tracep->chgIData(oldp+99,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__w_imm[0]),32);
            tracep->chgIData(oldp+100,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__imm[0]),32);
            tracep->chgIData(oldp+101,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__imm[1]),32);
            tracep->chgIData(oldp+102,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__imm[2]),32);
            tracep->chgCData(oldp+103,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__rs1[0]),5);
            tracep->chgCData(oldp+104,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__rs1[1]),5);
            tracep->chgCData(oldp+105,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__rs2[0]),5);
            tracep->chgCData(oldp+106,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__rs2[1]),5);
            tracep->chgIData(oldp+107,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__rs1_data[0]),32);
            tracep->chgIData(oldp+108,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__rs2_data[0]),32);
            tracep->chgCData(oldp+109,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__rd[0]),5);
            tracep->chgCData(oldp+110,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__rd[1]),5);
            tracep->chgCData(oldp+111,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__rd[2]),5);
            tracep->chgCData(oldp+112,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__rd[3]),5);
            tracep->chgIData(oldp+113,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__rd_data[0]),32);
            tracep->chgIData(oldp+114,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__mem_rd_data[0]),32);
            tracep->chgIData(oldp+115,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__mem_rd_data[1]),32);
            tracep->chgIData(oldp+116,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__fwd_a[0]),32);
            tracep->chgIData(oldp+117,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__w_fwd_b[0]),32);
            tracep->chgIData(oldp+118,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__fwd_b[0]),32);
            tracep->chgIData(oldp+119,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__alu_a[0]),32);
            tracep->chgIData(oldp+120,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__alu_b[0]),32);
            tracep->chgIData(oldp+121,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__w_alu_out[0]),32);
            tracep->chgIData(oldp+122,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__alu_out[0]),32);
            tracep->chgIData(oldp+123,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__alu_out[1]),32);
            tracep->chgCData(oldp+124,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__fwd_sel_a[0]),2);
            tracep->chgCData(oldp+125,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__fwd_sel_b[0]),2);
            tracep->chgBit(oldp+126,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__stall[0]));
            tracep->chgBit(oldp+127,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__stall[1]));
            tracep->chgBit(oldp+128,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__flush[0]));
            tracep->chgBit(oldp+129,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__flush[1]));
            tracep->chgWData(oldp+130,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__mux_concat_pc),96);
            tracep->chgWData(oldp+133,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__mux_concat_fwd_a),96);
            tracep->chgWData(oldp+136,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__mux_concat_fwd_b),96);
            tracep->chgQData(oldp+139,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__mux_concat_alu_a),64);
            tracep->chgQData(oldp+141,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__mux_concat_alu_b),64);
            tracep->chgWData(oldp+143,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__mux_concat_rd),128);
            tracep->chgIData(oldp+147,(((2U >= vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__src_pc
                                         [0U]) ? vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__u_riscv_mux_pc__DOT__mux_input_arr
                                        [vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__src_pc
                                        [0U]] : 0U)),32);
            tracep->chgCData(oldp+148,(((((vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__rs1
                                           [1U] == 
                                           vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__rd
                                           [2U]) & 
                                          vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__reg_wr_en
                                          [1U]) & (0U 
                                                   != 
                                                   vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__rs1
                                                   [1U]))
                                         ? 1U : (((
                                                   (vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__rs1
                                                    [1U] 
                                                    == 
                                                    vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__rd
                                                    [3U]) 
                                                   & vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__reg_wr_en
                                                   [2U]) 
                                                  & (0U 
                                                     != 
                                                     vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__rs1
                                                     [1U]))
                                                  ? 2U
                                                  : 0U))),2);
            tracep->chgCData(oldp+149,(((((vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__rs2
                                           [1U] == 
                                           vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__rd
                                           [2U]) & 
                                          vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__reg_wr_en
                                          [1U]) & (0U 
                                                   != 
                                                   vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__rs2
                                                   [1U]))
                                         ? 1U : (((
                                                   (vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__rs2
                                                    [1U] 
                                                    == 
                                                    vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__rd
                                                    [3U]) 
                                                   & vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__reg_wr_en
                                                   [2U]) 
                                                  & (0U 
                                                     != 
                                                     vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__rs2
                                                     [1U]))
                                                  ? 2U
                                                  : 0U))),2);
            tracep->chgBit(oldp+150,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__u_riscv_hazard__DOT__stall));
            tracep->chgBit(oldp+151,((0U != vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__src_pc
                                      [0U])));
            tracep->chgBit(oldp+152,(((IData)(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__u_riscv_hazard__DOT__stall) 
                                      | (0U != vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__src_pc
                                         [0U]))));
            tracep->chgCData(oldp+153,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__src_pc
                                       [0U]),2);
            tracep->chgCData(oldp+154,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__src_rd
                                       [0U]),2);
            tracep->chgCData(oldp+155,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__rs1
                                       [0U]),5);
            tracep->chgCData(oldp+156,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__rs2
                                       [0U]),5);
            tracep->chgCData(oldp+157,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__rs1
                                       [1U]),5);
            tracep->chgCData(oldp+158,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__rs2
                                       [1U]),5);
            tracep->chgCData(oldp+159,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__rd
                                       [1U]),5);
            tracep->chgCData(oldp+160,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__rd
                                       [2U]),5);
            tracep->chgCData(oldp+161,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__rd
                                       [3U]),5);
            tracep->chgBit(oldp+162,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__reg_wr_en
                                     [0U]));
            tracep->chgBit(oldp+163,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__reg_wr_en
                                     [1U]));
            tracep->chgBit(oldp+164,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__reg_wr_en
                                     [2U]));
            tracep->chgIData(oldp+165,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__u_riscv_mux_pc__DOT__mux_input_arr[0]),32);
            tracep->chgIData(oldp+166,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__u_riscv_mux_pc__DOT__mux_input_arr[1]),32);
            tracep->chgIData(oldp+167,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__u_riscv_mux_pc__DOT__mux_input_arr[2]),32);
            tracep->chgIData(oldp+168,(((IData)(4U) 
                                        + vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__pc
                                        [0U])),32);
            tracep->chgIData(oldp+169,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__pc
                                       [0U]),32);
            tracep->chgBit(oldp+170,((1U & (~ ((0x23U 
                                                == 
                                                vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__opcode
                                                [0U]) 
                                               | (0x63U 
                                                  == 
                                                  vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__opcode
                                                  [0U]))))));
            tracep->chgCData(oldp+171,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT____Vcellout__u_riscv_ctrl__o_ctrl_src_rd),2);
            tracep->chgBit(oldp+172,((0x23U == vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__opcode
                                      [0U])));
            tracep->chgCData(oldp+173,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT____Vcellout__u_riscv_ctrl__o_ctrl_alu_ctrl),4);
            tracep->chgBit(oldp+174,((0x17U == vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__opcode
                                      [0U])));
            tracep->chgBit(oldp+175,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT____Vcellout__u_riscv_ctrl__o_ctrl_src_alu_b));
            tracep->chgCData(oldp+176,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT____Vcellout__u_riscv_ctrl__o_ctrl_src_imm),3);
            tracep->chgCData(oldp+177,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__opcode
                                       [0U]),7);
            tracep->chgCData(oldp+178,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__funct3
                                       [0U]),3);
            tracep->chgBit(oldp+179,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__funct7_5b
                                     [0U]));
            tracep->chgWData(oldp+180,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__u_riscv_ctrl__DOT__DEBUG_INSTR),256);
            tracep->chgIData(oldp+188,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__rd_data
                                       [0U]),32);
            tracep->chgIData(oldp+189,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT____Vcellout__u_riscv_immext__o_imm_ext),32);
            tracep->chgIData(oldp+190,((0x1ffffffU 
                                        & (vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__instr
                                           [0U] >> 7U))),25);
            tracep->chgCData(oldp+191,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__src_imm
                                       [0U]),3);
            tracep->chgIData(oldp+192,(((2U >= vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__fwd_sel_a
                                         [0U]) ? vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__u_riscv_mux_fwd_a__DOT__mux_input_arr
                                        [vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__fwd_sel_a
                                        [0U]] : 0U)),32);
            tracep->chgCData(oldp+193,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__fwd_sel_a
                                       [0U]),2);
            tracep->chgIData(oldp+194,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__u_riscv_mux_fwd_a__DOT__mux_input_arr[0]),32);
            tracep->chgIData(oldp+195,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__u_riscv_mux_fwd_a__DOT__mux_input_arr[1]),32);
            tracep->chgIData(oldp+196,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__u_riscv_mux_fwd_a__DOT__mux_input_arr[2]),32);
            tracep->chgIData(oldp+197,(((2U >= vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__fwd_sel_b
                                         [0U]) ? vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__u_riscv_mux_fwd_b__DOT__mux_input_arr
                                        [vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__fwd_sel_b
                                        [0U]] : 0U)),32);
            tracep->chgCData(oldp+198,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__fwd_sel_b
                                       [0U]),2);
            tracep->chgIData(oldp+199,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__u_riscv_mux_fwd_b__DOT__mux_input_arr[0]),32);
            tracep->chgIData(oldp+200,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__u_riscv_mux_fwd_b__DOT__mux_input_arr[1]),32);
            tracep->chgIData(oldp+201,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__u_riscv_mux_fwd_b__DOT__mux_input_arr[2]),32);
            tracep->chgIData(oldp+202,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__u_riscv_mux_alu_a__DOT__mux_input_arr
                                       [vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__src_alu_a
                                       [0U]]),32);
            tracep->chgBit(oldp+203,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__src_alu_a
                                     [0U]));
            tracep->chgIData(oldp+204,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__u_riscv_mux_alu_a__DOT__mux_input_arr[0]),32);
            tracep->chgIData(oldp+205,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__u_riscv_mux_alu_a__DOT__mux_input_arr[1]),32);
            tracep->chgIData(oldp+206,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__u_riscv_mux_alu_b__DOT__mux_input_arr
                                       [vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__src_alu_b
                                       [0U]]),32);
            tracep->chgBit(oldp+207,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__src_alu_b
                                     [0U]));
            tracep->chgIData(oldp+208,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__u_riscv_mux_alu_b__DOT__mux_input_arr[0]),32);
            tracep->chgIData(oldp+209,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__u_riscv_mux_alu_b__DOT__mux_input_arr[1]),32);
            tracep->chgIData(oldp+210,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT____Vcellout__u_riscv_alu__o_alu_out),32);
            tracep->chgCData(oldp+211,(((0x63U == vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__opcode
                                         [1U]) ? ((
                                                   (0x63U 
                                                    == 
                                                    vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__opcode
                                                    [1U]) 
                                                   & ((4U 
                                                       & vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__funct3
                                                       [1U])
                                                       ? 
                                                      ((2U 
                                                        & vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__funct3
                                                        [1U])
                                                        ? 
                                                       ((1U 
                                                         & vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__funct3
                                                         [1U])
                                                         ? 
                                                        (0U 
                                                         == vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT____Vcellout__u_riscv_alu__o_alu_out)
                                                         : 
                                                        (0U 
                                                         != vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT____Vcellout__u_riscv_alu__o_alu_out))
                                                        : 
                                                       ((1U 
                                                         & vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__funct3
                                                         [1U])
                                                         ? 
                                                        (0U 
                                                         == vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT____Vcellout__u_riscv_alu__o_alu_out)
                                                         : 
                                                        (0U 
                                                         != vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT____Vcellout__u_riscv_alu__o_alu_out)))
                                                       : 
                                                      ((~ 
                                                        (vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__funct3
                                                         [1U] 
                                                         >> 1U)) 
                                                       & ((1U 
                                                           & vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__funct3
                                                           [1U])
                                                           ? 
                                                          (0U 
                                                           != vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT____Vcellout__u_riscv_alu__o_alu_out)
                                                           : 
                                                          (0U 
                                                           == vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT____Vcellout__u_riscv_alu__o_alu_out)))))
                                                   ? 1U
                                                   : 0U)
                                         : ((0x6fU 
                                             == vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__opcode
                                             [1U]) ? 1U
                                             : ((0x67U 
                                                 == 
                                                 vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__opcode
                                                 [1U])
                                                 ? 2U
                                                 : 0U)))),2);
            tracep->chgIData(oldp+212,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__alu_a
                                       [0U]),32);
            tracep->chgIData(oldp+213,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__alu_b
                                       [0U]),32);
            tracep->chgCData(oldp+214,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__opcode
                                       [1U]),7);
            tracep->chgCData(oldp+215,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__funct3
                                       [1U]),3);
            tracep->chgCData(oldp+216,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__alu_ctrl
                                       [0U]),4);
            tracep->chgBit(oldp+217,((0U == vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT____Vcellout__u_riscv_alu__o_alu_out)));
            tracep->chgBit(oldp+218,(((0x63U == vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__opcode
                                       [1U]) & ((4U 
                                                 & vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__funct3
                                                 [1U])
                                                 ? 
                                                ((2U 
                                                  & vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__funct3
                                                  [1U])
                                                  ? 
                                                 ((1U 
                                                   & vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__funct3
                                                   [1U])
                                                   ? 
                                                  (0U 
                                                   == vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT____Vcellout__u_riscv_alu__o_alu_out)
                                                   : 
                                                  (0U 
                                                   != vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT____Vcellout__u_riscv_alu__o_alu_out))
                                                  : 
                                                 ((1U 
                                                   & vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__funct3
                                                   [1U])
                                                   ? 
                                                  (0U 
                                                   == vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT____Vcellout__u_riscv_alu__o_alu_out)
                                                   : 
                                                  (0U 
                                                   != vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT____Vcellout__u_riscv_alu__o_alu_out)))
                                                 : 
                                                ((~ 
                                                  (vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__funct3
                                                   [1U] 
                                                   >> 1U)) 
                                                 & ((1U 
                                                     & vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__funct3
                                                     [1U])
                                                     ? 
                                                    (0U 
                                                     != vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT____Vcellout__u_riscv_alu__o_alu_out)
                                                     : 
                                                    (0U 
                                                     == vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT____Vcellout__u_riscv_alu__o_alu_out)))))));
            tracep->chgQData(oldp+219,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__u_riscv_alu__DOT__DEBUG_ALU_OP),64);
            tracep->chgIData(oldp+221,((vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__pc
                                        [2U] + vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__imm
                                        [0U])),32);
            tracep->chgIData(oldp+222,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__pc
                                       [2U]),32);
            tracep->chgIData(oldp+223,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__imm
                                       [0U]),32);
            tracep->chgIData(oldp+224,(((4U & vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__funct3
                                         [2U]) ? ((2U 
                                                   & vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__funct3
                                                   [2U])
                                                   ? 0U
                                                   : 
                                                  ((1U 
                                                    & vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__funct3
                                                    [2U])
                                                    ? 
                                                   (0xffffU 
                                                    & vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__u_riscv_dmem_interface__DOT__byte_aligned_dmem_rd_data)
                                                    : 
                                                   (0xffU 
                                                    & vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__u_riscv_dmem_interface__DOT__byte_aligned_dmem_rd_data)))
                                         : ((2U & vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__funct3
                                             [2U]) ? 
                                            ((1U & 
                                              vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__funct3
                                              [2U])
                                              ? 0U : vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__u_riscv_dmem_interface__DOT__byte_aligned_dmem_rd_data)
                                             : ((1U 
                                                 & vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__funct3
                                                 [2U])
                                                 ? 
                                                ((0xffff0000U 
                                                  & ((- (IData)(
                                                                (1U 
                                                                 & (vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__u_riscv_dmem_interface__DOT__byte_aligned_dmem_rd_data 
                                                                    >> 0xfU)))) 
                                                     << 0x10U)) 
                                                 | (0xffffU 
                                                    & vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__u_riscv_dmem_interface__DOT__byte_aligned_dmem_rd_data))
                                                 : 
                                                ((0xffffff00U 
                                                  & ((- (IData)(
                                                                (1U 
                                                                 & (vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__u_riscv_dmem_interface__DOT__byte_aligned_dmem_rd_data 
                                                                    >> 7U)))) 
                                                     << 8U)) 
                                                 | (0xffU 
                                                    & vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__u_riscv_dmem_interface__DOT__byte_aligned_dmem_rd_data)))))),32);
            tracep->chgIData(oldp+225,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__alu_out
                                       [0U]),32);
            tracep->chgBit(oldp+226,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__mem_wr_en
                                     [1U]));
            tracep->chgIData(oldp+227,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__fwd_b
                                       [0U]),32);
            tracep->chgCData(oldp+228,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__funct3
                                       [2U]),3);
            tracep->chgCData(oldp+229,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__u_riscv_dmem_interface__DOT__dmem_intf_strb),4);
            tracep->chgIData(oldp+230,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__u_riscv_dmem_interface__DOT__byte_aligned_dmem_rd_data),32);
            tracep->chgIData(oldp+231,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__u_riscv_mux_regfile_rd_data__DOT__mux_input_arr
                                       [vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__src_rd
                                       [2U]]),32);
            tracep->chgCData(oldp+232,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__src_rd
                                       [2U]),2);
            tracep->chgIData(oldp+233,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__u_riscv_mux_regfile_rd_data__DOT__mux_input_arr[0]),32);
            tracep->chgIData(oldp+234,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__u_riscv_mux_regfile_rd_data__DOT__mux_input_arr[1]),32);
            tracep->chgIData(oldp+235,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__u_riscv_mux_regfile_rd_data__DOT__mux_input_arr[2]),32);
            tracep->chgIData(oldp+236,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__u_riscv_mux_regfile_rd_data__DOT__mux_input_arr[3]),32);
            tracep->chgIData(oldp+237,(vlTOPp->riscv_top__DOT__u_riscv_dmem__DOT__i),32);
        }
        if (VL_UNLIKELY(vlTOPp->__Vm_traceActivity[2U])) {
            tracep->chgIData(oldp+238,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__u_riscv_regfile__DOT__registers[0]),32);
            tracep->chgIData(oldp+239,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__u_riscv_regfile__DOT__registers[1]),32);
            tracep->chgIData(oldp+240,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__u_riscv_regfile__DOT__registers[2]),32);
            tracep->chgIData(oldp+241,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__u_riscv_regfile__DOT__registers[3]),32);
            tracep->chgIData(oldp+242,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__u_riscv_regfile__DOT__registers[4]),32);
            tracep->chgIData(oldp+243,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__u_riscv_regfile__DOT__registers[5]),32);
            tracep->chgIData(oldp+244,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__u_riscv_regfile__DOT__registers[6]),32);
            tracep->chgIData(oldp+245,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__u_riscv_regfile__DOT__registers[7]),32);
            tracep->chgIData(oldp+246,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__u_riscv_regfile__DOT__registers[8]),32);
            tracep->chgIData(oldp+247,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__u_riscv_regfile__DOT__registers[9]),32);
            tracep->chgIData(oldp+248,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__u_riscv_regfile__DOT__registers[10]),32);
            tracep->chgIData(oldp+249,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__u_riscv_regfile__DOT__registers[11]),32);
            tracep->chgIData(oldp+250,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__u_riscv_regfile__DOT__registers[12]),32);
            tracep->chgIData(oldp+251,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__u_riscv_regfile__DOT__registers[13]),32);
            tracep->chgIData(oldp+252,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__u_riscv_regfile__DOT__registers[14]),32);
            tracep->chgIData(oldp+253,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__u_riscv_regfile__DOT__registers[15]),32);
            tracep->chgIData(oldp+254,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__u_riscv_regfile__DOT__registers[16]),32);
            tracep->chgIData(oldp+255,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__u_riscv_regfile__DOT__registers[17]),32);
            tracep->chgIData(oldp+256,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__u_riscv_regfile__DOT__registers[18]),32);
            tracep->chgIData(oldp+257,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__u_riscv_regfile__DOT__registers[19]),32);
            tracep->chgIData(oldp+258,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__u_riscv_regfile__DOT__registers[20]),32);
            tracep->chgIData(oldp+259,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__u_riscv_regfile__DOT__registers[21]),32);
            tracep->chgIData(oldp+260,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__u_riscv_regfile__DOT__registers[22]),32);
            tracep->chgIData(oldp+261,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__u_riscv_regfile__DOT__registers[23]),32);
            tracep->chgIData(oldp+262,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__u_riscv_regfile__DOT__registers[24]),32);
            tracep->chgIData(oldp+263,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__u_riscv_regfile__DOT__registers[25]),32);
            tracep->chgIData(oldp+264,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__u_riscv_regfile__DOT__registers[26]),32);
            tracep->chgIData(oldp+265,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__u_riscv_regfile__DOT__registers[27]),32);
            tracep->chgIData(oldp+266,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__u_riscv_regfile__DOT__registers[28]),32);
            tracep->chgIData(oldp+267,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__u_riscv_regfile__DOT__registers[29]),32);
            tracep->chgIData(oldp+268,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__u_riscv_regfile__DOT__registers[30]),32);
            tracep->chgIData(oldp+269,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__u_riscv_regfile__DOT__registers[31]),32);
        }
        tracep->chgIData(oldp+270,(vlTOPp->o_riscv_imem_pc),32);
        tracep->chgIData(oldp+271,(vlTOPp->o_riscv_imem_instr),32);
        tracep->chgIData(oldp+272,(vlTOPp->o_riscv_dmem_addr),32);
        tracep->chgBit(oldp+273,(vlTOPp->o_riscv_dmem_wr_en));
        tracep->chgCData(oldp+274,(vlTOPp->o_riscv_dmem_strb),4);
        tracep->chgIData(oldp+275,(vlTOPp->o_riscv_dmem_wr_data),32);
        tracep->chgIData(oldp+276,(vlTOPp->o_riscv_dmem_rd_data),32);
        tracep->chgBit(oldp+277,(vlTOPp->i_clk));
        tracep->chgBit(oldp+278,(vlTOPp->i_rstn));
        tracep->chgIData(oldp+279,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__w_rs1_data[0]),32);
        tracep->chgIData(oldp+280,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__w_rs2_data[0]),32);
        tracep->chgIData(oldp+281,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__u_riscv_regfile__DOT__registers
                                   [vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__rs1
                                   [0U]]),32);
        tracep->chgIData(oldp+282,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__u_riscv_regfile__DOT__registers
                                   [vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__rs2
                                   [0U]]),32);
        tracep->chgBit(oldp+283,((1U & (~ (IData)(vlTOPp->i_clk)))));
        tracep->chgSData(oldp+284,((0x3fffU & (vlTOPp->o_riscv_imem_pc 
                                               >> 2U))),14);
        tracep->chgSData(oldp+285,((0x3fffU & (vlTOPp->o_riscv_dmem_addr 
                                               >> 2U))),14);
    }
}

void Vriscv_top::traceCleanup(void* userp, VerilatedVcd* /*unused*/) {
    Vriscv_top__Syms* __restrict vlSymsp = static_cast<Vriscv_top__Syms*>(userp);
    Vriscv_top* const __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    {
        vlSymsp->__Vm_activity = false;
        vlTOPp->__Vm_traceActivity[0U] = 0U;
        vlTOPp->__Vm_traceActivity[1U] = 0U;
        vlTOPp->__Vm_traceActivity[2U] = 0U;
    }
}
