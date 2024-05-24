// ==================================================
//	[ VLSISYS Lab. ]
//	* Author		: Woong Choi (woongchoi@sm.ac.kr)
//	* Filename		: riscv_datapath.v
//	* Description	: 
// ==================================================

`include	"riscv_configs.v"
`include	"riscv_mux2.v"
`include	"riscv_dff.v"
`include	"riscv_adder.v"
`include	"riscv_immext.v"

module riscv_datapath
#(	
	parameter	BW_DATA	= 32,
	parameter	BW_ADDR	= 4,
	parameter	BW_CTRL	= 4
)
(	
	output		[BW_DATA-1:0]	o_pc,
	output						o_valid,
	input		[BW_DATA-1:0]	i_instr,
	input		[BW_ADDR-1:0]	i_addr,
	input		[BW_CTRL-1:0]	i_ctrl,
	input		[BW_CTRL-1:0]	i_imm_src,
	input						i_pc_src,
	input						i_clk,
	input						i_rstn
);

	wire	[BW_DATA-1:0]	w_pc_plus_4;
	wire	[BW_DATA-1:0]	w_pc_target;
	wire	[BW_DATA-1:0]	w_pc_next;
	wire	[BW_DATA-1:0]	w_imm_ext;
	wire	[BW_DATA-1:0]	w_alu_a;

	riscv_regfile
	u_riscv_regfile(
		.o_reg_rd_data0	(w_reg_rd_data0	),
		.o_reg_rd_data1	(w_reg_rd_data1	),
		.i_reg_rd_addr0	(i_reg_rd_addr0	),
		.i_reg_rd_addr1	(i_reg_rd_addr1	),
		.i_reg_wr_data	(i_reg_wr_data	),
		.i_reg_wr_addr	(i_reg_wr_addr	),
		.i_reg_wr_en	(i_reg_wr_en	),
		.i_clk			(i_clk			),
		.i_rstn			(i_rstn			)
	);

	wire	[BW_DATA-1:0]	w_alu_b;

	riscv_mux2
	u_riscv_mux2_pc(
		.o_mux_out		(w_pc_next		),
		.i_mux_in0		(w_pc_plus_4	),
		.i_mux_in1		(w_pc_target	),
		.i_mux_sel		(i_pc_src		)
	);

	riscv_dff
	u_riscv_dff(
		.o_dff_q		(o_pc			),
		.i_dff_d		(w_pc_next		),
		.i_clk			(i_clk			),
		.i_rstn			(i_rstn			)
	);

	riscv_adder
	u_riscv_adder_pc_plus_4(
		.o_add_sum		(w_pc_plus_4	),
		.i_add_a		(o_pc			),
		.i_add_b		(4				)
	);

	riscv_immext
	u_riscv_immext(
		.o_imm_ext		(w_imm_ext		),
		.i_imm_instr	(i_instr[31:7]	),
		.i_imm_src		(i_imm_src		)
	);

	riscv_adder
	u_riscv_adder_pc_target(
		.o_add_sum		(w_pc_target	),
		.i_add_a		(o_pc			),
		.i_add_b		(w_imm_ext		)
	);

	riscv_mux2
	u_riscv_mux2_alu_a(
		.o_mux_out		(w_alu_a		),
		.i_mux_in0		(w_pc_plus_4	),
		.i_mux_in1		(w_pc_target	),
		.i_mux_sel		(i_pc_src		)
	);

	riscv_mux2
	u_riscv_mux2_alu_b(
		.o_mux_out		(w_alu_b		),
		.i_mux_in0		(w_pc_plus_4	),
		.i_mux_in1		(w_pc_target	),
		.i_mux_sel		(i_pc_src		)
	);




endmodule

