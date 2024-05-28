// ==================================================
//	[ VLSISYS Lab. ]
//	* Author		: Woong Choi (woongchoi@sm.ac.kr)
//	* Filename		: riscv_top_tb.v
//	* Description	: 
// ==================================================

// --------------------------------------------------
//	Define Global Variables
// --------------------------------------------------
`define	CLKFREQ		100		// Clock Freq. (Unit: MHz)
`define	SIMCYCLE	`NVEC	// Sim. Cycles
`define NVEC		100		// # of Test Vector

`define	BW_D_INSTR	32
`define	BW_A_INSTR	32
`define	BW_D_RFILE	32
`define	BW_A_RFILE	5
`define	BW_C_ALU	4
`define	BW_C_IMM	3
`define	BW_C_RES	2

// --------------------------------------------------
//	Includes
// --------------------------------------------------
`include	"riscv_top.v"

module riscv_top_tb;
// --------------------------------------------------
//	DUT Signals & Instantiate
// --------------------------------------------------
	wire	[`BW_A_INSTR-1:0]	o_riscv_imem_pc;
	wire	[`BW_A_INSTR-1:0]	o_riscv_imem_instr;
	wire	[`BW_D_RFILE-1:0]	o_riscv_dmem_addr;
	wire	    				o_riscv_dmem_wr_en;
	wire	[`BW_D_RFILE-1:0]	o_riscv_dmem_wr_data;
	wire	[`BW_D_RFILE-1:0]	o_riscv_dmem_rd_data;
	reg							i_clk;
	reg							i_rstn;

	riscv_top
	#(
		.BW_D_INSTR				(`BW_D_INSTR			),
		.BW_A_INSTR				(`BW_A_INSTR			),
		.BW_D_RFILE				(`BW_D_RFILE			),
		.BW_A_RFILE				(`BW_A_RFILE			),
		.BW_C_ALU				(`BW_C_ALU				),
		.BW_C_IMM				(`BW_C_IMM				),
		.BW_C_RES				(`BW_C_RES				)
	)
	u_riscv_top(
		.o_riscv_imem_pc		(o_riscv_imem_pc		),
		.o_riscv_imem_instr		(o_riscv_imem_instr		),
		.o_riscv_dmem_addr		(o_riscv_dmem_addr		),
		.o_riscv_dmem_wr_en		(o_riscv_dmem_wr_en		),
		.o_riscv_dmem_wr_data	(o_riscv_dmem_wr_data	),
		.o_riscv_dmem_rd_data	(o_riscv_dmem_rd_data	),
		.i_clk					(i_clk					),
		.i_rstn					(i_rstn					)
	);

// --------------------------------------------------
//	Clock
// --------------------------------------------------
	always	#(500/`CLKFREQ)		i_clk = ~i_clk;


// --------------------------------------------------
//	Tasks
// --------------------------------------------------
	reg		[4*32-1:0]	taskState;
	integer				err	= 0;

	task init;
		begin
			taskState		= "Init";
			i_clk				= 0;
			i_rstn				= 0;
		end
	endtask

	task resetNCycle;
		input	[9:0]	i;
		begin
			taskState		= "Reset";
			i_rstn	= 1'b0;
			#(i*1000/`CLKFREQ);
			i_rstn	= 1'b1;
		end
	endtask

// --------------------------------------------------
//	Test Stimulus
// --------------------------------------------------
	integer		i, j;
	initial begin
		init();
		resetNCycle(4);

		for (i=0; i<`SIMCYCLE; i++) begin
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
//			for (i=0; i<32; i++) begin
//				$dumpvars(0, u_riscv_top.u_riscv_imem.mem_arr[i]);
//			end
			$dumpvars;
		end else begin
			$dumpfile("riscv_top_tb.vcd");
			$dumpvars;
		end
	end

endmodule
