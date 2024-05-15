// ==================================================
//	[ VLSISYS Lab. ]
//	* Author		: Woong Choi (woongchoi@sm.ac.kr)
//	* Filename		: riscv_alu_ctrl.v
//	* Description	: 
// ==================================================

module riscv_alu_ctrl
#(	
	parameter	BW_DATA	= 32,
	parameter	BW_CTRL	= 4
)
(	
	output reg	[BW_CTRL-1:0]	o_alu_ctrl,
	input		[        2:0]	i_inst_func3,
	input		[        6:0]	i_inst_func7,
	input						i_rstn
);

endmodule
