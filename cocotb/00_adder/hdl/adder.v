// ==================================================
//	[ VLSISYS Lab. ]
//	* Author		: Woong Choi (woongchoi@sm.ac.kr)
//	* Filename		: adder.v
//	* Date			: 2024-08-11 20:11:13
//	* Description	: 
// ==================================================

`timescale	1ns/1ps
module adder
#(	
	parameter	BW_DATA			= 32
)
(	
	output 		[BW_DATA-1:0]	o_s,
	input		[BW_DATA-1:0]	i_a,
	input		[BW_DATA-1:0]	i_b
);

	assign		o_s	= i_a + i_b;

endmodule
