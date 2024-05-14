// ==================================================
//	[ VLSISYS Lab. ]
//	* Author		: Woong Choi (woongchoi@sm.ac.kr)
//	* Filename		: riscv_mux2.v
//	* Description	: 
// ==================================================

module	riscv_mux2
#(	
	parameter	BW_DATA	= 32
)
(	
	output		[BW_DATA-1:0]	o_mux_out,
	input		[BW_DATA-1:0]	i_mux_in0,
	input		[BW_DATA-1:0]	i_mux_in1,
	input						i_mux_sel
);

	assign	o_mux_out = i_mux_sel ? i_mux_in1 : i_mux_in0;

endmodule
