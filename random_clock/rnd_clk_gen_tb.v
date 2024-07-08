// ==================================================
//	[ VLSISYS Lab. ]
//	* Author		: Woong Choi (woongchoi@sm.ac.kr)
//	* Filename		: rnd_clk_gen_tb.v
//	* Date			: 2024-07-07 19:15:04
//	* Description	: 
// ==================================================

// --------------------------------------------------
//	Define Global Variables
// --------------------------------------------------
`define	CLKFREQ		100		// Clock Freq. (Unit: MHz)
`define	SIMCYCLE	`NVEC	// Sim. Cycles
`define NVEC		1500		// # of Test Vector

// --------------------------------------------------
//	Includes
// --------------------------------------------------
`include	"rnd_clk_gen.v"

module rnd_clk_gen_tb;
// --------------------------------------------------
//	DUT Signals & Instantiate
// --------------------------------------------------
	wire				o_rnd_clk;
	reg					i_clk;
	reg					i_rstn;

	rand_clk_gen
	#(
		.SEED				(1					)
	)
	u_rand_clk_gen(
		.o_rnd_clk			(o_rnd_clk			),
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
	integer		i, j;
	initial begin
		init();

		for (i=0; i<`SIMCYCLE; i++) begin
			$display("IDX[%3d] - LFSR3: %b(%d), LFSR8: %b(%d)", i,
														u_rand_clk_gen.lfsr3, u_rand_clk_gen.lfsr3, 
														u_rand_clk_gen.lfsr8, u_rand_clk_gen.lfsr8
													);
			#(1000/`CLKFREQ);
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
			$dumpfile("rnd_clk_gen_tb.vcd");
			$dumpvars;
		end
	end

endmodule
