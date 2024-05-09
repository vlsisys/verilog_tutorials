// ==================================================
//	[ VLSISYS Lab. ]
//	* Author		: Woong Choi (woongchoi@sm.ac.kr)
//	* Filename		: alu_tb.v
//	* Description	: 
// ==================================================

// --------------------------------------------------
//	Define Global Variables
// --------------------------------------------------
`define	CLKFREQ		100		// Clock Freq. (Unit: MHz)
`define	SIMCYCLE	10		// Sim. Cycles
`define BW			32		// Total BitWidth

`include	"alu.v"

module	alu_tb;
// --------------------------------------------------
//	DUT Signals & Instantiate
// --------------------------------------------------

	wire	[`BW-1:0]	o_alu_result;
	wire				o_alu_zero;
	reg		[3:0]		i_alu_op;
	reg		[`BW-1:0]	i_alu_a;
	reg		[`BW-1:0]	i_alu_b;

	alu
	#(
		.BW				(32				)
	)
	u_alu(
		.o_alu_result	(o_alu_result	),
		.o_alu_zero		(o_alu_zero		),
		.i_alu_op		(i_alu_op		),
		.i_alu_a		(i_alu_a		),
		.i_alu_b		(i_alu_b		)
	);

// --------------------------------------------------
//	Tasks
// --------------------------------------------------
	reg		[4*32-1:0] taskState;	// Length is limitted to 32

	task init;
		begin
			i_alu_op	= 0;
			i_alu_a		= 0;
			i_alu_b		= 0;
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
			i_alu_op	= $urandom_range(0, 2**4-1);
			i_alu_a		= $urandom_range(0, 2**31-1);
			i_alu_b		= $urandom_range(0, 2**31-1);
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
			$dumpfile("alu_tb.vcd");
			$dumpvars;
		end
	end

endmodule
