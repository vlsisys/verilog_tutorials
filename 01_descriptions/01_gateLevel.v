module	module_name
#(	parameter	PARAM0	= 0,
	parameter	PARAM1	= 1,
	parameter	PARAM2	= 2
)
(
	//	Outputs
	output	reg		[ 31:0]		o_dout,
	output	reg					o_valid,

	//	Inputs
	input	wire	[ 31:0]		i_din,
	input	wire				i_clk,
	input	wire				i_rst
);

endmodule
