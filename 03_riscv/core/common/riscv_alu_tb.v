// ==================================================
//	[ VLSISYS Lab. ]
//	* Author		: Woong Choi (woongchoi@sm.ac.kr)
//	* Filename		: riscv_alu_tb.v
//	* Description	: 
// ==================================================

// --------------------------------------------------
//	Define Global Variables
// --------------------------------------------------
`define	CLKFREQ		100		// Clock Freq. (Unit: MHz)
`define	SIMCYCLE	16		// Sim. Cycles
`define	DELINC
// --------------------------------------------------
//	Includes
// --------------------------------------------------
`include	"riscv_configs.v"
`include	"riscv_alu.v"

module	riscv_alu_tb;
// --------------------------------------------------
//	DUT Signals & Instantiate
// --------------------------------------------------
	localparam	BW_DATA			= 32;
	localparam	BW_CTRL			= 4;

	wire	[BW_DATA-1:0]		o_alu_result;
	wire						o_alu_zero;
	reg		[BW_DATA-1:0]		i_alu_a;
	reg		[BW_DATA-1:0]		i_alu_b;
	reg		[BW_CTRL-1:0]		i_alu_ctrl;

	riscv_alu
	#(
		.BW_DATA			(BW_DATA			),
		.BW_CTRL			(BW_CTRL			)
	)
	u_riscv_alu(
		.o_alu_result		(o_alu_result		),
		.o_alu_zero			(o_alu_zero			),
		.i_alu_a			(i_alu_a			),
		.i_alu_b			(i_alu_b			),
		.i_alu_ctrl			(i_alu_ctrl			)
	);
// --------------------------------------------------
//	Tasks
// --------------------------------------------------
	reg		[4*32-1:0] taskState;	// Length is limitted to 32

	task init;
		begin
			i_alu_a			= 0;
			i_alu_b			= 0;
			i_alu_ctrl		= 0;
		end
	endtask

	task ADD;
		begin
			taskState	= "ADD";
			i_alu_ctrl	= `ALU_CTRL_ADD;
			i_alu_a		= $urandom;
			i_alu_b		= $urandom;
		end
	endtask

	task SUB;
		begin
			taskState	= "SUB";
			i_alu_ctrl	= `ALU_CTRL_SUB;
			i_alu_a		= $urandom;
			i_alu_b		= $urandom;
		end
	endtask

	task SLL;
		begin
			taskState	= "SLL";
			i_alu_ctrl	= `ALU_CTRL_SLL;
			i_alu_a		= $urandom;
			i_alu_b		= $urandom;
		end
	endtask

	task SLT;
		begin
			taskState	= "SLT";
			i_alu_ctrl	= `ALU_CTRL_SLT;
			i_alu_a		= $urandom;
			i_alu_b		= $urandom;
		end
	endtask

	task SLTU;
		begin
			taskState	= "SLTU";
			i_alu_ctrl	= `ALU_CTRL_SLTU;
			i_alu_a		= $urandom;
			i_alu_b		= $urandom;
		end
	endtask

	task XOR;
		begin
			taskState	= "XOR";
			i_alu_ctrl	= `ALU_CTRL_XOR;
			i_alu_a		= $urandom;
			i_alu_b		= $urandom;
		end
	endtask

	task SRL;
		begin
			taskState	= "SRL";
			i_alu_ctrl	= `ALU_CTRL_SRL;
			i_alu_a		= $urandom;
			i_alu_b		= $urandom;
		end
	endtask

	task SRA;
		begin
			taskState	= "SRA";
			i_alu_ctrl	= `ALU_CTRL_SRA;
			i_alu_a		= $urandom;
			i_alu_b		= $urandom;
		end
	endtask

	task OR;
		begin
			taskState	= "OR";
			i_alu_ctrl	= `ALU_CTRL_OR;
			i_alu_a		= $urandom;
			i_alu_b		= $urandom;
		end
	endtask

	task AND;
		begin
			taskState	= "AND";
			i_alu_ctrl	= `ALU_CTRL_AND;
			i_alu_a		= $urandom;
			i_alu_b		= $urandom;
		end
	endtask

// --------------------------------------------------
//	Test Stimulus
// --------------------------------------------------
	integer		i, j;
	initial begin
		init();
		#(4*1000/`CLKFREQ);

		for (i=0; i<`SIMCYCLE; i++) begin
//			#(1000/`CLKFREQ)	ADD;
//			#(1000/`CLKFREQ)	SUB;
//			#(1000/`CLKFREQ)	SLL;
//			#(1000/`CLKFREQ)	SLT;
			#(1000/`CLKFREQ)	SLTU;
//			#(1000/`CLKFREQ)	XOR;
//			#(1000/`CLKFREQ)	SRL;
//			#(1000/`CLKFREQ)	SRA;
//			#(1000/`CLKFREQ)	OR;
//			#(1000/`CLKFREQ)	AND;
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
