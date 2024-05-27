// ==================================================
//	[ VLSISYS Lab. ]
//	* Author		: Woong Choi (woongchoi@sm.ac.kr)
//	* Filename		: riscv_top.v
//	* Description	: 
// ==================================================

`include	"riscv_cpu.v"

module riscv_top
#(	
	parameter	BW_D_INSTR			= 32,
	parameter	BW_A_INSTR			= 32,
	parameter	BW_D_RFILE			= 32,
	parameter	BW_A_RFILE			= 5,
	parameter	BW_C_ALU			= 4,
	parameter	BW_C_IMM			= 3,
	parameter	BW_C_RES			= 2
)
(	
	output		[BW_A_INSTR-1:0]	o_riscv_imem_addr,
	output		[BW_D_RFILE-1:0]	o_riscv_dmem_addr,
	output							o_riscv_dmem_wr_en,
	output		[BW_D_RFILE-1:0]	o_riscv_dmem_wr_data,
	input		[BW_D_RFILE-1:0]	i_riscv_dmem_rd_data,
	input		[BW_D_INSTR-1:0]	i_riscv_imem_instr,
	input							i_clk,
	input							i_rstn
);

	wire		[BW_A_INSTR-1:0]	w_riscv_imem_addr;
	wire		[BW_D_INSTR-1:0]	w_riscv_imem_instr;
	wire		[BW_D_RFILE-1:0]	o_riscv_dmem_addr;
	wire							o_riscv_dmem_wr_en;
	wire		[BW_D_RFILE-1:0]	o_riscv_dmem_wr_data;
	wire		[BW_D_RFILE-1:0]	i_riscv_dmem_rd_data;

	wire		[BW_D_INSTR-1:0]	o_imem_data;
	wire		[BW_D_INSTR-1:0]	i_imem_data;
	wire		[BW_A_INSTR-1:0]	i_imem_addr;
	wire							i_imem_wr_en;

	wire		[BW_D_RFILE-1:0]	o_dmem_data;
	wire		[BW_D_RFILE-1:0]	i_dmem_data;
	wire		[BW_A_RFILE-1:0]	i_dmem_addr;
	wire							i_dmem_wr_en;

	riscv_cpu
	#(
		.BW_D_INSTR			(BW_D_INSTR			),
		.BW_A_INSTR			(BW_A_INSTR			),
		.BW_D_RFILE			(BW_D_RFILE			),
		.BW_A_RFILE			(BW_A_RFILE			),
		.BW_C_ALU			(BW_C_ALU			),
		.BW_C_IMM			(BW_C_IMM			),
		.BW_C_RES			(BW_C_RES			)
	)
	u_riscv_cpu(
		.o_cpu_imem_addr	(o_cpu_imem_addr	),
		.o_cpu_dmem_addr	(o_cpu_dmem_addr	),
		.o_cpu_dmem_wr_en	(o_cpu_dmem_wr_en	),
		.o_cpu_dmem_wr_data	(o_cpu_dmem_wr_data	),
		.i_cpu_dmem_rd_data	(i_cpu_dmem_rd_data	),
		.i_cpu_imem_instr	(i_cpu_imem_instr	),
		.i_clk				(i_clk				),
		.i_rstn				(i_rstn				)
	);

	riscv_imem
	#(
		.BW_DATA			(BW_D_INSTR			),
		.BW_ADDR			(BW_A_INSTR			)
	)
	u_riscv_imem(
		.o_mem_data			(o_mem_data			),
		.i_mem_data			(i_mem_data			),
		.i_mem_addr			(i_mem_addr			),
		.i_mem_wr_en		(i_mem_wr_en		),
		.i_clk				(i_clk				)
	);

	riscv_dmem
	#(
		.BW_DATA			(BW_DATA			),
		.BW_ADDR			(BW_ADDR			)
	)
	u_riscv_dmem(
		.o_mem_data			(o_mem_data			),
		.i_mem_data			(i_mem_data			),
		.i_mem_addr			(i_mem_addr			),
		.i_mem_wr_en		(i_mem_wr_en		),
		.i_clk				(i_clk				)
	);



endmodule
