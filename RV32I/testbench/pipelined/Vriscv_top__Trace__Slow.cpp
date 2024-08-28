// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Tracing implementation internals
#include "verilated_vcd_c.h"
#include "Vriscv_top__Syms.h"


//======================

void Vriscv_top::trace(VerilatedVcdC* tfp, int, int) {
    tfp->spTrace()->addInitCb(&traceInit, __VlSymsp);
    traceRegister(tfp->spTrace());
}

void Vriscv_top::traceInit(void* userp, VerilatedVcd* tracep, uint32_t code) {
    // Callback from tracep->open()
    Vriscv_top__Syms* __restrict vlSymsp = static_cast<Vriscv_top__Syms*>(userp);
    if (!Verilated::calcUnusedSigs()) {
        VL_FATAL_MT(__FILE__, __LINE__, __FILE__,
                        "Turning on wave traces requires Verilated::traceEverOn(true) call before time 0.");
    }
    vlSymsp->__Vm_baseCode = code;
    tracep->module(vlSymsp->name());
    tracep->scopeEscape(' ');
    Vriscv_top::traceInitTop(vlSymsp, tracep);
    tracep->scopeEscape('.');
}

//======================


void Vriscv_top::traceInitTop(void* userp, VerilatedVcd* tracep) {
    Vriscv_top__Syms* __restrict vlSymsp = static_cast<Vriscv_top__Syms*>(userp);
    Vriscv_top* const __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    {
        vlTOPp->traceInitSub0(userp, tracep);
    }
}

