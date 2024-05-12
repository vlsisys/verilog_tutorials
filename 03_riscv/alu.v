// ==================================================
//	[ VLSISYS Lab. ]
//	* Author		: Woong Choi (woongchoi@sm.ac.kr)
//	* Filename		: alu.v
//	* Description	: 
//		- Redundant
//			* Only i_func7[5], i_opcode[5] are used
// ==================================================

`include	"params.v"

module	alu
(	
	output reg	[`ALU_DATA_BUS]		o_result,
	output reg						o_zero,
	input		[4:0]				i_shamt,
	input		[2:0]				i_func3,
	input		[6:0]				i_func7,
	input		[6:0]				i_opcode,
	input		[`ALU_DATA_BUS]		i_src_reg_a,
	input		[`ALU_DATA_BUS]		i_src_reg_b,
	input		[`ALU_DATA_BUS]		i_src_imm
);

	wire		[`ALU_DATA_BUS]		alu_src_a;
	wire		[`ALU_DATA_BUS]		alu_src_b;

	assign		alu_src_a	= i_src_reg_a;
	assign		alu_src_b	= i_opcode[5] ? i_src_reg_a : i_src_imm;


	always @(*) begin
		case (i_func3)
			`ALU_FN3_ADDSUB	:	o_result = i_func7[5] ? (alu_src_a - alu_src_b) : (alu_src_a + alu_src_b);
			`ALU_FN3_SLL	:	o_result = alu_src_a << i_shamt;
			`ALU_FN3_SLT	:	o_result = $signed(alu_src_a) < $signed(alu_src_b);
			`ALU_FN3_SLTU	:	o_result = alu_src_a < alu_src_b;
			`ALU_FN3_XOR	:	o_result = alu_src_a ^ alu_src_b;
			`ALU_FN3_SRLSRA	:	o_result = i_func7[5] ? ($signed(alu_src_a) >>> i_shamt) : (alu_src_a >> i_shamt);
			`ALU_FN3_OR		:	o_result = alu_src_a | alu_src_b;
			`ALU_FN3_AND	:	o_result = alu_src_a & alu_src_b;
		endcase
	end

	always @(*) begin
		if (o_result == 0) begin
			o_zero	= 1;
		end else begin
			o_zero	= 0;
		end
	end

endmodule
