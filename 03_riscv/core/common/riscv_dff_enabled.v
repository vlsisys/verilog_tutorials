// ==================================================
//	[ VLSISYS Lab. ]
//	* Author		: Woong Choi (woongchoi@sm.ac.kr)
//	* Filename		: riscv_dff_enabled.v
//	* Description	: 
// ==================================================

module riscv_dff_enabled
#(
	parameter	BW_DATA	= 32
)
(	
	output reg	[BW_DATA-1:0]	o_dff_q,
	input		[BW_DATA-1:0]	i_dff_d,
	input						i_en,
	input						i_clk,
	input						i_rstn
);

	always @(posedge i_clk or negedge i_rstn) begin
		if(!i_rstn) begin
			o_dff_q	<= 0;
		end else begin
			if(i_en) begi
				o_dff_q	<= i_dff_d;
			end else begin
				o_dff_q	<= o_dff_q;
			end
		end
	end

endmodule
