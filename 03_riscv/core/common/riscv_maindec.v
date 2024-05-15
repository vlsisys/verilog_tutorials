// ==================================================
//	[ VLSISYS Lab. ]
//	* Author		: Woong Choi (woongchoi@sm.ac.kr)
//	* Filename		: riscv_maindec.v
//	* Description	: 
// ==================================================

module riscv_maindec
#(	
	parameter	BW_CTRL	= 4
)
(	
	output reg					o_pc_src,
	output reg	[        1:0]	o_result_src,
	output reg					o_mem_wr,
	output reg					o_alu_src,
	output reg	[        1:0]	o_imm_src,
	output reg					o_reg_wr,
	output reg	         1:0]	o_alu_op,
	input						i_zero,
	input		[        6:0]	i_opcode
);

endmodule
