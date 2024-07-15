// ==================================================
//	[ VLSISYS Lab. ]
//	* Author		: Woong Choi (woongchoi@sm.ac.kr)
//	* Filename		: riscv_dff.v
//	* Description	: 
// ==================================================

module riscv_dff
#(
	parameter	BW_DATA	= 32
)
(	
	output reg	[BW_DATA-1:0]	o_dff_q,
	input		[BW_DATA-1:0]	i_dff_d,
	input						i_clk,
	input						i_rstn
);

	always @(posedge i_clk or negedge i_rstn) begin
		if(!i_rstn) begin
			o_dff_q	<= 0;
		end else begin
			o_dff_q	<= i_dff_d;
		end
	end

endmodule
