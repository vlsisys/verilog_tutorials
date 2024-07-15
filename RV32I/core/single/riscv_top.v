// ==================================================
//	[ VLSISYS Lab. ]
//	* Author		: Woong Choi (woongchoi@sm.ac.kr)
//	* Filename		: riscv_top.v
//	* Description	: 
// ==================================================

`ifndef	DELINC
	`include	"riscv_cpu.v"
	`include	"../common/riscv_mem.v"
`endif

module riscv_top
#(	
	parameter	BW_D_IME			= 32,
	parameter	BW_A_IME			= 16,
	parameter	BW_A_DME			= 16,
	parameter	BW_D_REG			= 32,
	parameter	BW_A_REG			= 5,
	parameter	BW_C_ALU			= 4,
	parameter	BW_C_IMM			= 3,
	parameter	BW_C_RES			= 2
)
(	
	output		[BW_A_IME-1:0]		o_riscv_imem_pc,
	output		[BW_D_IME-1:0]		o_riscv_imem_instr,
	output		[BW_A_DME-1:0]		o_riscv_dmem_addr,
	output							o_riscv_dmem_wr_en,
	output		[BW_D_REG-1:0]		o_riscv_dmem_wr_data,
	output		[BW_D_REG-1:0]		o_riscv_dmem_rd_data,
	input							i_clk,
	input							i_rstn
);

	wire		[BW_A_IME-1:0]		w_riscv_imem_pc;
	wire		[BW_A_IME-1:0]		w_riscv_imem_addr;
	wire		[BW_D_IME-1:0]		w_riscv_imem_instr;
	wire		[BW_D_REG-1:0]		w_riscv_dmem_addr;
	wire							w_riscv_dmem_wr_en;
	wire		[BW_D_REG-1:0]		w_riscv_dmem_wr_data;
	wire		[BW_D_REG-1:0]		w_riscv_dmem_rd_data;

	assign	o_riscv_imem_pc			= w_riscv_imem_pc;
	assign	o_riscv_imem_instr		= w_riscv_imem_instr;
	assign	o_riscv_dmem_addr		= w_riscv_dmem_addr;
	assign	o_riscv_dmem_wr_en		= w_riscv_dmem_wr_en;
	assign	o_riscv_dmem_wr_data	= w_riscv_dmem_wr_data;
	assign	o_riscv_dmem_rd_data	= w_riscv_dmem_rd_data;

	riscv_cpu
	#(
		.BW_D_IME			(BW_D_IME				),
		.BW_A_IME			(BW_A_IME				),
		.BW_D_REG			(BW_D_REG				),
		.BW_A_REG			(BW_A_REG				),
		.BW_C_ALU			(BW_C_ALU				),
		.BW_C_IMM			(BW_C_IMM				),
		.BW_C_RES			(BW_C_RES				)
	)
	u_riscv_cpu(
		.o_cpu_imem_pc		(w_riscv_imem_pc		),
		.o_cpu_dmem_addr	(w_riscv_dmem_addr		),
		.o_cpu_dmem_wr_en	(w_riscv_dmem_wr_en		),
		.o_cpu_dmem_wr_data	(w_riscv_dmem_wr_data	),
		.i_cpu_dmem_rd_data	(w_riscv_dmem_rd_data	),
		.i_cpu_imem_instr	(w_riscv_imem_instr		),
		.i_clk				(i_clk					),
		.i_rstn				(i_rstn					)
	);

	riscv_mem
	#(
		.BW_DATA			(BW_D_IME				),
		.BW_ADDR			(BW_A_IME				),
		.INIT_FILE			("riscv_program.mif"	)
	)
	u_riscv_imem(
		.o_mem_data			(w_riscv_imem_instr		),
		.i_mem_data			(32'b0					),
		.i_mem_addr			({2'b0, w_riscv_imem_pc[BW_A_IME-1:2]}	),
		.i_mem_wr_en		(1'b0					),
		.i_clk				(i_clk					)
	);

	riscv_mem
	#(
		.BW_DATA			(BW_D_REG				),
		.BW_ADDR			(BW_A_DME				),
		.INIT_FILE			(""						)
	)
	u_riscv_dmem(
		.o_mem_data			(w_riscv_dmem_rd_data	),
		.i_mem_data			(w_riscv_dmem_wr_data	),
		.i_mem_addr			(w_riscv_dmem_addr		),
		.i_mem_wr_en		(w_riscv_dmem_wr_en		),
		.i_clk				(i_clk					)
	);

endmodule
