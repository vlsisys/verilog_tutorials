// ==================================================
//	[ VLSISYS Lab. ]
//	* Author		: Woong Choi (woongchoi@sm.ac.kr)
//	* Filename		: riscv_hazard.v
//	* Description	: 
// ==================================================

`ifndef		NOINC
`include	"../common/riscv_configs.v"
`endif

module riscv_hazard
(	
	output reg	[1:0]			o_fwd_sel_a_ex,
	output reg	[1:0]			o_fwd_sel_b_ex,
	output						o_stall_if,
	output						o_stall_id,
	output						o_flush_id,
	output						o_flush_ex,
	input		[1:0]			i_src_pc_ex,
	input		[1:0]			i_src_rd_ex,
	input		[4:0]			i_rs1_id,
	input		[4:0]			i_rs2_id,
	input		[4:0]			i_rs1_ex,
	input		[4:0]			i_rs2_ex,
	input		[4:0]			i_rd_ex,
	input		[4:0]			i_rd_mm,
	input		[4:0]			i_rd_wb,
	input						i_reg_wr_en_ex,
	input						i_reg_wr_en_mm,
	input						i_reg_wr_en_wb
);

	//	Foward Data
	always @(*) begin
		if			(((i_rs1_ex == i_rd_mm) && i_reg_wr_en_mm) && (i_rs1_ex != 0)) begin
			o_fwd_sel_a_ex	= `HZD_FORWARD_ALU;
		end else if (((i_rs1_ex == i_rd_wb) && i_reg_wr_en_wb) && (i_rs1_ex != 0)) begin
			o_fwd_sel_a_ex	= `HZD_FORWARD_RLT;
		end else begin
			o_fwd_sel_a_ex	= `HZD_FORWARD_RSD;
		end
	end

	always @(*) begin
		if			(((i_rs2_ex == i_rd_mm) && i_reg_wr_en_mm) && (i_rs2_ex != 0)) begin
			o_fwd_sel_b_ex	= `HZD_FORWARD_ALU;
		end else if (((i_rs2_ex == i_rd_wb) && i_reg_wr_en_wb) && (i_rs2_ex != 0)) begin
			o_fwd_sel_b_ex	= `HZD_FORWARD_RLT;
		end else begin
			o_fwd_sel_b_ex	= `HZD_FORWARD_RSD;
		end
	end
	
	//	Stall & Flush
	wire	stall;
	assign	stall		= ((i_rs1_id == i_rd_ex) || (i_rs2_id == i_rd_ex)) && ((i_src_rd_ex != `SRC_RD_ALU));
	assign	o_stall_if	= stall;
	assign	o_stall_id	= stall;
	assign	o_flush_id	= i_src_pc_ex != `SRC_PC_PC_4;
	assign	o_flush_ex	= o_stall_if || o_flush_id;

endmodule
