// ==================================================
//	[ VLSISYS Lab. ]
//	* Author		: Woong Choi (woongchoi@sm.ac.kr)
//	* Filename		: lfsr.v
//	* Date			: 2024-07-07 18:52:17
//	* Description	: 
// ==================================================

module lfsr8
#(	
	parameter	SEED		= 8'd1
)
(	
	output reg	[7:0]		o_lfsr,
	input					i_clk,
	input					i_rstn
);

	always @(posedge i_clk or negedge i_rstn) begin
		if(!i_rstn) begin
			o_lfsr	<= SEED;
		end else begin
			o_lfsr	<= {o_lfsr[6:0], o_lfsr[1] ^ o_lfsr[2] ^ o_lfsr[3] ^ o_lfsr[7]};
		end
	end

endmodule

module lfsr3
#(	
	parameter	SEED		= 3'd1
)
(	
	output reg	[2:0]		o_lfsr,
	input					i_clk,
	input					i_rstn
);

	always @(posedge i_clk or negedge i_rstn) begin
		if(!i_rstn) begin
			o_lfsr	<= SEED;
		end else begin
			o_lfsr	<= {o_lfsr[1:0], o_lfsr[0] ^ o_lfsr[2]};
		end
	end

endmodule
