// ==================================================
//	[ VLSISYS Lab. ]
//	* Author		: Woong Choi (woongchoi@sm.ac.kr)
//	* Filename		: riscv_ctrl.v
//	* Description	: 
// ==================================================

`include	"../common/riscv_configs.v"

module riscv_ctrl
(	
	output reg	[1:0]			o_ctrl_src_pc,
	output reg	[2:0]			o_ctrl_src_imm,
	output reg	[1:0]			o_ctrl_src_rd,
	output reg					o_ctrl_src_alu_a,
	output reg					o_ctrl_src_alu_b,
	output reg					o_ctrl_reg_wr,
	output reg					o_ctrl_mem_wr,
	output reg	[3:0]			o_ctrl_alu_ctrl,
	input						i_ctrl_alu_zero,
	input		[6:0]			i_ctrl_opcode,
	input		[2:0]			i_ctrl_funct3,
	input						i_ctrl_funct7_5b
);

	reg							take_branch;
	always @(*) begin
		if (i_ctrl_opcode == `OPCODE_B_BRANCH) begin
			case (i_ctrl_funct3)
				`FUNCT3_BRANCH_BEQ	: take_branch =  i_ctrl_alu_zero;
				`FUNCT3_BRANCH_BNE 	: take_branch = !i_ctrl_alu_zero;
				`FUNCT3_BRANCH_BLT 	: take_branch = !i_ctrl_alu_zero;
				`FUNCT3_BRANCH_BGE 	: take_branch =  i_ctrl_alu_zero;
				`FUNCT3_BRANCH_BLTU	: take_branch = !i_ctrl_alu_zero;
				`FUNCT3_BRANCH_BGEU	: take_branch =  i_ctrl_alu_zero;
				default				: take_branch = 1'b0;
			endcase
		end else begin
			take_branch	= 1'b0;
		end
	end

	always @(*) begin
		case (i_ctrl_opcode)
			`OPCODE_B_BRANCH	: o_ctrl_src_pc		= (take_branch) ? `SRC_PC_PC_IMM: `SRC_PC_PC_4;
			`OPCODE_J_JAL		: o_ctrl_src_pc		= `SRC_PC_PC_IMM;
			`OPCODE_I_JALR		: o_ctrl_src_pc		= `SRC_PC_RS_IMM;
			default				: o_ctrl_src_pc		= `SRC_PC_PC_4;
		endcase
	end

	always @(*) begin
		case (i_ctrl_opcode)
			`OPCODE_R_OP		: o_ctrl_src_imm	= `SRC_IMM_R;
			`OPCODE_I_OP		,
			`OPCODE_I_LOAD		,
			`OPCODE_I_JALR		: o_ctrl_src_imm	= `SRC_IMM_I;
			`OPCODE_S_STORE		: o_ctrl_src_imm	= `SRC_IMM_S;
			`OPCODE_B_BRANCH	: o_ctrl_src_imm	= `SRC_IMM_B;
			`OPCODE_J_JAL		: o_ctrl_src_imm	= `SRC_IMM_J;
			`OPCODE_U_LUI		,
			`OPCODE_U_AUIPC		: o_ctrl_src_imm	= `SRC_IMM_U;
			default				: o_ctrl_src_imm	= `SRC_IMM_X;
		endcase
	end

	always @(*) begin
		case (i_ctrl_opcode)
			`OPCODE_I_LOAD		: o_ctrl_src_rd		= `SRC_RD_DME;
			`OPCODE_J_JAL		,
			`OPCODE_I_JALR		: o_ctrl_src_rd		= `SRC_RD_PC4;
			`OPCODE_U_LUI		: o_ctrl_src_rd		= `SRC_RD_IMM;
			default				: o_ctrl_src_rd		= `SRC_RD_ALU;
		endcase
	end

	always @(*) begin
		case (i_ctrl_opcode)
			`OPCODE_U_AUIPC		: o_ctrl_src_alu_a	= `SRC_ALU_A_PC;
			default				: o_ctrl_src_alu_a	= `SRC_ALU_A_RS1;
		endcase
	end

	always @(*) begin
		case (i_ctrl_opcode)
			`OPCODE_I_OP		,
			`OPCODE_I_LOAD		,
			`OPCODE_I_JALR		: o_ctrl_src_alu_b	= `SRC_ALU_B_IMM;
			default				: o_ctrl_src_alu_b	= `SRC_ALU_B_RS2;
		endcase
	end

	always @(*) begin
		case (i_ctrl_opcode)
			`OPCODE_S_STORE		,
			`OPCODE_B_BRANCH	: o_ctrl_reg_wr		= 1'b0;
			default				: o_ctrl_reg_wr		= 1'b1;
		endcase
	end

	always @(*) begin
		case (i_ctrl_opcode)
			`OPCODE_S_STORE		: o_ctrl_mem_wr		= 1'b1;
			default				: o_ctrl_mem_wr		= 1'b0;
		endcase
	end

	always @(*) begin
		case (i_ctrl_opcode)
			`OPCODE_R_OP		,
			`OPCODE_I_OP		: begin
				case (i_ctrl_funct3)
					`FUNCT3_ALU_ADD_SUB	: o_ctrl_alu_ctrl = i_ctrl_funct7_5b ? `ALU_CTRL_SUB : `ALU_CTRL_ADD ;
					`FUNCT3_ALU_XOR		: o_ctrl_alu_ctrl = `ALU_CTRL_XOR                                    ;
					`FUNCT3_ALU_OR		: o_ctrl_alu_ctrl = `ALU_CTRL_OR                                     ;
					`FUNCT3_ALU_AND		: o_ctrl_alu_ctrl = `ALU_CTRL_AND                                    ;
					`FUNCT3_ALU_SLL		: o_ctrl_alu_ctrl = `ALU_CTRL_SLL                                    ;
					`FUNCT3_ALU_SRL_SRA	: o_ctrl_alu_ctrl = i_ctrl_funct7_5b ? `ALU_CTRL_SRA : `ALU_CTRL_SRL ;
					`FUNCT3_ALU_SLT		: o_ctrl_alu_ctrl = `ALU_CTRL_SLT                                    ;
					`FUNCT3_ALU_SLTU	: o_ctrl_alu_ctrl = `ALU_CTRL_SLTU                                   ;
				endcase
			end
			`OPCODE_B_BRANCH	: begin
				case (i_ctrl_funct3)
					`FUNCT3_BRANCH_BEQ	,
					`FUNCT3_BRANCH_BNE	: o_ctrl_alu_ctrl = `ALU_CTRL_SUB;
					`FUNCT3_BRANCH_BLT	, 
					`FUNCT3_BRANCH_BGE	: o_ctrl_alu_ctrl = `ALU_CTRL_SLT;
					`FUNCT3_BRANCH_BLTU	,
					`FUNCT3_BRANCH_BGEU	: o_ctrl_alu_ctrl = `ALU_CTRL_SLTU;
				endcase
			end
		endcase
	end

endmodule
