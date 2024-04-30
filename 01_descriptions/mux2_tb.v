// --------------------------------------------------
//	Define Global Variables
// --------------------------------------------------
//	Clock
`define	CLKFREQ		100					// Unit: MHz
`define	SIMCYCLE	100
//	Multibit
`define NBIT		8
//	Fixed-Point Number
`define NBIT_I		8					// Integer Part
`define NBIT_F		8					// Fractional Part
`define NBIT_T		`NBIT_I+`NBIT_F

`include	"mux2_tb.v"
module	mux2_tb;
// --------------------------------------------------
//	Instanciation
// --------------------------------------------------

// --------------------------------------------------
//	Clock
// --------------------------------------------------
	initial					i_clk	= 1'b1   ;
	always	#(500/`CLKFREQ)	i_clk	= ~i_clk ;

// --------------------------------------------------
//	Test Bench
// --------------------------------------------------
	integer		i, j;
	initial begin
		for (i=0; i<`SIMCYCLE; i++) begin
		end
		$finish;
	end

endmodule
