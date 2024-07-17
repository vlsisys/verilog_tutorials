// ==================================================
//	[ VLSISYS Lab. ]
//	* Author		: Woong Choi (woongchoi@sm.ac.kr)
//	* Filename		: riscv_datapath.v
//	* Description	: 
// ==================================================

`include	"../common/riscv_configs.v"
`include	"../common/riscv_adder.v"
`include	"../common/riscv_alu.v"
`include	"../common/riscv_immext.v"
`include	"../common/riscv_mux.v"
`include	"../common/riscv_regfile.v"
`include	"../common/riscv_register.v"

module riscv_datapath
#(
	parameter	REGISTER_INIT	= 0
)
(	
	output		[`XLEN-1:0]		o_dp_pc,
	output						o_dp_alu_zero,
	output		[`XLEN-1:0]		o_dp_alu_result,
	output		[`XLEN-1:0]		o_dp_dmem_wr_data,

	input		[`XLEN-1:0]		i_dp_dmem_rd_data,
	input		[`XLEN-1:0]		i_dp_instr,
	input		[2:0]			i_dp_src_imm,
	input		[1:0]			i_dp_src_pc,
	input		[1:0]			i_dp_src_rd,
	input						i_dp_src_alu_a,
	input						i_dp_src_alu_b,
	input						i_dp_regfile_wen,
	input		[3:0]			i_dp_alu_ctrl,
	input						i_clk,
	input						i_rstn
);

	riscv_regfile
	u_riscv_regfile(
		.o_regfile_rs1_data	(o_regfile_rs1_data	),
		.o_regfile_rs2_data	(o_regfile_rs2_data	),
		.i_regfile_rs1_addr	(i_regfile_rs1_addr	),
		.i_regfile_rs2_addr	(i_regfile_rs2_addr	),
		.i_regfile_rd_data	(i_regfile_rd_data	),
		.i_regfile_rd_addr	(i_regfile_rd_addr	),
		.i_regfile_rd_wen	(i_regfile_rd_wen	),
		.i_clk				(i_clk				)
	);

	riscv_register
	#(
		.REGISTER_INIT		(REGISTER_INIT		)
	)
	u_riscv_register_pc(
		.o_register_q		(o_register_q		),
		.i_register_d		(i_register_d		),
		.i_register_en		(i_register_en		),
		.i_clk				(i_clk				),
		.i_rstn				(i_rstn				)
	);

	riscv_immext
	u_riscv_immext(
		.o_imm_ext			(o_imm_ext			),
		.i_imm_instr		(i_imm_instr		),
		.i_imm_src			(i_imm_src			)
	);

	riscv_adder
	u_riscv_adder_pc_plus_4(
		.o_adder_sum		(o_adder_sum		),
		.i_adder_a			(i_adder_a			),
		.i_adder_b			(i_adder_b			)
	);

	riscv_adder
	u_riscv_adder_pc_plus_imm(
		.o_adder_sum		(o_adder_sum		),
		.i_adder_a			(i_adder_a			),
		.i_adder_b			(i_adder_b			)
	);

	riscv_alu
	u_riscv_alu(
		.o_alu_result		(o_alu_result		),
		.o_alu_zero			(o_alu_zero			),
		.i_alu_a			(i_alu_a			),
		.i_alu_b			(i_alu_b			),
		.i_alu_ctrl			(i_alu_ctrl			)
	);

endmodule
