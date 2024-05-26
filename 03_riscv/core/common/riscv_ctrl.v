// ==================================================
//	[ VLSISYS Lab. ]
//	* Author		: Woong Choi (woongchoi@sm.ac.kr)
//	* Filename		: riscv_ctrl.v
//	* Description	: 
// ==================================================

`include	"riscv_configs.v"

module riscv_ctrl
(	
	output				o_ctrl_src_pc,
	output reg			o_ctrl_src_alu_a,
	output reg			o_ctrl_src_alu_b,
	output reg	[2:0]	o_ctrl_src_imm,
	output reg	[1:0]	o_ctrl_src_result,
	output reg			o_ctrl_reg_wr,
	output reg			o_ctrl_mem_wr,
	output reg	[3:0]	o_ctrl_alu_ctrl,
	input				i_ctrl_zero,
	input		[6:0]	i_ctrl_opcode,
	input		[2:0]	i_ctrl_funct3,
	input				i_ctrl_funct7_5b
);

	reg					w_ctrl_branch      	;
	reg					w_ctrl_jump        	;
	reg			[1:0]	w_ctrl_alu_op      	;

	assign	o_ctrl_src_pc	= (i_ctrl_zero & w_ctrl_branch) | w_ctrl_jump;

	always @(*) begin
		case (i_ctrl_opcode)
			`OPCODE_BRANCH	: w_ctrl_branch	<= 1'b1;
			default			: w_ctrl_branch	<= 1'b0;
		endcase
	end

	always @(*) begin
		case (i_ctrl_opcode)
			`OPCODE_JAL		,
			`OPCODE_JALR	: w_ctrl_jump	<= 1'b1;
			default			: w_ctrl_jump	<= 1'b0;
		endcase
	end

	always @(*) begin
		case (i_ctrl_opcode)
			`OPCODE_LUI		,
			`OPCODE_AUIPC	,
			`OPCODE_JAL		,
			`OPCODE_JALR	,
			`OPCODE_LOAD	,
			`OPCODE_OP_IMM	,
			`OPCODE_OP		: o_ctrl_reg_wr	<= 1'b1;
			default			: o_ctrl_reg_wr	<= 1'b0;
		endcase
	end

	always @(*) begin
		case (i_ctrl_opcode)
			`OPCODE_STORE	: o_ctrl_mem_wr	<= 1'b1;
			default			: o_ctrl_mem_wr	<= 1'b0;
		endcase
	end

	always @(*) begin
		case (i_ctrl_opcode)
			`OPCODE_AUIPC	: o_ctrl_src_alu_a	<= 1'b1;
			default			: o_ctrl_src_alu_a	<= 1'b0;
		endcase
	end

	always @(*) begin
		case (i_ctrl_opcode)
			`OPCODE_LUI		,
			`OPCODE_AUIPC	,
			`OPCODE_JALR	,
			`OPCODE_LOAD	,
			`OPCODE_STORE	,
			`OPCODE_OP_IMM	: o_ctrl_src_alu_b	<= 1'b1;
			default			: o_ctrl_src_alu_b	<= 1'b0;
		endcase
	end

	always @(*) begin
		case (i_ctrl_opcode)
			`OPCODE_LUI		: o_ctrl_src_result <= `RES_SRC_ALU;	// 0 + IMM --> REG
			`OPCODE_AUIPC	: o_ctrl_src_result <= `RES_SRC_ALU;
			`OPCODE_JAL		: o_ctrl_src_result <= `RES_SRC_PC4;
			`OPCODE_JALR	: o_ctrl_src_result <= `RES_SRC_PC4;
			`OPCODE_LOAD	: o_ctrl_src_result <= `RES_SRC_DME;
			`OPCODE_OP_IMM	: o_ctrl_src_result <= `RES_SRC_ALU;
			`OPCODE_OP		: o_ctrl_src_result <= `RES_SRC_ALU;
			default			: o_ctrl_src_result <= `RES_SRC_NOP;
		endcase
	end

	always @(*) begin
		case (i_ctrl_opcode)
			`OPCODE_LUI		: o_ctrl_src_imm <= `INSTR_U_TYPE; // U-Type
			`OPCODE_AUIPC	: o_ctrl_src_imm <= `INSTR_U_TYPE; // U-Type
			`OPCODE_JAL		: o_ctrl_src_imm <= `INSTR_J_TYPE; // J-Type
			`OPCODE_JALR	: o_ctrl_src_imm <= `INSTR_J_TYPE; // J-Type
			`OPCODE_BRANCH	: o_ctrl_src_imm <= `INSTR_B_TYPE; // B-Type
			`OPCODE_LOAD	: o_ctrl_src_imm <= `INSTR_I_TYPE; // I-Type
			`OPCODE_STORE	: o_ctrl_src_imm <= `INSTR_S_TYPE; // S-Type
			`OPCODE_OP_IMM	: o_ctrl_src_imm <= `INSTR_I_TYPE; // I-Type
			`OPCODE_OP		: o_ctrl_src_imm <= `INSTR_R_TYPE; // R-Type
			`OPCODE_FENCE	: o_ctrl_src_imm <= `INSTR_I_TYPE; // I-Type
			`OPCODE_SYSTEM	: o_ctrl_src_imm <= `INSTR_I_TYPE; // I-Type
		endcase
	end

	always @(*) begin
		case (i_ctrl_opcode)
			`OPCODE_AUIPC	,
			`OPCODE_LOAD	,
			`OPCODE_STORE	: w_ctrl_alu_op <= `ALUOP_AUIPC_LOAD_STORE;
			`OPCODE_BRANCH	: w_ctrl_alu_op <= `ALUOP_BRANCH;
			`OPCODE_OP_IMM	,
			`OPCODE_OP		: w_ctrl_alu_op <= `ALUOP_RTYPE_ITYPE;
			default			: w_ctrl_alu_op <= `ALUOP_NOP;
		endcase
	end

	always @(*) begin
		case (w_ctrl_alu_op)
			`ALUOP_AUIPC_LOAD_STORE	: o_ctrl_alu_ctrl = `ALU_CTRL_ADD;
			`ALUOP_BRANCH			: o_ctrl_alu_ctrl = `ALU_CTRL_SUB;
			`ALUOP_RTYPE_ITYPE		: o_ctrl_alu_ctrl = {i_ctrl_funct7_5b, i_ctrl_funct3};
			default					: o_ctrl_alu_ctrl = `ALU_CTRL_NOP;
		endcase
	end

endmodule
