// ==================================================
//	[ VLSISYS Lab. ]
//	* Author		: Woong Choi (woongchoi@sm.ac.kr)
//	* Filename		: riscv.v
//	* Description	: Single Cycle RISC-V Processor
//		- ALUreg	: 10 OPs
//		- ALUimm	: 09 OPs
//		- Jump		: 02 OPs (JAL/JALR)
//		- Branch	: 06 OPs (BEQ, BNE, BLT, BGE, BLTU, BGEU)
//		- LUI		: 01 OPs
//		- AUIPC		: 01 OPs 
//		- LOAD		: 05 OPs (LB, LH, LW, LBU, LHU)
//		- STORE		: 03 OPs (SB, SH, SW)
// ==================================================

module	riscv
(	
	output reg	[ 31:0]		o_out,
	output reg				o_valid,
	input		[ 31:0]		i_in,
	input					i_clk,
	input					i_rstn
);

//	wire	[`MEM_DATA_BUS]		o_data;
//	reg		[`MEM_DATA_BUS]		i_data;
//	reg		[`MEM_ADDR_BUS]		i_addr;
//	reg							i_wr_en;
//	reg							i_clk;

	memory
	#(
		.MEM_INIT_FILE	("memory.init"	)
	)
	i_memory(
		.o_data			(o_data			),
		.i_data			(i_data			),
		.i_addr			(i_addr			),
		.i_wr_en		(i_wr_en		),
		.i_clk			(i_clk			)
	);

//	wire	[`REG_DATA_BUS]	o_rd_data0;
//	wire	[`REG_DATA_BUS]	o_rd_data1;
//	reg		[`REG_ADDR_BUS]	i_rd_addr0;
//	reg		[`REG_ADDR_BUS]	i_rd_addr1;
//	reg		[`REG_DATA_BUS]	i_wr_data;
//	reg		[`REG_ADDR_BUS]	i_wr_addr;
//	reg						i_wr_en;
//	reg						i_clk;
//	reg						i_rstn;

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

//	wire	[`ALU_DATA_BUS]		o_result;
//	wire						o_zero;
//	reg		[4:0]				i_shamt;
//	reg		[2:0]				i_func3;
//	reg		[6:0]				i_func7;
//	reg		[6:0]				i_opcode;
//	reg		[`ALU_DATA_BUS]		i_src_reg_a;
//	reg		[`ALU_DATA_BUS]		i_src_reg_b;
//	reg		[`ALU_DATA_BUS]		i_src_imm;

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

	memory
	#(
		.MEM_INIT_FILE	(				)
	)
	d_memory(
		.o_data			(o_data			),
		.i_data			(i_data			),
		.i_addr			(i_addr			),
		.i_wr_en		(i_wr_en		),
		.i_clk			(i_clk			)
	);


endmodule
