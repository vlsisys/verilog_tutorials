// ==================================================
//	[ VLSISYS Lab. ]
//	* Author		: Woong Choi (woongchoi@sm.ac.kr)
//	* Filename		: lfsr_tb.v
//	* Date			: 2024-07-07 19:02:57
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
`include	"lfsr.v"

module lfsr_tb;
// --------------------------------------------------
//	DUT Signals & Instantiate
// --------------------------------------------------

	wire	[7:0]		o_lfsr;
	reg					i_clk;
	reg					i_rstn;

	lfsr
	#(
		.SEED				(1'd1				)
	)
	u_lfsr(
		.o_lfsr				(o_lfsr				),
		.i_clk				(i_clk				),
		.i_rstn				(i_rstn				)
	);

// --------------------------------------------------
//	Clock
// --------------------------------------------------
	always #(500/`CLKFREQ) i_clk = ~i_clk;
// --------------------------------------------------
//	Tasks
// --------------------------------------------------
	task	init;
		begin
			i_clk	= 0;
			i_rstn	= 0;
			#(4*1000/`CLKFREQ);
			i_rstn	= 1;
		end
	endtask
// --------------------------------------------------
//	Test Stimulus
// --------------------------------------------------
	integer		i;
	initial begin
		init();
		for (i=0; i<256; i++) begin
			#(1000/`CLKFREQ);
		end
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
			$dumpfile("lfsr_tb.vcd");
			$dumpvars;
		end
	end

endmodule
