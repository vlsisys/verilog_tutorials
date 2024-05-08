// ==================================================
//	[ VLSISYS Lab. ]
//	* Author		: Woong Choi (woongchoi@sm.ac.kr)
//	* Filename		: regfile_2r1w_tb.v
//	* Description	: 
// ==================================================

// --------------------------------------------------
//	Define Global Variables
// --------------------------------------------------
`define	CLKFREQ			100		// Clock Freq. (Unit: MHz)
`define	SIMCYCLE		32		// Sim. Cycles
`define BW				32		// Total BitWidth
`define DEBUG_REGFILE	1

`include	"regfile_2r1w.v"

module	regfile_2r1w_tb;
// --------------------------------------------------
//	DUT Signals & Instantiate
// --------------------------------------------------

	wire	[`BW-1         : 0]		o_rd_data0;
	wire	[`BW-1         : 0]		o_rd_data1;
	reg		[$clog2(`BW)-1 : 0]		i_rd_addr0;
	reg		[$clog2(`BW)-1 : 0]		i_rd_addr1;
	reg		[`BW-1         : 0]		i_wr_data;
	reg		[$clog2(`BW)-1 : 0]		i_wr_addr;
	reg								i_wr_en;
	reg								i_clk;
	reg								i_rstn;

	regfile_2r1w
	#(
		.BW				(`BW			)
	)
	u_regfile_2r1w(
		.o_rd_data0		(o_rd_data0		),
		.o_rd_data1		(o_rd_data1		),
		.i_rd_addr0		(i_rd_addr0		),
		.i_rd_addr1		(i_rd_addr1		),
		.i_wr_data		(i_wr_data		),
		.i_wr_addr		(i_wr_addr		),
		.i_wr_en		(i_wr_en		),
		.i_clk			(i_clk			),
		.i_rstn			(i_rstn			)
	);
// --------------------------------------------------
//	Clock
// --------------------------------------------------
	always	#(500/`CLKFREQ)	i_clk = ~i_clk;

// --------------------------------------------------
//	Tasks
// --------------------------------------------------
	reg		[4*32-1:0] taskState;	// Length is limitted to 32
	task init;
		begin
			taskState	= "Init";
			i_rd_addr0	= 0;
			i_rd_addr1	= 0;
			i_wr_data	= 0;
			i_wr_addr	= 0;
			i_wr_en		= 0;
			i_clk		= 0;
			i_rstn		= 0;
		end
	endtask

	task resetReleaseAfterNCycles;
		input	[  9:0]		n;
		begin
			taskState	= "Reset";
			i_rstn = 1'b0;
			#(n*1000/`CLKFREQ);
			i_rstn = 1'b1;
		end
	endtask

	task singleCycle;
		begin
			#(1000/`CLKFREQ);
		end
	endtask

	task regWR;
		input	[$clog2(`BW)-1 : 0]	ti_wr_addr;
		input	[`BW-1         : 0]	ti_wr_data;
		begin
			taskState	= "WR";
			@(negedge i_clk) begin
			//	$display ("==================================================");
				$display ("%8g Write (%d) @ #(%d) of ResisterFile", $time, ti_wr_data, ti_wr_addr);
				i_wr_data	= ti_wr_data;
				i_wr_addr	= ti_wr_addr;
				i_wr_en		= 1;
			end
		end
	endtask

	task regRD;
		input	[$clog2(`BW)-1 : 0]	ti_rd_addr0;
		input	[$clog2(`BW)-1 : 0]	ti_rd_addr1;
		begin
			taskState	= "RD";
			@(negedge i_clk) begin
				i_rd_addr0	= ti_rd_addr0;
				i_rd_addr1	= ti_rd_addr1;
				i_wr_en		= 0;
			end
			@(posedge i_clk) begin
//				$display ("==================================================");
				$display ("%8g  Read (%d) @ #(%d) of ResisterFile", $time, o_rd_data0, i_rd_addr0);
				$display ("%8g  Read (%d) @ #(%d) of ResisterFile", $time, o_rd_data1, i_rd_addr1);
			end
		end
	endtask

// --------------------------------------------------
//	Test Stimulus
// --------------------------------------------------
	integer		i, j, k, n;
	initial begin
		init();
		resetReleaseAfterNCycles(4);
		for (i=0; i<`SIMCYCLE; i++) begin
			regWR(i, i);
			singleCycle;
		end
		for (i=0; i<`SIMCYCLE; i++) begin
			regRD($urandom_range(0, 2**($clog2(`BW)-1)), $urandom_range(0, 2**($clog2(`BW)-1)));
			singleCycle;
		end
		resetReleaseAfterNCycles(4);
		for (i=0; i<`SIMCYCLE; i++) begin
			regWR(i, $urandom_range(0, 2**31-1));	// 2**32 is not supported
			singleCycle;
			regRD(i, i);
			singleCycle;
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
			for (i=0; i<32; i++) begin
				$dumpvars(0, u_regfile_2r1w.reg_q[i]);
			end
			$dumpvars;
		end else begin
			$dumpfile("regfile_2r1w_tb.vcd");
			$dumpvars;
		end
	end

endmodule
