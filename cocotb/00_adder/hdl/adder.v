// ==================================================
//	[ VLSISYS Lab. ]
//	* Author		: Woong Choi (woongchoi@sm.ac.kr)
//	* Filename		: adder.v
//	* Date			: 2024-08-11 20:11:13
//	* Description	: 
// ==================================================

`timescale	1ns/1ps

module adder
(	
	output 		[32:0]	o_s,
	input		[31:0]	i_a,
	input		[31:0]	i_b
);

	assign		o_s	= i_a + i_b;

endmodule
