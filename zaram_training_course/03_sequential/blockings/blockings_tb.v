// ==================================================
//	[ VLSISYS Lab. ]
//	* Author		: Woong Choi (woongchoi@sm.ac.kr)
//	* Filename		: blockings_tb.v
//	* Description	: 
// ==================================================

// --------------------------------------------------
//	Define Global Variables
// --------------------------------------------------
`define	CLKFREQ		100		// Clock Freq. (Unit: MHz)
`define	SIMCYCLE	`NVEC	// Sim. Cycles
`define BW_DATA		32		// Bitwidth of ~~
`define BW_ADDR		5		// Bitwidth of ~~
`define BW_CTRL		4		// Bitwidth of ~~
`define NVEC		100		// # of Test Vector

// --------------------------------------------------
//	Includes
// --------------------------------------------------
`include	"blockings.v"

module blockings_tb;
// --------------------------------------------------
//	DUT Signals & Instantiate
// --------------------------------------------------
	wire	o_q_block;
	wire	o_q_nonblock;
	reg		i_d;
	reg		i_clk;

	blocking
	u_blocking(
		.o_q				(o_q_block		),
		.i_d				(i_d			),
		.i_clk				(i_clk			)
	);

	nonblocking
	u_nonblocking(
		.o_q				(o_q_nonblock	),
		.i_d				(i_d			),
		.i_clk				(i_clk			)
	);

// --------------------------------------------------
//	Clock
// --------------------------------------------------
	always	#(500/`CLKFREQ)	i_clk	= ~i_clk;

// --------------------------------------------------
//	Test Stimulus
// --------------------------------------------------
	integer		i, j;
	initial begin
		i_d		= 0;
		i_clk	= 0;
		for (i=0; i<`SIMCYCLE; i++) begin
			j = $urandom_range(0, 10);
			#((0+(j*0.1))*1000/`CLKFREQ);
			i_d = $urandom;
			#((1-(j*0.1))*1000/`CLKFREQ);
		end
		#(1000/`CLKFREQ);
		$finish;
	end

// --------------------------------------------------
//	Dump VCD
// --------------------------------------------------
	reg	[8*32-1:0]	vcd_file;
	initial begin
		if ($value$plusargs("vcd_file=%s", vcd_file)) begin
			$dumpfile(vcd_file);
			$dumpvars;
		end else begin
			$dumpfile("blockings_tb.vcd");
			$dumpvars;
		end
	end

endmodule
