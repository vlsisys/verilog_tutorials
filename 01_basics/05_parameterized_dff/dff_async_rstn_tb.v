// ==================================================
//	[ VLSISYS Lab. ]
//	* Filename		: dff_async_rstn_tb.v
//	* Author		: Woong Choi (woongchoi@sm.ac.kr)
//	* Description	: 
// ==================================================

// --------------------------------------------------
//	Define Global Variables
// --------------------------------------------------
`define	CLKFREQ		100		// Clock Freq. (Unit: MHz)
`define	SIMCYCLE	20		// Sim. Cycles
`define NBIT		8		// Total BitWidth

`include	"dff_async_rstn.v"

module	dff_async_rstn_tb;
// --------------------------------------------------
//	DUT Signals & Instantiate
// --------------------------------------------------
	wire	[`NBIT-1:0]		o_q;
	reg		[`NBIT-1:0]		i_d;
	reg						i_clk;
	reg						i_rstn;

	dff_async_rstn
	#(
		.NBIT			(`NBIT			)
	)
	u_dff_async_rstn(
		.o_q			(o_q			),
		.i_d			(i_d			),
		.i_clk			(i_clk			),
		.i_rstn			(i_rstn			)
	);

	task init;
		begin
			i_d		= 0;
			i_clk	= 0;
			i_rstn	= 0;
		end
	endtask

// --------------------------------------------------
//	Clock
// --------------------------------------------------
	always	#(500/`CLKFREQ)	i_clk = ~i_clk;

// --------------------------------------------------
//	Tasks
// --------------------------------------------------
	task resetReleaseAfterNCycles;
		input	[  9:0]		n;
		begin
			#(n*1000/`CLKFREQ);
			i_rstn = 1'b1;
		end
	endtask

// --------------------------------------------------
//	Test Stimulus
// --------------------------------------------------
	integer		i, j, k, n;
	initial begin
		init();
		resetReleaseAfterNCycles(10);
		for (i=0; i<`SIMCYCLE; i++) begin
			i_d	= $urandom_range(0, 2**`NBIT-1);
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
			$dumpfile("dff_async_rstn_tb.vcd");
			$dumpvars;
		end
	end

endmodule
