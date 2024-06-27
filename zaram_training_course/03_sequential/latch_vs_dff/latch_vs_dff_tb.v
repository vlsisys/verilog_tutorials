// ==================================================
//	[ VLSISYS Lab. ]
//	* Author		: Woong Choi (woongchoi@sm.ac.kr)
//	* Filename		: latch_vs_dff_tb.v
//	* Date			: 2024-06-24 14:44:58
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
`include	"latch_vs_dff.v"

module latch_vs_dff_tb;
// --------------------------------------------------
//	DUT Signals & Instantiate
// --------------------------------------------------
	wire	o_q_latch;
	wire	o_q_dff;
	reg		i_d;
	reg		i_clk;

	latch
	u_latch(
		.o_q				(o_q_latch			),
		.i_d				(i_d				),
		.i_clk				(i_clk				)
	);

	dff
	u_dff(
		.o_q				(o_q_dff			),
		.i_d				(i_d				),
		.i_clk				(i_clk				)
	);


// --------------------------------------------------
//	Clock
// --------------------------------------------------
	always #(500/`CLKFREQ)	i_clk = ~i_clk;

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
			$dumpfile("latch_vs_dff_tb.vcd");
			$dumpvars;
		end
	end

endmodule
