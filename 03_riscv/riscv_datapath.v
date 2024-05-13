// ==================================================
//	[ VLSISYS Lab. ]
//	* Author		: Woong Choi (woongchoi@sm.ac.kr)
//	* Filename		: riscv_datapath.v
//	* Description	: 
// ==================================================

`include	"riscv_params.v"

module riscv_datapath
(	
	output	[`DFF_DATA_BUS]		o_pc,
	input						i_pc_src,
	input						i_clk,
	input						i_rstn
);

	wire	[`MUX_DATA_BUS]		pc_next;
	wire	[`MUX_DATA_BUS]		pc_plus4;
	wire	[`MUX_DATA_BUS]		pc_target;
	wire	[`IMEM_DATA_BUS]	instr;
	// ----------------------------------------
	//	PC Logic
	// ----------------------------------------
	riscv_mux2
	u_riscv_mux2_pc(
		.o_mux_out		(pc_next		),
		.i_mux_in0		(pc_plus4		),
		.i_mux_in1		(pc_target		),
		.i_mux_sel		(i_pc_src		)
	);

	riscv_dff
	u_riscv_dff_pc(
		.o_dff_q		(o_pc			),
		.i_dff_d		(pc_next		),
		.i_clk			(i_clk			),
		.i_rstn			(i_rstn			)
	);

	riscv_add
	u_riscv_add_pc4(
		.o_add_sum		(pc_plus4		),
		.i_add_a		(o_pc			),
		.i_add_b		(i_add_b		)
	);

	riscv_add
	u_riscv_add_pc_branch(
		.o_add_sum		(o_add_sum		),
		.i_add_a		(i_add_a		),
		.i_add_b		(i_add_b		)
	);

	// ----------------------------------------
	//	Register File Logic
	// ----------------------------------------
	riscv_regfile
	u_riscv_regfile(
		.o_reg_rd_data0	(o_reg_rd_data0	),
		.o_reg_rd_data1	(o_reg_rd_data1	),
		.i_reg_rd_addr0	(i_reg_rd_addr0	),
		.i_reg_rd_addr1	(i_reg_rd_addr1	),
		.i_reg_wr_data	(i_reg_wr_data	),
		.i_reg_wr_addr	(i_reg_wr_addr	),
		.i_reg_wr_en	(i_reg_wr_en	),
		.i_clk			(i_clk			),
		.i_rstn			(i_rstn			)
	);

	riscv_immgen
	u_riscv_immgen(
		.o_imm_ext		(o_imm_ext		),
		.i_imm_instr	(i_imm_instr	),
		.i_imm_type		(i_imm_type		)
	);

	// ----------------------------------------
	//	ALU Logic
	// ----------------------------------------
	riscv_alu
	u_riscv_alu(
		.o_alu_result	(o_alu_result	),
		.o_alu_zero		(o_alu_zero		),
		.i_alu_ctrl		(i_alu_ctrl		),
		.i_alu_a		(i_alu_a		),
		.i_alu_b		(i_alu_b		)
	);

	riscv_mux2
	u_riscv_mux2_alu(
		.o_mux_out		(o_mux_out		),
		.i_mux_in0		(i_mux_in0		),
		.i_mux_in1		(i_mux_in1		),
		.i_mux_sel		(i_mux_sel		)
	);

	riscv_mux3
	u_riscv_mux3(
		.o_mux_out		(o_mux_out		),
		.i_mux_in0		(i_mux_in0		),
		.i_mux_in1		(i_mux_in1		),
		.i_mux_in2		(i_mux_in2		),
		.i_mux_sel		(i_mux_sel		)
	);

endmodule
