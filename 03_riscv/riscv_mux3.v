// ==================================================
//	[ VLSISYS Lab. ]
//	* Author		: Woong Choi (woongchoi@sm.ac.kr)
//	* Filename		: riscv_mux3.v
//	* Description	: 
// ==================================================

`include	"riscv_params.v"

module	riscv_mux3
(	
	output		[`MUX_DATA_BUS]		o_mux_out,
	input		[`MUX_DATA_BUS]		i_mux_in0,
	input		[`MUX_DATA_BUS]		i_mux_in1,
	input		[`MUX_DATA_BUS]		i_mux_in2,
	input		[1:0]				i_mux_sel
);

	assign	o_mux_out = i_mux_sel[1] ? i_mux_in2 : (i_mux_sel[0] ? i_mux_in1 : i_mux_in0);

endmodule
