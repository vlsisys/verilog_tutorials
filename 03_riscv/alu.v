// ==================================================
//	[ VLSISYS Lab. ]
//	* Author		: Woong Choi (woongchoi@sm.ac.kr)
//	* Filename		: alu.v
//	* Description	: 
// ==================================================

module	alu
#(	
	parameter	BW	= 32
)
(	
	output reg	[BW-1:0]	o_alu_result,
	output reg				o_alu_zero,
	input		[3:0]		i_alu_op,
	input		[BW-1:0]	i_alu_a,
	input		[BW-1:0]	i_alu_b
);

	localparam	ALUOP_AND	= 4'b0000;
	localparam	ALUOP_OR	= 4'b0001;
	localparam	ALUOP_ADD	= 4'b0010;
	localparam	ALUOP_SUB	= 4'b0110;

	always @(*) begin
		case (i_alu_op)
			ALUOP_AND	: o_alu_result	= i_alu_a & i_alu_b;
			ALUOP_OR	: o_alu_result	= i_alu_a | i_alu_b;
			ALUOP_ADD	: o_alu_result	= i_alu_a + i_alu_b;
			ALUOP_SUB	: o_alu_result	= i_alu_a - i_alu_b;
			default		: o_alu_result	= 0;
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
