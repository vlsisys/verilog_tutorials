// ==================================================
//	[ VLSISYS Lab. ]
//	* Author		: Woong Choi (woongchoi@sm.ac.kr)
//	* Filename		: riscv_mux2.v
//	* Description	: 
// ==================================================

`include	"riscv_params.v"

module	riscv_mux2
(	
	output		[`MUX_DATA_BUS]		o_mux_out,
	input		[`MUX_DATA_BUS]		i_mux_in0,
	input		[`MUX_DATA_BUS]		i_mux_in1,
	input							i_mux_sel
);

	assign	o_mux_out = i_mux_sel ? i_mux_in1 : i_mux_in0;

endmodule
