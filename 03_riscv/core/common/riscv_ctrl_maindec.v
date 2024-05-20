// ==================================================
//	[ VLSISYS Lab. ]
//	* Author		: Woong Choi (woongchoi@sm.ac.kr)
//	* Filename		: riscv_ctrl_maindec.v
//	* Description	: 
// ==================================================

`include	"riscv_configs.v"

module riscv_ctrl_maindec
(	
	output reg			o_branch,
	output reg			o_jump,
	output reg			o_reg_wr,
	output reg			o_mem_wr,
	output reg			o_alu_src_a,
	output reg			o_alu_src_b,
	output reg	[1:0]	o_res_src,
	output reg	[2:0]	o_imm_src,
	output reg	[1:0]	o_alu_op,
	input		[6:0]	i_opcode
);

	always @(*) begin
		case (i_opcode)
			`OPCODE_BRANCH	: o_branch	<= 1'b1;
			default			: o_branch	<= 1'b0;
		endcase
	end

	always @(*) begin
		case (i_opcode)
			`OPCODE_JAL		,
			`OPCODE_JALR	: o_jump	<= 1'b1;
			default			: o_jump	<= 1'b0;
		endcase
	end

	always @(*) begin
		case (i_opcode)
			`OPCODE_LUI		,
			`OPCODE_AUIPC	,
			`OPCODE_JAL		,
			`OPCODE_JALR	: o_reg_wr	<= 1'b1;
			default			: o_reg_wr	<= 1'b0;
		endcase
	end

	always @(*) begin
		case (i_opcode)
			`OPCODE_LUI		: o_imm_src <= `INSTR_U_TYPE; // U-Type
			`OPCODE_AUIPC	: o_imm_src <= `INSTR_U_TYPE; // U-Type
			`OPCODE_JAL		: o_imm_src <= `INSTR_J_TYPE; // J-Type
			`OPCODE_JALR	: o_imm_src <= `INSTR_J_TYPE; // J-Type
			`OPCODE_BRANCH	: o_imm_src <= `INSTR_B_TYPE; // B-Type
			`OPCODE_LOAD	: o_imm_src <= `INSTR_I_TYPE; // I-Type
			`OPCODE_STORE	: o_imm_src <= `INSTR_S_TYPE; // S-Type
			`OPCODE_OP_IMM	: o_imm_src <= `INSTR_I_TYPE; // I-Type
			`OPCODE_OP		: o_imm_src <= `INSTR_R_TYPE; // R-Type
			`OPCODE_FENCE	: o_imm_src <= `INSTR_I_TYPE; // I-Type
			`OPCODE_SYSTEM	: o_imm_src <= `INSTR_I_TYPE; // I-Type
		endcase
	end

endmodule
