// ==================================================
//	[ VLSISYS Lab. ]
//	* Author		: Woong Choi (woongchoi@sm.ac.kr)
//	* Filename		: riscv_dff.v
//	* Description	: 
// ==================================================

`include	"riscv_params.v"

module riscv_dff
(	
	output reg	[`DFF_DATA_BUS]		o_dff_q,
	input		[`DFF_DATA_BUS]		i_dff_d,
	input							i_clk,
	input							i_rstn
);

	always @(posedge i_clk or negedge i_rstn) begin
		if(!i_rstn) begin
			o_dff_q	<= 0;
		end else begin
			o_dff_q	<= i_dff_d;
		end
	end

endmodule
