// ==================================================
//	[ VLSISYS Lab. ]
//	* Author		: Woong Choi (woongchoi@sm.ac.kr)
//	* Filename		: riscv_mux3.v
//	* Description	: 
// ==================================================

module	riscv_mux3
#(	
	parameter	BW_DATA	= 32
)
(	
	output		[BW_DATA-1:0]		o_mux_out,
	input		[BW_DATA-1:0]		i_mux_in0,
	input		[BW_DATA-1:0]		i_mux_in1,
	input		[BW_DATA-1:0]		i_mux_in2,
	input		[1:0]				i_mux_sel
);

	assign	o_mux_out = i_mux_sel[1] ? i_mux_in2 : (i_mux_sel[0] ? i_mux_in1 : i_mux_in0);

endmodule
