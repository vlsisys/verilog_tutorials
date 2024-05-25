// ==================================================
//	[ VLSISYS Lab. ]
//	* Author		: Woong Choi (woongchoi@sm.ac.kr)
//	* Filename		: riscv_datapath.v
//	* Description	: 
// ==================================================

`include	"riscv_configs.v"
`include	"riscv_regfile.v"
`include	"riscv_alu.v"
`include	"riscv_immext.v"
`include	"riscv_mux2.v"
`include	"riscv_mux3.v"
`include	"riscv_dff.v"
`include	"riscv_adder.v"

module riscv_datapath
#(	
	parameter	BW_D_INSTR				= 32,
	parameter	BW_D_REG				= 32,
	parameter	BW_A_REG				= 5,
	parameter	BW_D_IMMEXT				= 32,
	parameter	BW_C_IMMEXT				= 3,
	parameter	BW_D_ALU				= 32,
	parameter	BW_C_ALU				= 4,
	parameter	BW_D_ADDER				= 32
)
(	
	output								o_alu_zero,
	output		[BW_D_ALU-1		:0]		o_alu_result,
	output		[BW_D_REG-1		:0]		o_reg_rd_data1,
	input		[BW_D_INSTR-1	:0]		i_instr,
	input			 					i_reg_wr_en,
	input		[BW_C_IMMEXT-1	:0]		i_imm_src,
	input		[BW_C_ALU-1		:0]		i_alu_ctrl,
	input								i_clk,
	input								i_rstn
);

	wire		[BW_D_REG-1		:0]		w_reg_rd_data0;
	wire		[BW_D_REG-1		:0]		w_reg_rd_data1;
	wire		[BW_D_REG-1		:0]		w_reg_wr_data;
	wire		[BW_D_IMMEXT-1	:0]		w_imm_ext;

	wire		[BW_D_ALU-1		:0]		w_alu_result;
	wire		[BW_D_ALU-1		:0]		w_alu_a;
	wire		[BW_D_ALU-1		:0]		w_alu_b;

	riscv_regfile
	#(
		.BW_DATA			(BW_D_REG			),
		.BW_ADDR			(BW_A_REG			)
	)
	u_riscv_regfile(
		.o_reg_rd_data0		(w_reg_rd_data0		),
		.o_reg_rd_data1		(w_reg_rd_data1		),
		.i_reg_rd_addr0		(i_instr[19:15]		),
		.i_reg_rd_addr1		(i_instr[24:20]		),
		.i_reg_wr_data		(w_reg_wr_data		),
		.i_reg_wr_addr		(i_instr[11:07]		),
		.i_reg_wr_en		(i_reg_wr_en		),
		.i_clk				(i_clk				),
		.i_rstn				(i_rstn				)
	);

	riscv_immext
	#(
		.BW_DATA			(BW_D_IMMEXT		),
		.BW_CTRL			(BW_C_IMMEXT		)
	)
	u_riscv_immext(
		.o_imm_ext			(w_imm_ext			),
		.i_imm_instr		(i_instr			),
		.i_imm_src			(i_imm_src			)
	);

	riscv_alu
	#(
		.BW_DATA			(BW_D_ALU			),
		.BW_CTRL			(BW_C_ALU			)
	)
	u_riscv_alu(
		.o_alu_result		(w_alu_result		),
		.o_alu_zero			(o_alu_zero			),
		.i_alu_a			(w_alu_a			),
		.i_alu_b			(w_alu_b			),
		.i_alu_ctrl			(i_alu_ctrl			)
	);




endmodule
