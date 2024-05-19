// ==================================================
//	[ VLSISYS Lab. ]
//	* Author		: Woong Choi (woongchoi@sm.ac.kr)
//	* Filename		: riscv_ctrl_maindec.v
//	* Description	: 
// ==================================================

`include	"riscv_constants.v"

module riscv_ctrl_maindec
(	
	output reg			o_bra,
	output reg			o_reg_wr,
	output reg			o_mem_wr,
	output reg	[1:0]	o_alu_op,
	output reg			o_alu_src,
	output reg	[2:0]	o_imm_src,
	output reg	[1:0]	o_res_src,
	input		[6:0]	i_opcode
);

	always @(*) begin
		case (i_opcode)
			`OPCODE_LUI		:{o_bra, o_reg_wr, o_mem_wr, o_alu_op, o_alu_src, o_imm_src, o_res_src}<=11'b0_0_0_00_0_000_00;
			`OPCODE_AUIPC	:{o_bra, o_reg_wr, o_mem_wr, o_alu_op, o_alu_src, o_imm_src, o_res_src}<=11'b0_0_0_00_0_000_00;
			`OPCODE_JAL		:{o_bra, o_reg_wr, o_mem_wr, o_alu_op, o_alu_src, o_imm_src, o_res_src}<=11'b0_0_0_00_0_000_00;
			`OPCODE_JALR	:{o_bra, o_reg_wr, o_mem_wr, o_alu_op, o_alu_src, o_imm_src, o_res_src}<=11'b0_0_0_00_0_000_00;
			`OPCODE_BRANCH	:{o_bra, o_reg_wr, o_mem_wr, o_alu_op, o_alu_src, o_imm_src, o_res_src}<=11'b0_0_0_00_0_000_00;
			`OPCODE_LOAD	:{o_bra, o_reg_wr, o_mem_wr, o_alu_op, o_alu_src, o_imm_src, o_res_src}<=11'b0_0_0_00_0_000_00;
			`OPCODE_STORE	:{o_bra, o_reg_wr, o_mem_wr, o_alu_op, o_alu_src, o_imm_src, o_res_src}<=11'b0_0_0_00_0_000_00;
			`OPCODE_OP_IMM	:{o_bra, o_reg_wr, o_mem_wr, o_alu_op, o_alu_src, o_imm_src, o_res_src}<=11'b0_0_0_00_0_000_00;
			`OPCODE_OP		:{o_bra, o_reg_wr, o_mem_wr, o_alu_op, o_alu_src, o_imm_src, o_res_src}<=11'b0_0_0_00_0_000_00;
			`OPCODE_FENCE	:{o_bra, o_reg_wr, o_mem_wr, o_alu_op, o_alu_src, o_imm_src, o_res_src}<=11'b0_0_0_00_0_000_00;
			`OPCODE_SYSTEM	:{o_bra, o_reg_wr, o_mem_wr, o_alu_op, o_alu_src, o_imm_src, o_res_src}<=11'b0_0_0_00_0_000_00;
		endcase
	end

endmodule
