	wire	[BW_D_REG-1:0]		o_dp_pc;
	wire						o_dp_alu_zero;
	wire	[BW_D_REG-1:0]		o_dp_alu_result;
	wire	[BW_D_REG-1:0]		o_dp_dmem_wr_data;
	reg		[BW_D_REG-1:0]		i_dp_dmem_rd_data;
	reg		[BW_D_REG-1:0]		i_dp_instr;
	reg							i_dp_src_pc;
	reg							i_dp_src_alu_a;
	reg							i_dp_src_alu_b;
	reg		[BW_C_IMM-1:0]		i_dp_src_imm;
	reg		[BW_C_RES-1:0]		i_dp_src_result;
	reg							i_dp_reg_wr;
	reg		[BW_C_ALU-1:0]		i_dp_alu_ctrl;
	reg							i_clk;
	reg							i_rstn;

	riscv_datapath
	#(
		.BW_D_REG			(BW_D_REG			),
		.BW_A_REG			(BW_A_REG			),
		.BW_C_ALU			(BW_C_ALU			),
		.BW_C_IMM			(BW_C_IMM			),
		.BW_C_RES			(BW_C_RES			)
	)
	u_riscv_datapath(
		.o_dp_pc			(o_dp_pc			),
		.o_dp_alu_zero		(o_dp_alu_zero		),
		.o_dp_alu_result	(o_dp_alu_result	),
		.o_dp_dmem_wr_data	(o_dp_dmem_wr_data	),
		.i_dp_dmem_rd_data	(i_dp_dmem_rd_data	),
		.i_dp_instr			(i_dp_instr			),
		.i_dp_src_pc		(i_dp_src_pc		),
		.i_dp_src_alu_a		(i_dp_src_alu_a		),
		.i_dp_src_alu_b		(i_dp_src_alu_b		),
		.i_dp_src_imm		(i_dp_src_imm		),
		.i_dp_src_result	(i_dp_src_result	),
		.i_dp_reg_wr		(i_dp_reg_wr		),
		.i_dp_alu_ctrl		(i_dp_alu_ctrl		),
		.i_clk				(i_clk				),
		.i_rstn				(i_rstn				)
	);


