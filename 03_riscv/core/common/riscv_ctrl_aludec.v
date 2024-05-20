// ==================================================
//	[ VLSISYS Lab. ]
//	* Author		: Woong Choi (woongchoi@sm.ac.kr)
//	* Filename		: riscv_ctrl_aludec.v
//	* Description	: 
// ==================================================

module riscv_ctrl_aludec
#(	
	parameter	BW_CTRL	= 4
)
(	
	output reg	[BW_CTRL-1:0]	o_alu_ctrl,
	input		[1:0]			i_alu_op,
	input		[2:0]			i_funct3,
	input						i_funct7_5b,
	input						i_opcode_5b
);

	always @

endmodule
