// ==================================================
//	[ VLSISYS Lab. ]
//	* Filename		: adder_tb.v
//	* Author		: Woong Choi (woongchoi@sm.ac.kr)
//	* Description	: 
//		- Key Points
//			1. 
//			2. 
// ==================================================

// --------------------------------------------------
//	Define Global Variables
// --------------------------------------------------
`define	CLKFREQ		100		// Unit: MHz
`define	SIMCYCLE	10
`define NBIT		8

`include	"adder.v"

module	adder_tb;
// --------------------------------------------------
//	DUT Signals & Instantiate
// --------------------------------------------------
	wire 	[`NBIT-1:0]		o_s;
	wire 	 				o_c;
	reg		[`NBIT-1:0]		i_a;
	reg		[`NBIT-1:0]		i_b;
	reg						i_c;

	adder
	#(
		.NBIT		(`NBIT		)
	)
	u_adder
	(
		.o_s		(o_s		),
		.o_c		(o_c		),
		.i_a		(i_a		),
		.i_b		(i_b		),
		.i_c		(i_c		)
	);

// --------------------------------------------------
//	Test Stimulus
// --------------------------------------------------
	integer		i, j, k, n;
	initial begin
		for (i=0; i<`SIMCYCLE; i++) begin
			i_a = $urandom_range(0, 2**`NBIT-1);
			i_b = $urandom_range(0, 2**`NBIT-1);
			i_c = $urandom_range(0, 1);
			#(1000/`CLKFREQ);
		end
		$finish;
	end

	reg	[8*32-1:0]	vcd_file;
	initial begin
		if ($value$plusargs("vcd_file=%s", vcd_file)) begin
			$dumpfile(vcd_file);
			$dumpvars;
		end else begin
			$dumpfile("adder_tb.vcd");
			$dumpvars;
		end
	end

endmodule
