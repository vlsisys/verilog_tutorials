// ==================================================
//	[ VLSISYS Lab. ]
//	* Author		: Woong Choi (woongchoi@sm.ac.kr)
//	* Filename		: riscv_alu.v
//	* Description	: 
// ==================================================

`include	"riscv_params.v"

module riscv_alu
(	
	output reg	[`ALU_DATA_BUS]		o_alu_result,
	output reg						o_alu_zero,
	input		[`ALU_CTRL_BUS]		i_alu_ctrl,
	input		[`ALU_DATA_BUS]		i_alu_a,
	input		[`ALU_DATA_BUS]		i_alu_b
);


	always @(*) begin
		case (i_alu_ctrl)
			`ALU_OP_ADD	:	o_alu_result = i_alu_a + i_alu_b;
			`ALU_OP_SUB	:	o_alu_result = i_alu_a - i_alu_b;
			`ALU_OP_SLL	:	o_alu_result = i_alu_a << i_alu_b[4:0];
			`ALU_OP_SLT	:	o_alu_result = $signed(i_alu_a) < $signed(i_alu_b);
			`ALU_OP_SLTU:	o_alu_result = i_alu_a < i_alu_b;
			`ALU_OP_XOR	:	o_alu_result = i_alu_a ^ i_alu_b;
			`ALU_OP_SRL	:	o_alu_result = i_alu_a >> i_alu_b[4:0];
			`ALU_OP_SRA	:	o_alu_result = $signed(i_alu_a) >>> $signed(i_alu_b[4:0]);
			`ALU_OP_OR	:	o_alu_result = i_alu_a | i_alu_b;
			`ALU_OP_AND	:	o_alu_result = i_alu_a & i_alu_b;
		endcase
	end

	always @(*) begin
		if (o_alu_result == 0) begin
			o_alu_zero	= 1;
		end else begin
			o_alu_zero	= 0;
		end
	end

endmodule
