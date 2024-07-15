// ==================================================
//	[ VLSISYS Lab. ]
//	* Author		: Woong Choi (woongchoi@sm.ac.kr)
//	* Filename		: riscv_regfile_tb.v
//	* Description	: 
// ==================================================

// --------------------------------------------------
//	Define Global Variables
// --------------------------------------------------
`define	CLKFREQ		100				// Clock Freq. (Unit: MHz)
`define	SIMCYCLE	2**BW_ADDR		// Sim. Cycles

`include	"riscv_regfile.v"

module	riscv_regfile_tb;
// --------------------------------------------------
//	DUT Signals & Instantiate
// --------------------------------------------------

	localparam	BW_DATA			= 32;
	localparam	BW_ADDR			= 4;

	wire	[BW_DATA-1:0]	o_reg_rd_data0;
	wire	[BW_DATA-1:0]	o_reg_rd_data1;
	reg		[BW_ADDR-1:0]	i_reg_rd_addr0;
	reg		[BW_ADDR-1:0]	i_reg_rd_addr1;
	reg		[BW_DATA-1:0]	i_reg_wr_data;
	reg		[BW_ADDR-1:0]	i_reg_wr_addr;
	reg						i_reg_wr_en;
	reg						i_clk;
	reg						i_rstn;

	riscv_regfile
	#(
		.BW_DATA			(BW_DATA			),
		.BW_ADDR			(BW_ADDR			)
	)
	u_riscv_regfile(
		.o_reg_rd_data0		(o_reg_rd_data0		),
		.o_reg_rd_data1		(o_reg_rd_data1		),
		.i_reg_rd_addr0		(i_reg_rd_addr0		),
		.i_reg_rd_addr1		(i_reg_rd_addr1		),
		.i_reg_wr_data		(i_reg_wr_data		),
		.i_reg_wr_addr		(i_reg_wr_addr		),
		.i_reg_wr_en		(i_reg_wr_en		),
		.i_clk				(i_clk				),
		.i_rstn				(i_rstn				)
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
			i_reg_rd_addr0		= 0;
			i_reg_rd_addr1		= 0;
			i_reg_wr_data		= 0;
			i_reg_wr_addr		= 0;
			i_reg_wr_en			= 0;
			i_clk				= 0;
			i_rstn				= 0;
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
		input	[BW_ADDR-1:0]	ti_reg_wr_addr;
		input	[BW_DATA-1:0]	ti_reg_wr_data;
		begin
			taskState	= "WR";
			@(negedge i_clk) begin
			//	$display ("==================================================");
				$display ("%8g Write (%d) @ #(%d) of ResisterFile", $time, ti_reg_wr_data, ti_reg_wr_addr);
				i_reg_wr_data	= ti_reg_wr_data;
				i_reg_wr_addr	= ti_reg_wr_addr;
				i_reg_wr_en		= 1;
			end
		end
	endtask

	task regRD;
		input	[BW_ADDR-1:0]	ti_reg_rd_addr0;
		input	[BW_DATA-1:0]	ti_reg_rd_addr1;
		begin
			taskState	= "RD";
			@(negedge i_clk) begin
				i_reg_rd_addr0	= ti_reg_rd_addr0;
				i_reg_rd_addr1	= ti_reg_rd_addr1;
				i_reg_wr_en		= 0;
			end
			@(posedge i_clk) begin
//				$display ("==================================================");
				$display ("%8g  Read (%d) @ #(%d) of ResisterFile", $time, o_reg_rd_data0, i_reg_rd_addr0);
				$display ("%8g  Read (%d) @ #(%d) of ResisterFile", $time, o_reg_rd_data1, i_reg_rd_addr1);
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
			for (i=0; i<2**BW_ADDR; i++) begin
				$dumpvars(0, u_riscv_regfile.reg_arr[i]);
			end
			$dumpvars;
		end else begin
			$dumpfile("regfile_tb.vcd");
			$dumpvars;
		end
	end

endmodule
