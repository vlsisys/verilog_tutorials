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

// --------------------------------------------------
//	Includes
// --------------------------------------------------
`include	"alu.v"

module	alu_tb;
// --------------------------------------------------
//	DUT Signals & Instantiate
// --------------------------------------------------
		wire	[`ALU_DATA_BUS]		o_result;
		wire						o_zero;
		reg		[4:0]				i_shamt;
		reg		[2:0]				i_func3;
		reg		[6:0]				i_func7;
		reg		[6:0]				i_opcode;
		reg		[`ALU_DATA_BUS]		i_src_reg_a;
		reg		[`ALU_DATA_BUS]		i_src_reg_b;
		reg		[`ALU_DATA_BUS]		i_src_imm;

		alu
		u_alu(
			.o_result		(o_result		),
			.o_zero			(o_zero			),
			.i_shamt		(i_shamt		),
			.i_func3		(i_func3		),
			.i_func7		(i_func7		),
			.i_opcode		(i_opcode		),
			.i_src_reg_a	(i_src_reg_a	),
			.i_src_reg_b	(i_src_reg_b	),
			.i_src_imm		(i_src_imm		)
		);

// --------------------------------------------------
//	Tasks
// --------------------------------------------------
	reg		[4*32-1:0] taskState;	// Length is limitted to 32

	task init;
		begin
			i_shamt     = 0;
			i_func3     = 0;
			i_func7     = 0;
			i_opcode    = 0;
			i_src_reg_a = 0;
			i_src_reg_b = 0;
			i_src_imm   = 0;
		end
	endtask

	task ADDI;
		begin
			taskState	= "ADDI";
			//i_shamt		= $urandom_range(0, 2**5-1);
			i_func3		= `ALU_FN3_ADDSUB;
			i_func7		= `ALU_FN7_ADD;
			i_opcode	= `ALU_OPC_IMM;
			i_src_reg_a	= $urandom_range(0, 2**31-1);
			//i_src_reg_b	= $urandom_range(0, 2**31-1);
			i_src_imm	= $urandom_range(0, 2**31-1);
		end
	endtask

	task SLTI;
		begin
			taskState	= "SLTI";
			//i_shamt		= $urandom_range(0, 2**5-1);
			i_func3		= `ALU_FN3_SLT;
			//i_func7		= `ALU_FN7_ADD;
			i_opcode	= `ALU_OPC_IMM;
			i_src_reg_a	= $urandom_range(0, 2**31-1);
			//i_src_reg_b	= $urandom_range(0, 2**31-1);
			i_src_imm	= $urandom_range(0, 2**31-1);
		end
	endtask

	task SLTIU;
		begin
			taskState	= "SLTIU";
			//i_shamt		= $urandom_range(0, 2**5-1);
			i_func3		= `ALU_FN3_SLTU;
			//i_func7		= `ALU_FN7_ADD;
			i_opcode	= `ALU_OPC_IMM;
			i_src_reg_a	= $urandom_range(0, 2**31-1);
			//i_src_reg_b	= $urandom_range(0, 2**31-1);
			i_src_imm	= $urandom_range(0, 2**31-1);
		end
	endtask

	task XORI;
		begin
			taskState	= "XORI";
			//i_shamt		= $urandom_range(0, 2**5-1);
			i_func3		= `ALU_FN3_XOR;
			//i_func7		= `ALU_FN7_ADD;
			i_opcode	= `ALU_OPC_IMM;
			i_src_reg_a	= $urandom_range(0, 2**31-1);
			//i_src_reg_b	= $urandom_range(0, 2**31-1);
			i_src_imm	= $urandom_range(0, 2**31-1);
		end
	endtask

	task ORI;
		begin
			taskState	= "ORI";
			//i_shamt		= $urandom_range(0, 2**5-1);
			i_func3		= `ALU_FN3_OR;
			//i_func7		= `ALU_FN7_ADD;
			i_opcode	= `ALU_OPC_IMM;
			i_src_reg_a	= $urandom_range(0, 2**31-1);
			//i_src_reg_b	= $urandom_range(0, 2**31-1);
			i_src_imm	= $urandom_range(0, 2**31-1);
		end
	endtask

	task ANDI;
		begin
			taskState	= "ANDI";
			//i_shamt		= $urandom_range(0, 2**5-1);
			i_func3		= `ALU_FN3_AND;
			//i_func7		= `ALU_FN7_ADD;
			i_opcode	= `ALU_OPC_IMM;
			i_src_reg_a	= $urandom_range(0, 2**31-1);
			//i_src_reg_b	= $urandom_range(0, 2**31-1);
			i_src_imm	= $urandom_range(0, 2**31-1);
		end
	endtask

	task SLLI;
		begin
			taskState	= "SLLI";
			i_shamt		= $urandom_range(0, 2**5-1);
			i_func3		= `ALU_FN3_SLL;
			//i_func7		= `ALU_FN7_ADD;
			i_opcode	= `ALU_OPC_IMM;
			i_src_reg_a	= $urandom_range(0, 2**31-1);
			//i_src_reg_b	= $urandom_range(0, 2**31-1);
			//i_src_imm	= $urandom_range(0, 2**31-1);
		end
	endtask

	task SRLI;
		begin
			taskState	= "SRLI";
			i_shamt		= $urandom_range(0, 2**5-1);
			i_func3		= `ALU_FN3_SRLSRA;
			i_func7		= `ALU_FN7_SRL;
			i_opcode	= `ALU_OPC_IMM;
			i_src_reg_a	= $urandom_range(0, 2**31-1);
			//i_src_reg_b	= $urandom_range(0, 2**31-1);
			//i_src_imm	= $urandom_range(0, 2**31-1);
		end
	endtask

	task SRAI;
		begin
			taskState	= "SRAI";
			i_shamt		= $urandom_range(0, 2**5-1);
			i_func3		= `ALU_FN3_SRLSRA;
			i_func7		= `ALU_FN7_SRA;
			i_opcode	= `ALU_OPC_IMM;
			i_src_reg_a	= $urandom_range(0, 2**31-1);
			//i_src_reg_b	= $urandom_range(0, 2**31-1);
			//i_src_imm	= $urandom_range(0, 2**31-1);
		end
	endtask

	task ADD;
		begin
			taskState	= "ADD";
			//i_shamt		= $urandom_range(0, 2**5-1);
			i_func3		= `ALU_FN3_ADDSUB;
			i_func7		= `ALU_FN7_ADD;
			i_opcode	= `ALU_OPC_REG;
			i_src_reg_a	= $urandom_range(0, 2**31-1);
			i_src_reg_b	= $urandom_range(0, 2**31-1);
			//i_src_imm	= $urandom_range(0, 2**31-1);
		end
	endtask

	task SUB;
		begin
			taskState	= "SUB";
			//i_shamt		= $urandom_range(0, 2**5-1);
			i_func3		= `ALU_FN3_ADDSUB;
			i_func7		= `ALU_FN7_SUB;
			i_opcode	= `ALU_OPC_REG;
			i_src_reg_a	= $urandom_range(0, 2**31-1);
			i_src_reg_b	= $urandom_range(0, 2**31-1);
			//i_src_imm	= $urandom_range(0, 2**31-1);
		end
	endtask

	task SLL;
		begin
			taskState	= "SLL";
			i_shamt		= $urandom_range(0, 2**5-1);
			i_func3		= `ALU_FN3_SLL;
			//i_func7		= `ALU_FN7_SUB;
			i_opcode	= `ALU_OPC_REG;
			i_src_reg_a	= $urandom_range(0, 2**31-1);
			//i_src_reg_b	= $urandom_range(0, 2**31-1);
			//i_src_imm	= $urandom_range(0, 2**31-1);
		end
	endtask

	task SLT;
		begin
			taskState	= "SLT";
			//i_shamt		= $urandom_range(0, 2**5-1);
			i_func3		= `ALU_FN3_SLT;
			//i_func7		= `ALU_FN7_SUB;
			i_opcode	= `ALU_OPC_REG;
			i_src_reg_a	= $urandom_range(0, 2**31-1);
			i_src_reg_b	= $urandom_range(0, 2**31-1);
			//i_src_imm	= $urandom_range(0, 2**31-1);
		end
	endtask

	task SLTU;
		begin
			taskState	= "SLTU";
			//i_shamt		= $urandom_range(0, 2**5-1);
			i_func3		= `ALU_FN3_SLTU;
			//i_func7		= `ALU_FN7_SUB;
			i_opcode	= `ALU_OPC_REG;
			i_src_reg_a	= $urandom_range(0, 2**31-1);
			i_src_reg_b	= $urandom_range(0, 2**31-1);
			//i_src_imm	= $urandom_range(0, 2**31-1);
		end
	endtask

	task XOR;
		begin
			taskState	= "XOR";
			//i_shamt		= $urandom_range(0, 2**5-1);
			i_func3		= `ALU_FN3_XOR;
			//i_func7		= `ALU_FN7_SUB;
			i_opcode	= `ALU_OPC_REG;
			i_src_reg_a	= $urandom_range(0, 2**31-1);
			i_src_reg_b	= $urandom_range(0, 2**31-1);
			//i_src_imm	= $urandom_range(0, 2**31-1);
		end
	endtask

	task SRL;
		begin
			taskState	= "SRL";
			i_shamt		= $urandom_range(0, 2**5-1);
			i_func3		= `ALU_FN3_SRLSRA;
			i_func7		= `ALU_FN7_SRL;
			i_opcode	= `ALU_OPC_REG;
			i_src_reg_a	= $urandom_range(0, 2**31-1);
			//i_src_reg_b	= $urandom_range(0, 2**31-1);
			//i_src_imm	= $urandom_range(0, 2**31-1);
		end
	endtask

	task SRA;
		begin
			taskState	= "SRA";
			i_shamt		= $urandom_range(0, 2**5-1);
			i_func3		= `ALU_FN3_SRLSRA;
			i_func7		= `ALU_FN7_SRA;
			i_opcode	= `ALU_OPC_REG;
			i_src_reg_a	= $urandom_range(0, 2**31-1);
			//i_src_reg_b	= $urandom_range(0, 2**31-1);
			//i_src_imm	= $urandom_range(0, 2**31-1);
		end
	endtask

	task OR;
		begin
			taskState	= "OR";
			//i_shamt		= $urandom_range(0, 2**5-1);
			i_func3		= `ALU_FN3_OR;
			//i_func7		= `ALU_FN7_SRA;
			i_opcode	= `ALU_OPC_REG;
			i_src_reg_a	= $urandom_range(0, 2**31-1);
			i_src_reg_b	= $urandom_range(0, 2**31-1);
			//i_src_imm	= $urandom_range(0, 2**31-1);
		end
	endtask

	task AND;
		begin
			taskState	= "AND";
			//i_shamt		= $urandom_range(0, 2**5-1);
			i_func3		= `ALU_FN3_AND;
			//i_func7		= `ALU_FN7_SRA;
			i_opcode	= `ALU_OPC_REG;
			i_src_reg_a	= $urandom_range(0, 2**31-1);
			i_src_reg_b	= $urandom_range(0, 2**31-1);
			//i_src_imm	= $urandom_range(0, 2**31-1);
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
			//#(1000/`CLKFREQ)	ADDI;
			#(1000/`CLKFREQ)	SLTI;
			//#(1000/`CLKFREQ)	SLTIU;
			//#(1000/`CLKFREQ)	XORI;
			//#(1000/`CLKFREQ)	ORI;
			//#(1000/`CLKFREQ)	ANDI;
			//#(1000/`CLKFREQ)	SLLI;
			//#(1000/`CLKFREQ)	SRLI;
			//#(1000/`CLKFREQ)	SRAI;
			//#(1000/`CLKFREQ)	ADD;
			//#(1000/`CLKFREQ)	SUB;
			//#(1000/`CLKFREQ)	SLL;
			//#(1000/`CLKFREQ)	SLT;
			//#(1000/`CLKFREQ)	SLTU;
			//#(1000/`CLKFREQ)	XOR;
			//#(1000/`CLKFREQ)	SRL;
			//#(1000/`CLKFREQ)	SRA;
			//#(1000/`CLKFREQ)	OR;
			//#(1000/`CLKFREQ)	AND;
		end
//		for (i=0; i<`SIMCYCLE; i++) begin
//			#(1000/`CLKFREQ)	ADDI;
//			#(1000/`CLKFREQ)	SLTI;
//			#(1000/`CLKFREQ)	SLTIU;
//			#(1000/`CLKFREQ)	XORI;
//			#(1000/`CLKFREQ)	ORI;
//			#(1000/`CLKFREQ)	ANDI;
//			#(1000/`CLKFREQ)	SLLI;
//			#(1000/`CLKFREQ)	SRLI;
//			#(1000/`CLKFREQ)	SRAI;
//			#(1000/`CLKFREQ)	ADD;
//			#(1000/`CLKFREQ)	SUB;
//			#(1000/`CLKFREQ)	SLL;
//			#(1000/`CLKFREQ)	SLT;
//			#(1000/`CLKFREQ)	SLTU;
//			#(1000/`CLKFREQ)	XOR;
//			#(1000/`CLKFREQ)	SRL;
//			#(1000/`CLKFREQ)	SRA;
//			#(1000/`CLKFREQ)	OR;
//			#(1000/`CLKFREQ)	AND;
//		end
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
