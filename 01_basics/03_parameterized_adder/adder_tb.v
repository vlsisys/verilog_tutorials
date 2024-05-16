// ==================================================
//	[ VLSISYS Lab. ]
//	* Author		: Woong Choi (woongchoi@sm.ac.kr)
//	* Filename		: adder_tb.v
//	* Description	: 
// ==================================================

// --------------------------------------------------
//	Define Global Variables
// --------------------------------------------------
`define	CLKFREQ		100		// Clock Freq. (Unit: MHz)
`define	SIMCYCLE	10		// Sim. Cycles
`define BW_DATA		4	

// --------------------------------------------------
//	Includes
// --------------------------------------------------
`include	"adder.v"

module	adder_tb;
// --------------------------------------------------
//	DUT Signals & Instantiate
// --------------------------------------------------

	output 	[`BW_DATA-1:0]	o_s;
	output 	 				o_c;
	reg		[`BW_DATA-1:0]	i_a;
	reg		[`BW_DATA-1:0]	i_b;
	reg						i_c;

	adder
	#(
		.BW_DATA		(`BW_DATA		)
	)
	u_adder(
		.o_s			(o_s			),
		.o_c			(o_c			),
		.i_a			(i_a			),
		.i_b			(i_b			),
		.i_c			(i_c			)
	);

// --------------------------------------------------
//	Tasks
// --------------------------------------------------
	reg		[4*32-1:0] taskState;	// Length is limitted to 32

	task init;
		begin
			i_a				= 0;
			i_b				= 0;
			i_c				= 0;
		end
	endtask

	task singleCycle;
		begin
			#(1000/`CLKFREQ);
		end
	endtask

// --------------------------------------------------
//	Test Stimulus
// --------------------------------------------------
	integer		i, j;
	initial begin
		init();

		for (i=0; i<`SIMCYCLE; i++) begin
			i_a	= $random;
			i_b	= $random;
			i_c	= $random;
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
			$dumpfile("adder_tb.vcd");
			$dumpvars;
		end
	end

endmodule
