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
#(	
	parameter	BW_DATA			= 32
)
(	
	output reg	[1:0]			o_fwd_a,
	output reg	[1:0]			o_fwd_b,
	output						o_stall,
	output						o_flush_id,
	output						o_flush_ex,
	input		[1:0]			i_src_pc_ex,
	input		[1:0]			i_src_rd_ex,
	input		[BW_DATA-1:0]	i_rs1_id,
	input		[BW_DATA-1:0]	i_rs2_id,
	input		[BW_DATA-1:0]	i_rs1_ex,
	input		[BW_DATA-1:0]	i_rs2_ex,
	input		[BW_DATA-1:0]	i_rd_ex,
	input		[BW_DATA-1:0]	i_rd_mm,
	input		[BW_DATA-1:0]	i_rd_wb,
	input						i_reg_wr_en_mm,
	input						i_reg_wr_en_wb
);

	//	Foward Data
	always @(*) begin
		if			(((i_rs1_ex == i_rd_mm) && i_reg_wr_en_mm) && (i_rs1_ex != 0)) begin
			o_fwd_a	= `HZD_FORWARD_ALU;
		end else if (((i_rs1_ex == i_rd_wb) && i_reg_wr_en_wb) && (i_rs1_ex != 0)) begin
			o_fwd_a	= `HZD_FORWARD_RLT;
		end else begin
			o_fwd_a	= `HZD_FORWARD_RSD;
		end
	end

	always @(*) begin
		if			(((i_rs2_ex == i_rd_mm) && i_reg_wr_en_mm) && (i_rs2_ex != 0)) begin
			o_fwd_b	= `HZD_FORWARD_ALU;
		end else if (((i_rs2_ex == i_rd_wb) && i_reg_wr_en_wb) && (i_rs2_ex != 0)) begin
			o_fwd_b	= `HZD_FORWARD_RLT;
		end else begin
			o_fwd_b	= `HZD_FORWARD_RSD;
		end
	end
	
	//	Stall & Flush
	assign	o_stall		= ((i_rs1_id == i_rd_ex) || (i_rs2_id == i_rd_ex)) && ((i_src_rd_ex == `SRC_RD_DME));
	assign	o_flush_id	= i_src_pc_ex != `SRC_PC_PC_4;
	assign	o_flush_ex	= o_stall || o_flush_id;

endmodule
