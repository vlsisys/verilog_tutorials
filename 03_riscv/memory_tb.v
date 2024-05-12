// ==================================================
//	[ VLSISYS Lab. ]
//	* Author		: Woong Choi (woongchoi@sm.ac.kr)
//	* Filename		: memory_tb.v
//	* Description	: 
// ==================================================

// --------------------------------------------------
//	Define Global Variables
// --------------------------------------------------
`define	CLKFREQ		100		// Clock Freq. (Unit: MHz)
`define	SIMCYCLE	2**`MEM_ADDR_BIT

`include	"params.v"
`include	"memory.v"

module	memory_tb;
// --------------------------------------------------
//	DUT Signals & Instantiate
// --------------------------------------------------
	wire	[`MEM_DATA_BUS]	o_data;
	reg		[`MEM_DATA_BUS]	i_data;
	reg		[`MEM_ADDR_BUS]	i_addr;
	reg						i_wr_en;
	reg						i_clk;

	memory
	#(
		.MEM_INIT_FILE	("memory.init"	)
	)
	u_memory(
		.o_data			(o_data			),
		.i_data			(i_data			),
		.i_addr			(i_addr			),
		.i_wr_en		(i_wr_en		),
		.i_clk			(i_clk			)
	);
// --------------------------------------------------
//	Clock
// --------------------------------------------------
	always	#(500/`CLKFREQ)	i_clk = ~i_clk;

// --------------------------------------------------
//	Tasks
// --------------------------------------------------
	task init;
		begin
			i_data	= 0;
			i_addr	= 0;
			i_wr_en	= 0;
			i_clk	= 0;
		end
	endtask

	reg		[4*32-1:0] taskState;	// Length is limitted to 32

	task memWR;
		input	[`REG_ADDR_BUS]	ti_addr;
		input	[`REG_DATA_BUS]	ti_data;
		begin
			taskState	= "WR";
			@(negedge i_clk) begin
			//	$display ("==================================================");
				$display ("%8g Write (%d) @ #(%d) of ResisterFile", $time, ti_data, ti_addr);
				i_data	= ti_data;
				i_addr	= ti_addr;
				i_wr_en	= 1;
			end
		end
	endtask

	task memRD;
		input	[`REG_ADDR_BUS]	ti_addr;
		begin
			taskState	= "RD";
			@(negedge i_clk) begin
				i_addr	= ti_addr;
				i_wr_en	= 0;
			end
			@(posedge i_clk) begin
//				$display ("==================================================");
				$display ("%8g  Read (%d) @ #(%d) of ResisterFile", $time, o_data, i_addr);
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

		memRD(0);
		#(1000/`CLKFREQ);
		memRD(1);
		#(1000/`CLKFREQ);
		memRD(2);
		#(1000/`CLKFREQ);
		memRD(3);
		#(1000/`CLKFREQ);
		memRD(4);
		#(1000/`CLKFREQ);
		for (i=0; i<`SIMCYCLE; i++) begin
			memWR(i, i);
			#(1000/`CLKFREQ);
		end
		for (i=0; i<`SIMCYCLE; i++) begin
			memRD(i);
			#(1000/`CLKFREQ);
		end
		for (i=0; i<`SIMCYCLE; i++) begin
			memWR(i, $urandom_range(0, 2**31-1));
			#(1000/`CLKFREQ);
			memRD(i);
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
			$dumpfile("memory_tb.vcd");
			$dumpvars;
		end
	end

endmodule