void Vriscv_top::traceInitSub0(void* userp, VerilatedVcd* tracep) {
    Vriscv_top__Syms* __restrict vlSymsp = static_cast<Vriscv_top__Syms*>(userp);
    Vriscv_top* const __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    const int c = vlSymsp->__Vm_baseCode;
    if (false && tracep && c) {}  // Prevent unused
    // Body
    {
        tracep->declBus(c+271,"o_riscv_imem_pc", false,-1, 31,0);
        tracep->declBus(c+272,"o_riscv_imem_instr", false,-1, 31,0);
        tracep->declBus(c+273,"o_riscv_dmem_addr", false,-1, 31,0);
        tracep->declBit(c+274,"o_riscv_dmem_wr_en", false,-1);
        tracep->declBus(c+275,"o_riscv_dmem_strb", false,-1, 3,0);
        tracep->declBus(c+276,"o_riscv_dmem_wr_data", false,-1, 31,0);
        tracep->declBus(c+277,"o_riscv_dmem_rd_data", false,-1, 31,0);
        tracep->declBit(c+278,"i_clk", false,-1);
        tracep->declBit(c+279,"i_rstn", false,-1);
        tracep->declBus(c+287,"riscv_top REGISTER_INIT", false,-1, 31,0);
        tracep->declBus(c+271,"riscv_top o_riscv_imem_pc", false,-1, 31,0);
        tracep->declBus(c+272,"riscv_top o_riscv_imem_instr", false,-1, 31,0);
        tracep->declBus(c+273,"riscv_top o_riscv_dmem_addr", false,-1, 31,0);
        tracep->declBit(c+274,"riscv_top o_riscv_dmem_wr_en", false,-1);
        tracep->declBus(c+275,"riscv_top o_riscv_dmem_strb", false,-1, 3,0);
        tracep->declBus(c+276,"riscv_top o_riscv_dmem_wr_data", false,-1, 31,0);
        tracep->declBus(c+277,"riscv_top o_riscv_dmem_rd_data", false,-1, 31,0);
        tracep->declBit(c+278,"riscv_top i_clk", false,-1);
        tracep->declBit(c+279,"riscv_top i_rstn", false,-1);
        tracep->declBus(c+271,"riscv_top u_riscv_cpu o_cpu_pc", false,-1, 31,0);
        tracep->declBus(c+273,"riscv_top u_riscv_cpu o_cpu_mem_addr", false,-1, 31,0);
        tracep->declBit(c+274,"riscv_top u_riscv_cpu o_cpu_mem_wr_en", false,-1);
        tracep->declBus(c+275,"riscv_top u_riscv_cpu o_cpu_mem_strb", false,-1, 3,0);
        tracep->declBus(c+276,"riscv_top u_riscv_cpu o_cpu_mem_wr_data", false,-1, 31,0);
        tracep->declBus(c+272,"riscv_top u_riscv_cpu i_cpu_instr", false,-1, 31,0);
        tracep->declBus(c+277,"riscv_top u_riscv_cpu i_cpu_mem_rd_data", false,-1, 31,0);
        tracep->declBit(c+278,"riscv_top u_riscv_cpu i_clk", false,-1);
        tracep->declBit(c+279,"riscv_top u_riscv_cpu i_rstn", false,-1);
        tracep->declBus(c+287,"riscv_top u_riscv_cpu IF", false,-1, 31,0);
        tracep->declBus(c+288,"riscv_top u_riscv_cpu ID", false,-1, 31,0);
        tracep->declBus(c+289,"riscv_top u_riscv_cpu EX", false,-1, 31,0);
        tracep->declBus(c+290,"riscv_top u_riscv_cpu MM", false,-1, 31,0);
        tracep->declBus(c+291,"riscv_top u_riscv_cpu WB", false,-1, 31,0);
        {int i; for (i=0; i<3; i++) {
                tracep->declBus(c+65+i*1,"riscv_top u_riscv_cpu funct3", true,(i+1), 2,0);}}
        {int i; for (i=0; i<2; i++) {
                tracep->declBus(c+68+i*1,"riscv_top u_riscv_cpu opcode", true,(i+1), 6,0);}}
        {int i; for (i=0; i<1; i++) {
                tracep->declBus(c+70+i*1,"riscv_top u_riscv_cpu funct7_5b", true,(i+1), 0,0);}}
        {int i; for (i=0; i<1; i++) {
                tracep->declBus(c+71+i*1,"riscv_top u_riscv_cpu w_reg_wr_en", true,(i+1), 0,0);}}
        {int i; for (i=0; i<1; i++) {
                tracep->declBus(c+72+i*1,"riscv_top u_riscv_cpu w_src_rd", true,(i+1), 1,0);}}
        {int i; for (i=0; i<1; i++) {
                tracep->declBus(c+73+i*1,"riscv_top u_riscv_cpu w_mem_wr_en", true,(i+1), 0,0);}}
        {int i; for (i=0; i<1; i++) {
                tracep->declBus(c+74+i*1,"riscv_top u_riscv_cpu w_alu_ctrl", true,(i+1), 3,0);}}
        {int i; for (i=0; i<1; i++) {
                tracep->declBus(c+75+i*1,"riscv_top u_riscv_cpu w_src_alu_a", true,(i+1), 0,0);}}
        {int i; for (i=0; i<1; i++) {
                tracep->declBus(c+76+i*1,"riscv_top u_riscv_cpu w_src_alu_b", true,(i+1), 0,0);}}
        {int i; for (i=0; i<1; i++) {
                tracep->declBus(c+77+i*1,"riscv_top u_riscv_cpu src_imm", true,(i+1), 2,0);}}
        {int i; for (i=0; i<3; i++) {
                tracep->declBus(c+78+i*1,"riscv_top u_riscv_cpu reg_wr_en", true,(i+2), 0,0);}}
        {int i; for (i=0; i<3; i++) {
                tracep->declBus(c+81+i*1,"riscv_top u_riscv_cpu src_rd", true,(i+2), 1,0);}}
        {int i; for (i=0; i<2; i++) {
                tracep->declBus(c+84+i*1,"riscv_top u_riscv_cpu mem_wr_en", true,(i+2), 0,0);}}
        {int i; for (i=0; i<1; i++) {
                tracep->declBus(c+86+i*1,"riscv_top u_riscv_cpu alu_ctrl", true,(i+2), 3,0);}}
        {int i; for (i=0; i<1; i++) {
                tracep->declBus(c+87+i*1,"riscv_top u_riscv_cpu src_alu_a", true,(i+2), 0,0);}}
        {int i; for (i=0; i<1; i++) {
                tracep->declBus(c+88+i*1,"riscv_top u_riscv_cpu src_alu_b", true,(i+2), 0,0);}}
        {int i; for (i=0; i<1; i++) {
                tracep->declBus(c+89+i*1,"riscv_top u_riscv_cpu src_pc", true,(i+2), 1,0);}}
        {int i; for (i=0; i<3; i++) {
                tracep->declBus(c+90+i*1,"riscv_top u_riscv_cpu pc", true,(i+0), 31,0);}}
        {int i; for (i=0; i<5; i++) {
                tracep->declBus(c+93+i*1,"riscv_top u_riscv_cpu pc4", true,(i+0), 31,0);}}
        {int i; for (i=0; i<1; i++) {
                tracep->declBus(c+98+i*1,"riscv_top u_riscv_cpu pcimm", true,(i+2), 31,0);}}
        {int i; for (i=0; i<1; i++) {
                tracep->declBus(c+99+i*1,"riscv_top u_riscv_cpu instr", true,(i+1), 31,0);}}
        {int i; for (i=0; i<1; i++) {
                tracep->declBus(c+100+i*1,"riscv_top u_riscv_cpu w_imm", true,(i+1), 31,0);}}
        {int i; for (i=0; i<3; i++) {
                tracep->declBus(c+101+i*1,"riscv_top u_riscv_cpu imm", true,(i+2), 31,0);}}
        {int i; for (i=0; i<2; i++) {
                tracep->declBus(c+104+i*1,"riscv_top u_riscv_cpu rs1", true,(i+1), 4,0);}}
        {int i; for (i=0; i<2; i++) {
                tracep->declBus(c+106+i*1,"riscv_top u_riscv_cpu rs2", true,(i+1), 4,0);}}
        {int i; for (i=0; i<1; i++) {
                tracep->declBus(c+280+i*1,"riscv_top u_riscv_cpu w_rs1_data", true,(i+1), 31,0);}}
        {int i; for (i=0; i<1; i++) {
                tracep->declBus(c+281+i*1,"riscv_top u_riscv_cpu w_rs2_data", true,(i+1), 31,0);}}
        {int i; for (i=0; i<1; i++) {
                tracep->declBus(c+108+i*1,"riscv_top u_riscv_cpu rs1_data", true,(i+2), 31,0);}}
        {int i; for (i=0; i<1; i++) {
                tracep->declBus(c+109+i*1,"riscv_top u_riscv_cpu rs2_data", true,(i+2), 31,0);}}
        {int i; for (i=0; i<4; i++) {
                tracep->declBus(c+110+i*1,"riscv_top u_riscv_cpu rd", true,(i+1), 4,0);}}
        {int i; for (i=0; i<1; i++) {
                tracep->declBus(c+114+i*1,"riscv_top u_riscv_cpu rd_data", true,(i+4), 31,0);}}
        {int i; for (i=0; i<2; i++) {
                tracep->declBus(c+115+i*1,"riscv_top u_riscv_cpu mem_rd_data", true,(i+3), 31,0);}}
        {int i; for (i=0; i<1; i++) {
                tracep->declBus(c+117+i*1,"riscv_top u_riscv_cpu fwd_a", true,(i+2), 31,0);}}
        {int i; for (i=0; i<1; i++) {
                tracep->declBus(c+118+i*1,"riscv_top u_riscv_cpu w_fwd_b", true,(i+2), 31,0);}}
        {int i; for (i=0; i<1; i++) {
                tracep->declBus(c+119+i*1,"riscv_top u_riscv_cpu fwd_b", true,(i+3), 31,0);}}
        {int i; for (i=0; i<1; i++) {
                tracep->declBus(c+120+i*1,"riscv_top u_riscv_cpu alu_a", true,(i+2), 31,0);}}
        {int i; for (i=0; i<1; i++) {
                tracep->declBus(c+121+i*1,"riscv_top u_riscv_cpu alu_b", true,(i+2), 31,0);}}
        {int i; for (i=0; i<1; i++) {
                tracep->declBus(c+122+i*1,"riscv_top u_riscv_cpu w_alu_out", true,(i+2), 31,0);}}
        {int i; for (i=0; i<2; i++) {
                tracep->declBus(c+123+i*1,"riscv_top u_riscv_cpu alu_out", true,(i+3), 31,0);}}
        {int i; for (i=0; i<1; i++) {
                tracep->declBus(c+125+i*1,"riscv_top u_riscv_cpu fwd_sel_a", true,(i+2), 1,0);}}
        {int i; for (i=0; i<1; i++) {
                tracep->declBus(c+126+i*1,"riscv_top u_riscv_cpu fwd_sel_b", true,(i+2), 1,0);}}
        {int i; for (i=0; i<2; i++) {
                tracep->declBit(c+127+i*1,"riscv_top u_riscv_cpu stall", true,(i+0));}}
        {int i; for (i=0; i<2; i++) {
                tracep->declBit(c+129+i*1,"riscv_top u_riscv_cpu flush", true,(i+1));}}
        tracep->declArray(c+131,"riscv_top u_riscv_cpu mux_concat_pc", false,-1, 95,0);
        tracep->declArray(c+134,"riscv_top u_riscv_cpu mux_concat_fwd_a", false,-1, 95,0);
        tracep->declArray(c+137,"riscv_top u_riscv_cpu mux_concat_fwd_b", false,-1, 95,0);
        tracep->declQuad(c+140,"riscv_top u_riscv_cpu mux_concat_alu_a", false,-1, 63,0);
        tracep->declQuad(c+142,"riscv_top u_riscv_cpu mux_concat_alu_b", false,-1, 63,0);
        tracep->declArray(c+144,"riscv_top u_riscv_cpu mux_concat_rd", false,-1, 127,0);
        tracep->declBus(c+148,"riscv_top u_riscv_cpu pc_next", false,-1, 31,0);
        tracep->declBus(c+149,"riscv_top u_riscv_cpu u_riscv_hazard o_fwd_sel_a_ex", false,-1, 1,0);
        tracep->declBus(c+150,"riscv_top u_riscv_cpu u_riscv_hazard o_fwd_sel_b_ex", false,-1, 1,0);
        tracep->declBit(c+151,"riscv_top u_riscv_cpu u_riscv_hazard o_stall_if", false,-1);
        tracep->declBit(c+151,"riscv_top u_riscv_cpu u_riscv_hazard o_stall_id", false,-1);
        tracep->declBit(c+152,"riscv_top u_riscv_cpu u_riscv_hazard o_flush_id", false,-1);
        tracep->declBit(c+153,"riscv_top u_riscv_cpu u_riscv_hazard o_flush_ex", false,-1);
        tracep->declBus(c+154,"riscv_top u_riscv_cpu u_riscv_hazard i_src_pc_ex", false,-1, 1,0);
        tracep->declBus(c+155,"riscv_top u_riscv_cpu u_riscv_hazard i_src_rd_ex", false,-1, 1,0);
        tracep->declBus(c+156,"riscv_top u_riscv_cpu u_riscv_hazard i_rs1_id", false,-1, 4,0);
        tracep->declBus(c+157,"riscv_top u_riscv_cpu u_riscv_hazard i_rs2_id", false,-1, 4,0);
        tracep->declBus(c+158,"riscv_top u_riscv_cpu u_riscv_hazard i_rs1_ex", false,-1, 4,0);
        tracep->declBus(c+159,"riscv_top u_riscv_cpu u_riscv_hazard i_rs2_ex", false,-1, 4,0);
        tracep->declBus(c+160,"riscv_top u_riscv_cpu u_riscv_hazard i_rd_ex", false,-1, 4,0);
        tracep->declBus(c+161,"riscv_top u_riscv_cpu u_riscv_hazard i_rd_mm", false,-1, 4,0);
        tracep->declBus(c+162,"riscv_top u_riscv_cpu u_riscv_hazard i_rd_wb", false,-1, 4,0);
        tracep->declBit(c+163,"riscv_top u_riscv_cpu u_riscv_hazard i_reg_wr_en_ex", false,-1);
        tracep->declBit(c+164,"riscv_top u_riscv_cpu u_riscv_hazard i_reg_wr_en_mm", false,-1);
        tracep->declBit(c+165,"riscv_top u_riscv_cpu u_riscv_hazard i_reg_wr_en_wb", false,-1);
        tracep->declBit(c+151,"riscv_top u_riscv_cpu u_riscv_hazard stall", false,-1);
        tracep->declBus(c+290,"riscv_top u_riscv_cpu u_riscv_mux_pc N_MUX_IN", false,-1, 31,0);
        tracep->declBus(c+148,"riscv_top u_riscv_cpu u_riscv_mux_pc o_mux_data", false,-1, 31,0);
        tracep->declArray(c+131,"riscv_top u_riscv_cpu u_riscv_mux_pc i_mux_concat_data", false,-1, 95,0);
        tracep->declBus(c+154,"riscv_top u_riscv_cpu u_riscv_mux_pc i_mux_sel", false,-1, 1,0);
        {int i; for (i=0; i<3; i++) {
                tracep->declBus(c+166+i*1,"riscv_top u_riscv_cpu u_riscv_mux_pc mux_input_arr", true,(i+0), 31,0);}}
        tracep->declBus(c+169,"riscv_top u_riscv_cpu u_riscv_adder_pc_plus_4 o_adder_sum", false,-1, 31,0);
        tracep->declBus(c+170,"riscv_top u_riscv_cpu u_riscv_adder_pc_plus_4 i_adder_a", false,-1, 31,0);
        tracep->declBus(c+292,"riscv_top u_riscv_cpu u_riscv_adder_pc_plus_4 i_adder_b", false,-1, 31,0);
        tracep->declBit(c+171,"riscv_top u_riscv_cpu u_riscv_ctrl o_ctrl_reg_wr_en", false,-1);
        tracep->declBus(c+172,"riscv_top u_riscv_cpu u_riscv_ctrl o_ctrl_src_rd", false,-1, 1,0);
        tracep->declBit(c+173,"riscv_top u_riscv_cpu u_riscv_ctrl o_ctrl_mem_wr_en", false,-1);
        tracep->declBus(c+174,"riscv_top u_riscv_cpu u_riscv_ctrl o_ctrl_alu_ctrl", false,-1, 3,0);
        tracep->declBit(c+175,"riscv_top u_riscv_cpu u_riscv_ctrl o_ctrl_src_alu_a", false,-1);
        tracep->declBit(c+176,"riscv_top u_riscv_cpu u_riscv_ctrl o_ctrl_src_alu_b", false,-1);
        tracep->declBus(c+177,"riscv_top u_riscv_cpu u_riscv_ctrl o_ctrl_src_imm", false,-1, 2,0);
        tracep->declBus(c+178,"riscv_top u_riscv_cpu u_riscv_ctrl i_ctrl_opcode", false,-1, 6,0);
        tracep->declBus(c+179,"riscv_top u_riscv_cpu u_riscv_ctrl i_ctrl_funct3", false,-1, 2,0);
        tracep->declBit(c+180,"riscv_top u_riscv_cpu u_riscv_ctrl i_ctrl_funct7_5b", false,-1);
        tracep->declArray(c+181,"riscv_top u_riscv_cpu u_riscv_ctrl DEBUG_INSTR", false,-1, 255,0);
        tracep->declBus(c+282,"riscv_top u_riscv_cpu u_riscv_regfile o_regfile_rs1_data", false,-1, 31,0);
        tracep->declBus(c+283,"riscv_top u_riscv_cpu u_riscv_regfile o_regfile_rs2_data", false,-1, 31,0);
        tracep->declBus(c+156,"riscv_top u_riscv_cpu u_riscv_regfile i_regfile_rs1_addr", false,-1, 4,0);
        tracep->declBus(c+157,"riscv_top u_riscv_cpu u_riscv_regfile i_regfile_rs2_addr", false,-1, 4,0);
        tracep->declBus(c+189,"riscv_top u_riscv_cpu u_riscv_regfile i_regfile_rd_data", false,-1, 31,0);
        tracep->declBus(c+162,"riscv_top u_riscv_cpu u_riscv_regfile i_regfile_rd_addr", false,-1, 4,0);
        tracep->declBit(c+165,"riscv_top u_riscv_cpu u_riscv_regfile i_regfile_rd_wen", false,-1);
        tracep->declBit(c+284,"riscv_top u_riscv_cpu u_riscv_regfile i_clk", false,-1);
        {int i; for (i=0; i<32; i++) {
                tracep->declBus(c+239+i*1,"riscv_top u_riscv_cpu u_riscv_regfile registers", true,(i+0), 31,0);}}
        tracep->declBus(c+190,"riscv_top u_riscv_cpu u_riscv_immext o_imm_ext", false,-1, 31,0);
        tracep->declBus(c+191,"riscv_top u_riscv_cpu u_riscv_immext i_imm_instr", false,-1, 31,7);
        tracep->declBus(c+192,"riscv_top u_riscv_cpu u_riscv_immext i_imm_src", false,-1, 2,0);
        tracep->declBus(c+290,"riscv_top u_riscv_cpu u_riscv_mux_fwd_a N_MUX_IN", false,-1, 31,0);
        tracep->declBus(c+193,"riscv_top u_riscv_cpu u_riscv_mux_fwd_a o_mux_data", false,-1, 31,0);
        tracep->declArray(c+134,"riscv_top u_riscv_cpu u_riscv_mux_fwd_a i_mux_concat_data", false,-1, 95,0);
        tracep->declBus(c+194,"riscv_top u_riscv_cpu u_riscv_mux_fwd_a i_mux_sel", false,-1, 1,0);
        {int i; for (i=0; i<3; i++) {
                tracep->declBus(c+195+i*1,"riscv_top u_riscv_cpu u_riscv_mux_fwd_a mux_input_arr", true,(i+0), 31,0);}}
        tracep->declBus(c+290,"riscv_top u_riscv_cpu u_riscv_mux_fwd_b N_MUX_IN", false,-1, 31,0);
        tracep->declBus(c+198,"riscv_top u_riscv_cpu u_riscv_mux_fwd_b o_mux_data", false,-1, 31,0);
        tracep->declArray(c+137,"riscv_top u_riscv_cpu u_riscv_mux_fwd_b i_mux_concat_data", false,-1, 95,0);
        tracep->declBus(c+199,"riscv_top u_riscv_cpu u_riscv_mux_fwd_b i_mux_sel", false,-1, 1,0);
        {int i; for (i=0; i<3; i++) {
                tracep->declBus(c+200+i*1,"riscv_top u_riscv_cpu u_riscv_mux_fwd_b mux_input_arr", true,(i+0), 31,0);}}
        tracep->declBus(c+289,"riscv_top u_riscv_cpu u_riscv_mux_alu_a N_MUX_IN", false,-1, 31,0);
        tracep->declBus(c+203,"riscv_top u_riscv_cpu u_riscv_mux_alu_a o_mux_data", false,-1, 31,0);
        tracep->declQuad(c+140,"riscv_top u_riscv_cpu u_riscv_mux_alu_a i_mux_concat_data", false,-1, 63,0);
        tracep->declBus(c+204,"riscv_top u_riscv_cpu u_riscv_mux_alu_a i_mux_sel", false,-1, 0,0);
        {int i; for (i=0; i<2; i++) {
                tracep->declBus(c+205+i*1,"riscv_top u_riscv_cpu u_riscv_mux_alu_a mux_input_arr", true,(i+0), 31,0);}}
        tracep->declBus(c+289,"riscv_top u_riscv_cpu u_riscv_mux_alu_b N_MUX_IN", false,-1, 31,0);
        tracep->declBus(c+207,"riscv_top u_riscv_cpu u_riscv_mux_alu_b o_mux_data", false,-1, 31,0);
        tracep->declQuad(c+142,"riscv_top u_riscv_cpu u_riscv_mux_alu_b i_mux_concat_data", false,-1, 63,0);
        tracep->declBus(c+208,"riscv_top u_riscv_cpu u_riscv_mux_alu_b i_mux_sel", false,-1, 0,0);
        {int i; for (i=0; i<2; i++) {
                tracep->declBus(c+209+i*1,"riscv_top u_riscv_cpu u_riscv_mux_alu_b mux_input_arr", true,(i+0), 31,0);}}
        tracep->declBus(c+211,"riscv_top u_riscv_cpu u_riscv_alu o_alu_out", false,-1, 31,0);
        tracep->declBus(c+212,"riscv_top u_riscv_cpu u_riscv_alu o_alu_src_pc", false,-1, 1,0);
        tracep->declBus(c+213,"riscv_top u_riscv_cpu u_riscv_alu i_alu_a", false,-1, 31,0);
        tracep->declBus(c+214,"riscv_top u_riscv_cpu u_riscv_alu i_alu_b", false,-1, 31,0);
        tracep->declBus(c+215,"riscv_top u_riscv_cpu u_riscv_alu i_alu_opcode", false,-1, 6,0);
        tracep->declBus(c+216,"riscv_top u_riscv_cpu u_riscv_alu i_alu_funct3", false,-1, 2,0);
        tracep->declBus(c+217,"riscv_top u_riscv_cpu u_riscv_alu i_alu_ctrl", false,-1, 3,0);
        tracep->declBit(c+218,"riscv_top u_riscv_cpu u_riscv_alu alu_zero", false,-1);
        tracep->declBit(c+219,"riscv_top u_riscv_cpu u_riscv_alu take_branch", false,-1);
        tracep->declQuad(c+220,"riscv_top u_riscv_cpu u_riscv_alu DEBUG_ALU_OP", false,-1, 63,0);
        tracep->declBus(c+222,"riscv_top u_riscv_cpu u_riscv_adder_pc_plus_imm o_adder_sum", false,-1, 31,0);
        tracep->declBus(c+223,"riscv_top u_riscv_cpu u_riscv_adder_pc_plus_imm i_adder_a", false,-1, 31,0);
        tracep->declBus(c+224,"riscv_top u_riscv_cpu u_riscv_adder_pc_plus_imm i_adder_b", false,-1, 31,0);
        tracep->declBus(c+273,"riscv_top u_riscv_cpu u_riscv_dmem_interface o_dmem_intf_addr", false,-1, 31,0);
        tracep->declBit(c+274,"riscv_top u_riscv_cpu u_riscv_dmem_interface o_dmem_intf_wen", false,-1);
        tracep->declBus(c+276,"riscv_top u_riscv_cpu u_riscv_dmem_interface o_dmem_intf_wr_data", false,-1, 31,0);
        tracep->declBus(c+275,"riscv_top u_riscv_cpu u_riscv_dmem_interface o_dmem_intf_byte_sel", false,-1, 3,0);
        tracep->declBus(c+225,"riscv_top u_riscv_cpu u_riscv_dmem_interface o_dmem_intf_rd_data", false,-1, 31,0);
        tracep->declBus(c+226,"riscv_top u_riscv_cpu u_riscv_dmem_interface i_dmem_intf_addr", false,-1, 31,0);
        tracep->declBit(c+227,"riscv_top u_riscv_cpu u_riscv_dmem_interface i_dmem_intf_wen", false,-1);
        tracep->declBus(c+228,"riscv_top u_riscv_cpu u_riscv_dmem_interface i_dmem_intf_wr_data", false,-1, 31,0);
        tracep->declBus(c+277,"riscv_top u_riscv_cpu u_riscv_dmem_interface i_dmem_intf_rd_data", false,-1, 31,0);
        tracep->declBus(c+229,"riscv_top u_riscv_cpu u_riscv_dmem_interface i_dmem_intf_func3", false,-1, 2,0);
        tracep->declBus(c+230,"riscv_top u_riscv_cpu u_riscv_dmem_interface dmem_intf_strb", false,-1, 3,0);
        tracep->declBus(c+231,"riscv_top u_riscv_cpu u_riscv_dmem_interface byte_aligned_dmem_rd_data", false,-1, 31,0);
        tracep->declBus(c+291,"riscv_top u_riscv_cpu u_riscv_mux_regfile_rd_data N_MUX_IN", false,-1, 31,0);
        tracep->declBus(c+232,"riscv_top u_riscv_cpu u_riscv_mux_regfile_rd_data o_mux_data", false,-1, 31,0);
        tracep->declArray(c+144,"riscv_top u_riscv_cpu u_riscv_mux_regfile_rd_data i_mux_concat_data", false,-1, 127,0);
        tracep->declBus(c+233,"riscv_top u_riscv_cpu u_riscv_mux_regfile_rd_data i_mux_sel", false,-1, 1,0);
        {int i; for (i=0; i<4; i++) {
                tracep->declBus(c+234+i*1,"riscv_top u_riscv_cpu u_riscv_mux_regfile_rd_data mux_input_arr", true,(i+0), 31,0);}}
        tracep->declBus(c+272,"riscv_top u_riscv_imem o_imem_data", false,-1, 31,0);
        tracep->declBus(c+285,"riscv_top u_riscv_imem i_imem_addr", false,-1, 13,0);
        tracep->declArray(c+1,"riscv_top u_riscv_imem FILE_TEXT_MIF", false,-1, 1023,0);
        tracep->declBus(c+277,"riscv_top u_riscv_dmem o_dmem_data", false,-1, 31,0);
        tracep->declBus(c+276,"riscv_top u_riscv_dmem i_dmem_data", false,-1, 31,0);
        tracep->declBus(c+286,"riscv_top u_riscv_dmem i_dmem_addr", false,-1, 13,0);
        tracep->declBus(c+275,"riscv_top u_riscv_dmem i_dmem_byte_sel", false,-1, 3,0);
        tracep->declBit(c+274,"riscv_top u_riscv_dmem i_dmem_wr_en", false,-1);
        tracep->declBit(c+278,"riscv_top u_riscv_dmem i_clk", false,-1);
        tracep->declArray(c+33,"riscv_top u_riscv_dmem FILE_DATA_MIF", false,-1, 1023,0);
        tracep->declBus(c+238,"riscv_top u_riscv_dmem i", false,-1, 31,0);
    }
}

