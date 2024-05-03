// ==================================================
//	[ VLSISYS Lab. ]
//	* Filename		: adder.v
//	* Author		: Woong Choi (woongchoi@sm.ac.kr)
//	* Description	: 
//		- Key Points
//			1. Parameterized Module
//			2. Multibit Expression
//			3. 'assign'-based Description
//			4. Concatenation & Operand
// ==================================================

module	adder
#(	
	parameter	NBIT		= 8
)
(	
	output 		[NBIT-1:0]	o_s,
	output 			 	  	o_c,
	input		[NBIT-1:0]	i_a,
	input		[NBIT-1:0]	i_b,
	input					i_c
);

	assign		{o_c, o_s} = i_a + i_b + i_c;

endmodule
