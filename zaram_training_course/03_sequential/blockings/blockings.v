// ==================================================
//	[ VLSISYS Lab. ]
//	* Author		: Woong Choi (woongchoi@sm.ac.kr)
//	* Filename		: blocking.v
//	* Date			: 2024-06-24 14:17:09
//	* Description	: 
// ==================================================

module blocking
(	
	output reg	o_q,
	input		i_d,
	input		i_clk
);

	reg		n_1;
	always @(posedge i_clk) begin
		n_1	= i_d;
		o_q	= n_1;
	end
	
endmodule

module nonblocking
(	
	output reg	o_q,
	input		i_d,
	input		i_clk
);

	reg		n_1;
	always @(posedge i_clk) begin
		n_1	<= i_d;
		o_q	<= n_1;
	end
	
endmodule
