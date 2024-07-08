// ==================================================
//	[ VLSISYS Lab. ]
//	* Author		: Woong Choi (woongchoi@sm.ac.kr)
//	* Filename		: rand_clk_gen.v
//	* Date			: 2024-07-07 19:09:48
//	* Description	: 
// ==================================================

`include	"lfsr.v"

module rand_clk_gen
#(	
	parameter	SEED		= 8'd1
)
(	
	output reg				o_rnd_clk,
	input					i_clk,
	input					i_rstn
);

	wire	[2:0]			lfsr3;
	wire	[7:0]			lfsr8;
	wire					mux_o;

	lfsr3
	#(
		.SEED				(SEED				)
	)
	u_lfsr3(
		.o_lfsr				(lfsr3				),
		.i_clk				(i_clk				),
		.i_rstn				(i_rstn				)
	);

	lfsr8
	#(
		.SEED				(SEED				)
	)
	u_lfsr8(
		.o_lfsr				(lfsr8				),
		.i_clk				(i_clk				),
		.i_rstn				(i_rstn				)
	);

	assign	mux_o = lfsr8[lfsr3] ? ~o_rnd_clk : o_rnd_clk;

	always @(posedge i_clk or negedge i_rstn) begin
		if(!i_rstn) begin
			o_rnd_clk	<= 1'b0;
		end else begin
			o_rnd_clk	<= mux_o;
		end
	end

endmodule
