// ==================================================
//	[ VLSISYS Lab. ]
//	* Author		: Woong Choi (woongchoi@sm.ac.kr)
//	* Filename		: riscv_adder.v
//	* Description	: 
// ==================================================

module riscv_adder
#(
	parameter	BW_DATA	= 32
)
(	
	output		[BW_DATA-1:0]	o_add_sum,
	input		[BW_DATA-1:0]	i_add_a,
	input		[BW_DATA-1:0]	i_add_b
);

	assign	o_add_sum = i_add_a + i_add_b;

endmodule