void Vriscv_top::traceRegister(VerilatedVcd* tracep) {
    // Body
    {
        tracep->addFullCb(&traceFullTop0, __VlSymsp);
        tracep->addChgCb(&traceChgTop0, __VlSymsp);
        tracep->addCleanupCb(&traceCleanup, __VlSymsp);
    }
}

void Vriscv_top::traceFullTop0(void* userp, VerilatedVcd* tracep) {
    Vriscv_top__Syms* __restrict vlSymsp = static_cast<Vriscv_top__Syms*>(userp);
    Vriscv_top* const __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    {
        vlTOPp->traceFullSub0(userp, tracep);
    }
}

void Vriscv_top::traceFullSub0(void* userp, VerilatedVcd* tracep) {
    Vriscv_top__Syms* __restrict vlSymsp = static_cast<Vriscv_top__Syms*>(userp);
    Vriscv_top* const __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    vluint32_t* const oldp = tracep->oldp(vlSymsp->__Vm_baseCode);
    if (false && oldp) {}  // Prevent unused
    // Body
    {
        tracep->fullWData(oldp+1,(vlTOPp->riscv_top__DOT__u_riscv_imem__DOT__FILE_TEXT_MIF),1024);
        tracep->fullWData(oldp+33,(vlTOPp->riscv_top__DOT__u_riscv_dmem__DOT__FILE_DATA_MIF),1024);
        tracep->fullCData(oldp+65,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__funct3[0]),3);
        tracep->fullCData(oldp+66,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__funct3[1]),3);
        tracep->fullCData(oldp+67,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__funct3[2]),3);
        tracep->fullCData(oldp+68,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__opcode[0]),7);
        tracep->fullCData(oldp+69,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__opcode[1]),7);
        tracep->fullBit(oldp+70,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__funct7_5b[0]));
        tracep->fullBit(oldp+71,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__w_reg_wr_en[0]));
        tracep->fullCData(oldp+72,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__w_src_rd[0]),2);
        tracep->fullBit(oldp+73,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__w_mem_wr_en[0]));
        tracep->fullCData(oldp+74,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__w_alu_ctrl[0]),4);
        tracep->fullBit(oldp+75,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__w_src_alu_a[0]));
        tracep->fullBit(oldp+76,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__w_src_alu_b[0]));
        tracep->fullCData(oldp+77,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__src_imm[0]),3);
        tracep->fullBit(oldp+78,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__reg_wr_en[0]));
        tracep->fullBit(oldp+79,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__reg_wr_en[1]));
        tracep->fullBit(oldp+80,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__reg_wr_en[2]));
        tracep->fullCData(oldp+81,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__src_rd[0]),2);
        tracep->fullCData(oldp+82,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__src_rd[1]),2);
        tracep->fullCData(oldp+83,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__src_rd[2]),2);
        tracep->fullBit(oldp+84,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__mem_wr_en[0]));
        tracep->fullBit(oldp+85,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__mem_wr_en[1]));
        tracep->fullCData(oldp+86,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__alu_ctrl[0]),4);
        tracep->fullBit(oldp+87,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__src_alu_a[0]));
        tracep->fullBit(oldp+88,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__src_alu_b[0]));
        tracep->fullCData(oldp+89,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__src_pc[0]),2);
        tracep->fullIData(oldp+90,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__pc[0]),32);
        tracep->fullIData(oldp+91,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__pc[1]),32);
        tracep->fullIData(oldp+92,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__pc[2]),32);
        tracep->fullIData(oldp+93,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__pc4[0]),32);
        tracep->fullIData(oldp+94,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__pc4[1]),32);
        tracep->fullIData(oldp+95,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__pc4[2]),32);
        tracep->fullIData(oldp+96,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__pc4[3]),32);
        tracep->fullIData(oldp+97,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__pc4[4]),32);
        tracep->fullIData(oldp+98,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__pcimm[0]),32);
        tracep->fullIData(oldp+99,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__instr[0]),32);
        tracep->fullIData(oldp+100,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__w_imm[0]),32);
        tracep->fullIData(oldp+101,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__imm[0]),32);
        tracep->fullIData(oldp+102,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__imm[1]),32);
        tracep->fullIData(oldp+103,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__imm[2]),32);
        tracep->fullCData(oldp+104,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__rs1[0]),5);
        tracep->fullCData(oldp+105,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__rs1[1]),5);
        tracep->fullCData(oldp+106,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__rs2[0]),5);
        tracep->fullCData(oldp+107,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__rs2[1]),5);
        tracep->fullIData(oldp+108,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__rs1_data[0]),32);
        tracep->fullIData(oldp+109,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__rs2_data[0]),32);
        tracep->fullCData(oldp+110,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__rd[0]),5);
        tracep->fullCData(oldp+111,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__rd[1]),5);
        tracep->fullCData(oldp+112,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__rd[2]),5);
        tracep->fullCData(oldp+113,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__rd[3]),5);
        tracep->fullIData(oldp+114,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__rd_data[0]),32);
        tracep->fullIData(oldp+115,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__mem_rd_data[0]),32);
        tracep->fullIData(oldp+116,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__mem_rd_data[1]),32);
        tracep->fullIData(oldp+117,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__fwd_a[0]),32);
        tracep->fullIData(oldp+118,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__w_fwd_b[0]),32);
        tracep->fullIData(oldp+119,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__fwd_b[0]),32);
        tracep->fullIData(oldp+120,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__alu_a[0]),32);
        tracep->fullIData(oldp+121,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__alu_b[0]),32);
        tracep->fullIData(oldp+122,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__w_alu_out[0]),32);
        tracep->fullIData(oldp+123,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__alu_out[0]),32);
        tracep->fullIData(oldp+124,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__alu_out[1]),32);
        tracep->fullCData(oldp+125,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__fwd_sel_a[0]),2);
        tracep->fullCData(oldp+126,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__fwd_sel_b[0]),2);
        tracep->fullBit(oldp+127,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__stall[0]));
        tracep->fullBit(oldp+128,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__stall[1]));
        tracep->fullBit(oldp+129,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__flush[0]));
        tracep->fullBit(oldp+130,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__flush[1]));
        tracep->fullWData(oldp+131,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__mux_concat_pc),96);
        tracep->fullWData(oldp+134,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__mux_concat_fwd_a),96);
        tracep->fullWData(oldp+137,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__mux_concat_fwd_b),96);
        tracep->fullQData(oldp+140,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__mux_concat_alu_a),64);
        tracep->fullQData(oldp+142,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__mux_concat_alu_b),64);
        tracep->fullWData(oldp+144,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__mux_concat_rd),128);
        tracep->fullIData(oldp+148,(((2U >= vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__src_pc
                                      [0U]) ? vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__u_riscv_mux_pc__DOT__mux_input_arr
                                     [vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__src_pc
                                     [0U]] : 0U)),32);
        tracep->fullCData(oldp+149,(((((vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__rs1
                                        [1U] == vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__rd
                                        [2U]) & vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__reg_wr_en
                                       [1U]) & (0U 
                                                != 
                                                vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__rs1
                                                [1U]))
                                      ? 1U : ((((vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__rs1
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
        tracep->fullCData(oldp+150,(((((vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__rs2
                                        [1U] == vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__rd
                                        [2U]) & vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__reg_wr_en
                                       [1U]) & (0U 
                                                != 
                                                vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__rs2
                                                [1U]))
                                      ? 1U : ((((vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__rs2
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
        tracep->fullBit(oldp+151,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__u_riscv_hazard__DOT__stall));
        tracep->fullBit(oldp+152,((0U != vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__src_pc
                                   [0U])));
        tracep->fullBit(oldp+153,(((IData)(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__u_riscv_hazard__DOT__stall) 
                                   | (0U != vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__src_pc
                                      [0U]))));
        tracep->fullCData(oldp+154,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__src_pc
                                    [0U]),2);
        tracep->fullCData(oldp+155,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__src_rd
                                    [0U]),2);
        tracep->fullCData(oldp+156,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__rs1
                                    [0U]),5);
        tracep->fullCData(oldp+157,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__rs2
                                    [0U]),5);
        tracep->fullCData(oldp+158,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__rs1
                                    [1U]),5);
        tracep->fullCData(oldp+159,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__rs2
                                    [1U]),5);
        tracep->fullCData(oldp+160,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__rd
                                    [1U]),5);
        tracep->fullCData(oldp+161,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__rd
                                    [2U]),5);
        tracep->fullCData(oldp+162,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__rd
                                    [3U]),5);
        tracep->fullBit(oldp+163,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__reg_wr_en
                                  [0U]));
        tracep->fullBit(oldp+164,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__reg_wr_en
                                  [1U]));
        tracep->fullBit(oldp+165,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__reg_wr_en
                                  [2U]));
        tracep->fullIData(oldp+166,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__u_riscv_mux_pc__DOT__mux_input_arr[0]),32);
        tracep->fullIData(oldp+167,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__u_riscv_mux_pc__DOT__mux_input_arr[1]),32);
        tracep->fullIData(oldp+168,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__u_riscv_mux_pc__DOT__mux_input_arr[2]),32);
        tracep->fullIData(oldp+169,(((IData)(4U) + 
                                     vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__pc
                                     [0U])),32);
        tracep->fullIData(oldp+170,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__pc
                                    [0U]),32);
        tracep->fullBit(oldp+171,((1U & (~ ((0x23U 
                                             == vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__opcode
                                             [0U]) 
                                            | (0x63U 
                                               == vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__opcode
                                               [0U]))))));
        tracep->fullCData(oldp+172,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT____Vcellout__u_riscv_ctrl__o_ctrl_src_rd),2);
        tracep->fullBit(oldp+173,((0x23U == vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__opcode
                                   [0U])));
        tracep->fullCData(oldp+174,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT____Vcellout__u_riscv_ctrl__o_ctrl_alu_ctrl),4);
        tracep->fullBit(oldp+175,((0x17U == vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__opcode
                                   [0U])));
        tracep->fullBit(oldp+176,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT____Vcellout__u_riscv_ctrl__o_ctrl_src_alu_b));
        tracep->fullCData(oldp+177,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT____Vcellout__u_riscv_ctrl__o_ctrl_src_imm),3);
        tracep->fullCData(oldp+178,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__opcode
                                    [0U]),7);
        tracep->fullCData(oldp+179,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__funct3
                                    [0U]),3);
        tracep->fullBit(oldp+180,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__funct7_5b
                                  [0U]));
        tracep->fullWData(oldp+181,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__u_riscv_ctrl__DOT__DEBUG_INSTR),256);
        tracep->fullIData(oldp+189,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__rd_data
                                    [0U]),32);
        tracep->fullIData(oldp+190,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT____Vcellout__u_riscv_immext__o_imm_ext),32);
        tracep->fullIData(oldp+191,((0x1ffffffU & (
                                                   vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__instr
                                                   [0U] 
                                                   >> 7U))),25);
        tracep->fullCData(oldp+192,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__src_imm
                                    [0U]),3);
        tracep->fullIData(oldp+193,(((2U >= vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__fwd_sel_a
                                      [0U]) ? vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__u_riscv_mux_fwd_a__DOT__mux_input_arr
                                     [vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__fwd_sel_a
                                     [0U]] : 0U)),32);
        tracep->fullCData(oldp+194,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__fwd_sel_a
                                    [0U]),2);
        tracep->fullIData(oldp+195,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__u_riscv_mux_fwd_a__DOT__mux_input_arr[0]),32);
        tracep->fullIData(oldp+196,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__u_riscv_mux_fwd_a__DOT__mux_input_arr[1]),32);
        tracep->fullIData(oldp+197,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__u_riscv_mux_fwd_a__DOT__mux_input_arr[2]),32);
        tracep->fullIData(oldp+198,(((2U >= vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__fwd_sel_b
                                      [0U]) ? vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__u_riscv_mux_fwd_b__DOT__mux_input_arr
                                     [vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__fwd_sel_b
                                     [0U]] : 0U)),32);
        tracep->fullCData(oldp+199,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__fwd_sel_b
                                    [0U]),2);
        tracep->fullIData(oldp+200,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__u_riscv_mux_fwd_b__DOT__mux_input_arr[0]),32);
        tracep->fullIData(oldp+201,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__u_riscv_mux_fwd_b__DOT__mux_input_arr[1]),32);
        tracep->fullIData(oldp+202,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__u_riscv_mux_fwd_b__DOT__mux_input_arr[2]),32);
        tracep->fullIData(oldp+203,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__u_riscv_mux_alu_a__DOT__mux_input_arr
                                    [vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__src_alu_a
                                    [0U]]),32);
        tracep->fullBit(oldp+204,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__src_alu_a
                                  [0U]));
        tracep->fullIData(oldp+205,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__u_riscv_mux_alu_a__DOT__mux_input_arr[0]),32);
        tracep->fullIData(oldp+206,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__u_riscv_mux_alu_a__DOT__mux_input_arr[1]),32);
        tracep->fullIData(oldp+207,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__u_riscv_mux_alu_b__DOT__mux_input_arr
                                    [vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__src_alu_b
                                    [0U]]),32);
        tracep->fullBit(oldp+208,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__src_alu_b
                                  [0U]));
        tracep->fullIData(oldp+209,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__u_riscv_mux_alu_b__DOT__mux_input_arr[0]),32);
        tracep->fullIData(oldp+210,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__u_riscv_mux_alu_b__DOT__mux_input_arr[1]),32);
        tracep->fullIData(oldp+211,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT____Vcellout__u_riscv_alu__o_alu_out),32);
        tracep->fullCData(oldp+212,(((0x63U == vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__opcode
                                      [1U]) ? (((0x63U 
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
                                      : ((0x6fU == 
                                          vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__opcode
                                          [1U]) ? 1U
                                          : ((0x67U 
                                              == vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__opcode
                                              [1U])
                                              ? 2U : 0U)))),2);
        tracep->fullIData(oldp+213,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__alu_a
                                    [0U]),32);
        tracep->fullIData(oldp+214,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__alu_b
                                    [0U]),32);
        tracep->fullCData(oldp+215,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__opcode
                                    [1U]),7);
        tracep->fullCData(oldp+216,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__funct3
                                    [1U]),3);
        tracep->fullCData(oldp+217,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__alu_ctrl
                                    [0U]),4);
        tracep->fullBit(oldp+218,((0U == vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT____Vcellout__u_riscv_alu__o_alu_out)));
        tracep->fullBit(oldp+219,(((0x63U == vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__opcode
                                    [1U]) & ((4U & 
                                              vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__funct3
                                              [1U])
                                              ? ((2U 
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
                                              : ((~ 
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
        tracep->fullQData(oldp+220,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__u_riscv_alu__DOT__DEBUG_ALU_OP),64);
        tracep->fullIData(oldp+222,((vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__pc
                                     [2U] + vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__imm
                                     [0U])),32);
        tracep->fullIData(oldp+223,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__pc
                                    [2U]),32);
        tracep->fullIData(oldp+224,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__imm
                                    [0U]),32);
        tracep->fullIData(oldp+225,(((4U & vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__funct3
                                      [2U]) ? ((2U 
                                                & vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__funct3
                                                [2U])
                                                ? 0U
                                                : (
                                                   (1U 
                                                    & vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__funct3
                                                    [2U])
                                                    ? 
                                                   (0xffffU 
                                                    & vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__u_riscv_dmem_interface__DOT__byte_aligned_dmem_rd_data)
                                                    : 
                                                   (0xffU 
                                                    & vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__u_riscv_dmem_interface__DOT__byte_aligned_dmem_rd_data)))
                                      : ((2U & vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__funct3
                                          [2U]) ? (
                                                   (1U 
                                                    & vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__funct3
                                                    [2U])
                                                    ? 0U
                                                    : vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__u_riscv_dmem_interface__DOT__byte_aligned_dmem_rd_data)
                                          : ((1U & 
                                              vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__funct3
                                              [2U])
                                              ? ((0xffff0000U 
                                                  & ((- (IData)(
                                                                (1U 
                                                                 & (vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__u_riscv_dmem_interface__DOT__byte_aligned_dmem_rd_data 
                                                                    >> 0xfU)))) 
                                                     << 0x10U)) 
                                                 | (0xffffU 
                                                    & vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__u_riscv_dmem_interface__DOT__byte_aligned_dmem_rd_data))
                                              : ((0xffffff00U 
                                                  & ((- (IData)(
                                                                (1U 
                                                                 & (vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__u_riscv_dmem_interface__DOT__byte_aligned_dmem_rd_data 
                                                                    >> 7U)))) 
                                                     << 8U)) 
                                                 | (0xffU 
                                                    & vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__u_riscv_dmem_interface__DOT__byte_aligned_dmem_rd_data)))))),32);
        tracep->fullIData(oldp+226,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__alu_out
                                    [0U]),32);
        tracep->fullBit(oldp+227,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__mem_wr_en
                                  [1U]));
        tracep->fullIData(oldp+228,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__fwd_b
                                    [0U]),32);
        tracep->fullCData(oldp+229,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__funct3
                                    [2U]),3);
        tracep->fullCData(oldp+230,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__u_riscv_dmem_interface__DOT__dmem_intf_strb),4);
        tracep->fullIData(oldp+231,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__u_riscv_dmem_interface__DOT__byte_aligned_dmem_rd_data),32);
        tracep->fullIData(oldp+232,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__u_riscv_mux_regfile_rd_data__DOT__mux_input_arr
                                    [vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__src_rd
                                    [2U]]),32);
        tracep->fullCData(oldp+233,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__src_rd
                                    [2U]),2);
        tracep->fullIData(oldp+234,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__u_riscv_mux_regfile_rd_data__DOT__mux_input_arr[0]),32);
        tracep->fullIData(oldp+235,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__u_riscv_mux_regfile_rd_data__DOT__mux_input_arr[1]),32);
        tracep->fullIData(oldp+236,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__u_riscv_mux_regfile_rd_data__DOT__mux_input_arr[2]),32);
        tracep->fullIData(oldp+237,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__u_riscv_mux_regfile_rd_data__DOT__mux_input_arr[3]),32);
        tracep->fullIData(oldp+238,(vlTOPp->riscv_top__DOT__u_riscv_dmem__DOT__i),32);
        tracep->fullIData(oldp+239,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__u_riscv_regfile__DOT__registers[0]),32);
        tracep->fullIData(oldp+240,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__u_riscv_regfile__DOT__registers[1]),32);
        tracep->fullIData(oldp+241,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__u_riscv_regfile__DOT__registers[2]),32);
        tracep->fullIData(oldp+242,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__u_riscv_regfile__DOT__registers[3]),32);
        tracep->fullIData(oldp+243,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__u_riscv_regfile__DOT__registers[4]),32);
        tracep->fullIData(oldp+244,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__u_riscv_regfile__DOT__registers[5]),32);
        tracep->fullIData(oldp+245,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__u_riscv_regfile__DOT__registers[6]),32);
        tracep->fullIData(oldp+246,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__u_riscv_regfile__DOT__registers[7]),32);
        tracep->fullIData(oldp+247,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__u_riscv_regfile__DOT__registers[8]),32);
        tracep->fullIData(oldp+248,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__u_riscv_regfile__DOT__registers[9]),32);
        tracep->fullIData(oldp+249,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__u_riscv_regfile__DOT__registers[10]),32);
        tracep->fullIData(oldp+250,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__u_riscv_regfile__DOT__registers[11]),32);
        tracep->fullIData(oldp+251,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__u_riscv_regfile__DOT__registers[12]),32);
        tracep->fullIData(oldp+252,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__u_riscv_regfile__DOT__registers[13]),32);
        tracep->fullIData(oldp+253,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__u_riscv_regfile__DOT__registers[14]),32);
        tracep->fullIData(oldp+254,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__u_riscv_regfile__DOT__registers[15]),32);
        tracep->fullIData(oldp+255,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__u_riscv_regfile__DOT__registers[16]),32);
        tracep->fullIData(oldp+256,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__u_riscv_regfile__DOT__registers[17]),32);
        tracep->fullIData(oldp+257,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__u_riscv_regfile__DOT__registers[18]),32);
        tracep->fullIData(oldp+258,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__u_riscv_regfile__DOT__registers[19]),32);
        tracep->fullIData(oldp+259,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__u_riscv_regfile__DOT__registers[20]),32);
        tracep->fullIData(oldp+260,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__u_riscv_regfile__DOT__registers[21]),32);
        tracep->fullIData(oldp+261,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__u_riscv_regfile__DOT__registers[22]),32);
        tracep->fullIData(oldp+262,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__u_riscv_regfile__DOT__registers[23]),32);
        tracep->fullIData(oldp+263,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__u_riscv_regfile__DOT__registers[24]),32);
        tracep->fullIData(oldp+264,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__u_riscv_regfile__DOT__registers[25]),32);
        tracep->fullIData(oldp+265,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__u_riscv_regfile__DOT__registers[26]),32);
        tracep->fullIData(oldp+266,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__u_riscv_regfile__DOT__registers[27]),32);
        tracep->fullIData(oldp+267,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__u_riscv_regfile__DOT__registers[28]),32);
        tracep->fullIData(oldp+268,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__u_riscv_regfile__DOT__registers[29]),32);
        tracep->fullIData(oldp+269,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__u_riscv_regfile__DOT__registers[30]),32);
        tracep->fullIData(oldp+270,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__u_riscv_regfile__DOT__registers[31]),32);
        tracep->fullIData(oldp+271,(vlTOPp->o_riscv_imem_pc),32);
        tracep->fullIData(oldp+272,(vlTOPp->o_riscv_imem_instr),32);
        tracep->fullIData(oldp+273,(vlTOPp->o_riscv_dmem_addr),32);
        tracep->fullBit(oldp+274,(vlTOPp->o_riscv_dmem_wr_en));
        tracep->fullCData(oldp+275,(vlTOPp->o_riscv_dmem_strb),4);
        tracep->fullIData(oldp+276,(vlTOPp->o_riscv_dmem_wr_data),32);
        tracep->fullIData(oldp+277,(vlTOPp->o_riscv_dmem_rd_data),32);
        tracep->fullBit(oldp+278,(vlTOPp->i_clk));
        tracep->fullBit(oldp+279,(vlTOPp->i_rstn));
        tracep->fullIData(oldp+280,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__w_rs1_data[0]),32);
        tracep->fullIData(oldp+281,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__w_rs2_data[0]),32);
        tracep->fullIData(oldp+282,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__u_riscv_regfile__DOT__registers
                                    [vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__rs1
                                    [0U]]),32);
        tracep->fullIData(oldp+283,(vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__u_riscv_regfile__DOT__registers
                                    [vlTOPp->riscv_top__DOT__u_riscv_cpu__DOT__rs2
                                    [0U]]),32);
        tracep->fullBit(oldp+284,((1U & (~ (IData)(vlTOPp->i_clk)))));
        tracep->fullSData(oldp+285,((0x3fffU & (vlTOPp->o_riscv_imem_pc 
                                                >> 2U))),14);
        tracep->fullSData(oldp+286,((0x3fffU & (vlTOPp->o_riscv_dmem_addr 
                                                >> 2U))),14);
        tracep->fullIData(oldp+287,(0U),32);
        tracep->fullIData(oldp+288,(1U),32);
        tracep->fullIData(oldp+289,(2U),32);
        tracep->fullIData(oldp+290,(3U),32);
        tracep->fullIData(oldp+291,(4U),32);
        tracep->fullIData(oldp+292,(4U),32);
    }
}
