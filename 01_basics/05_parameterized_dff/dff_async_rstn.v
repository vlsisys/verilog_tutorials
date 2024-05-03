// ==================================================
//	[ VLSISYS Lab. ]
//	* Filename		: dff_async_rstn.v
//	* Author		: Woong Choi (woongchoi@sm.ac.kr)
//	* Description	: 
//		- Key Points
//			1. 
//			2. 
// ==================================================

module	dff_async_rstn
#(	
	parameter	NBIT		= 8
)
(	
	output reg	[NBIT-1:0]		o_q,
	input		[NBIT-1:0]		i_d,
	input						i_clk,
	input						i_rstn
);

	always @(posedge i_clk or negedge i_rstn) begin
	//	if(i_rstn == 1'b0) begin
		if(!i_rstn) begin
			o_q		<= 1'b0;
		end else begin
			o_q		<= i_d;
		end
	end

endmodule

