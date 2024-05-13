// ==================================================
//	[ VLSISYS Lab. ]
//	* Author		: Woong Choi (woongchoi@sm.ac.kr)
//	* Filename		: riscv_add.v
//	* Description	: 
// ==================================================

`include	"riscv_params.v"

module riscv_add
(	
	output		[`ADD_DATA_BUS]		o_add_sum,
	input		[`ADD_DATA_BUS]		i_add_a,
	input		[`ADD_DATA_BUS]		i_add_b
);

	assign	o_add_sum = i_add_a + i_add_b;

endmodule
