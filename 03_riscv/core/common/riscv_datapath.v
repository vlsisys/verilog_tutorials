// ==================================================
//	[ VLSISYS Lab. ]
//	* Author		: Woong Choi (woongchoi@sm.ac.kr)
//	* Filename		: riscv_datapath.v
//	* Description	: 
// ==================================================

`include	"riscv_adder.v"
`include	"riscv_alu.v"
`include	"riscv_configs.v"
`include	"riscv_ctrl.v"
`include	"riscv_dff.v"
`include	"riscv_immext.v"
`include	"riscv_mux2.v"
`include	"riscv_mux3.v"
`include	"riscv_regfile.v"

module riscv_datapath
#(	
	parameter	BW_D_INSTR		= 32,
	parameter	BW_D_REGFILE	= 32,
	parameter	BW_A_REGFILE	= 5,
	parameter	BW_D_ALU		= 32,
	parameter	BW_C_ALU		= 4,
	parameter	BW_D_IMMEXT		= 32,
	parameter	BW_C_IMMEXT		= 3,
	parameter	BW_D_DFF		= 32
)
(	
	output						o_dp_alu_zero,
	output		[BW_D_ALU-1:0]	o_dp_alu_result,
	output		[BW_DATA-1:0]	o_dp_reg_rd_data,
	output		[BW_DATA-1:0]	o_dp_pc,
	input		[BW_DATA-1:0]	i_dp_instr,
	input						i_dp_src_pc,
	input						i_dp_src_alu_a,
	input						i_dp_src_alu_b,
	input		[2:0]			i_dp_src_imm,
	input		[1:0]			i_dp_src_result,
	input						i_dp_reg_wr,
	input		[3:0]			i_dp_alu_ctrl,
	input						i_clk,
	input						i_rstn
);

	wire		[BW_D_REGFILE-1 : 0]	w_reg_rd_data0;
	wire		[BW_D_REGFILE-1 : 0]	w_reg_rd_data1;
	wire		[BW_D_REGFILE-1 : 0]	w_reg_wr_data;
	wire		[BW_D_ALU-1     : 0]	w_alu_a;
	wire		[BW_D_ALU-1     : 0]	w_alu_b;
	wire		[BW_D_IMMEXT-1  : 0]	w_imm_ext;

	assign	o_dp_reg_rd_data	= w_reg_rd_data1;
	assign	o_dp_reg_rd_data	= w_reg_rd_data1;

	assign	w_alu_a				= i_dp_src_alu_a ? o_dp_pc   : w_reg_rd_data0;
	assign	w_alu_b				= i_dp_src_alu_b ? w_imm_ext : w_reg_rd_data1;

	riscv_regfile
	#(
		.BW_DATA			(BW_D_REGFILE		),
		.BW_ADDR			(BW_A_REGFILE		)
	)
	u_riscv_regfile(
		.o_reg_rd_data0		(w_reg_rd_data0		),
		.o_reg_rd_data1		(w_reg_rd_data1		),
		.i_reg_rd_addr0		(i_dp_instr[19:15]	),
		.i_reg_rd_addr1		(i_dp_instr[24:20]	),
		.i_reg_wr_data		(w_reg_wr_data		),
		.i_reg_wr_addr		(i_dp_instr[11:07]	),
		.i_reg_wr_en		(i_dp_reg_wr		),
		.i_clk				(i_clk				),
		.i_rstn				(i_rstn				)
	);

	riscv_alu
	#(
		.BW_DATA			(BW_D_ALU			),
		.BW_CTRL			(BW_C_ALU			)
	)
	u_riscv_alu(
		.o_alu_result		(o_dp_alu_result	),
		.o_alu_zero			(o_dp_alu_zero		),
		.i_alu_a			(w_alu_a			),
		.i_alu_b			(w_alu_b			),
		.i_alu_ctrl			(i_dp_alu_ctrl		)
	);

	riscv_immext
	#(
		.BW_DATA			(BW_D_IMMEXT		),
		.BW_CTRL			(BW_C_IMMEXT		)
	)
	u_riscv_immext(
		.o_imm_ext			(w_imm_ext			),
		.i_imm_instr		(i_dp_instr			),
		.i_imm_src			(i_dp_src_imm		)
	);

	riscv_dff
	#(
		.BW_DATA			(BW_DATA			)
	)
	u_riscv_dff(
		.o_dff_q			(o_dff_q			),
		.i_dff_d			(i_dff_d			),
		.i_clk				(i_clk				),
		.i_rstn				(i_rstn				)
	);


endmodule
