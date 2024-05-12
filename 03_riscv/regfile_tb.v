// ==================================================
//	[ VLSISYS Lab. ]
//	* Author		: Woong Choi (woongchoi@sm.ac.kr)
//	* Filename		: regfile_tb.v
//	* Description	: 
// ==================================================

// --------------------------------------------------
//	Define Global Variables
// --------------------------------------------------
`define	CLKFREQ		100				// Clock Freq. (Unit: MHz)
`define	SIMCYCLE	2**`REG_ADDR_BIT	// Sim. Cycles

`include	"regfile.v"

module	regfile_tb;
// --------------------------------------------------
//	DUT Signals & Instantiate
// --------------------------------------------------

	wire	[`REG_DATA_BUS]	o_rd_data0;
	wire	[`REG_DATA_BUS]	o_rd_data1;
	reg		[`REG_ADDR_BUS]	i_rd_addr0;
	reg		[`REG_ADDR_BUS]	i_rd_addr1;
	reg		[`REG_DATA_BUS]	i_wr_data;
	reg		[`REG_ADDR_BUS]	i_wr_addr;
	reg						i_wr_en;
	reg						i_clk;
	reg						i_rstn;

	regfile
	u_regfile(
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

	task regWR;
		input	[`REG_ADDR_BUS]	ti_wr_addr;
		input	[`REG_DATA_BUS]	ti_wr_data;
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
		input	[`REG_ADDR_BUS]	ti_rd_addr0;
		input	[`REG_ADDR_BUS]	ti_rd_addr1;
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
		resetReleaseAfterNCycles(4);
		for (i=0; i<`SIMCYCLE; i++) begin
			regWR(i, i);
			singleCycle;
		end
		for (i=0; i<`SIMCYCLE; i++) begin
			regRD($urandom_range(0, 31), $urandom_range(0, 31));
			#(1000/`CLKFREQ);
		end
		resetReleaseAfterNCycles(4);
		for (i=0; i<`SIMCYCLE; i++) begin
			regWR(i, $urandom_range(0, 2**31-1));	// 2**32 is not supported
			#(1000/`CLKFREQ);
			regRD(i, i);
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
			for (i=0; i<2**`REG_ADDR_BIT; i++) begin
				$dumpvars(0, u_regfile.reg_arr[i]);
			end
			$dumpvars;
		end else begin
			$dumpfile("regfile_tb.vcd");
			$dumpvars;
		end
	end

endmodule
