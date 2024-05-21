// ==================================================
//	[ VLSISYS Lab. ]
//	* Author		: Woong Choi (woongchoi@sm.ac.kr)
//	* Filename		: riscv_ctrl_aludec.v
//	* Description	: 
// ==================================================

`include	"riscv_configs.v"

module riscv_ctrl_aludec
(	
	output reg	[3:0]	o_alu_ctrl,
	input		[1:0]	i_alu_op,
	input		[2:0]	i_funct3,
	input				i_funct7_5b,
	input				i_opcode_5b
);

	always @(*) begin
		case (i_alu_op)
			`ALUOP_AUIPC_LOAD_STORE	: o_alu_ctrl = `ALU_CTRL_ADD;
			`ALUOP_BRANCH			: o_alu_ctrl = `ALU_CTRL_SUB;
			`ALUOP_RTYPE_ITYPE		: o_alu_ctrl = {i_funct7_5b, i_funct3};
			default					: o_alu_ctrl = `ALU_CTRL_NOP;
		endcase
	end

endmodule
