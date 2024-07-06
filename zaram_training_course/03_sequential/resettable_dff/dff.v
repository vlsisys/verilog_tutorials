// ==================================================
//	[ VLSISYS Lab. ]
//	* Author		: Woong Choi (woongchoi@sm.ac.kr)
//	* Filename		: dff.v
//	* Date			: 2024-06-24 14:59:00
//	* Description	: 
// ==================================================

module dff_async
#(	
	parameter	BW_DATA			= 32
)
(	
	output reg	[BW_DATA-1:0]	o_q,
	input		[BW_DATA-1:0]	i_d,
	input						i_clk,
	input						i_rstn
);

	always @(posedge i_clk or negedge i_rstn) begin
		if(!i_rstn) begin
			o_q	<= 0;
		end else begin
			o_q	<= i_d;
		end
	end

endmodule

module dff_sync
#(	
	parameter	BW_DATA			= 32
)
(	
	output reg	[BW_DATA-1:0]	o_q,
	input		[BW_DATA-1:0]	i_d,
	input						i_clk,
	input						i_rstn
);

	always @(posedge i_clk) begin
		if(!i_rstn) begin
			o_q	<= 0;
		end else begin
			o_q	<= i_d;
		end
	end

endmodule
