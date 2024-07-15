// ==================================================
//	[ VLSISYS Lab. ]
//	* Author		: Woong Choi (woongchoi@sm.ac.kr)
//	* Filename		: riscv_datapath.v
//	* Description	: 
// ==================================================

`ifndef	DELINC
	`include	"../common/riscv_configs.v"
	`include	"../common/riscv_alu.v"
	`include	"../common/riscv_dff.v"
	`include	"../common/riscv_immext.v"
	`include	"../common/riscv_regfile.v"
`endif

module riscv_datapath
#(	
	parameter	BW_D_REG			= 32,
	parameter	BW_A_REG			= 5,
	parameter	BW_C_ALU			= 4,
	parameter	BW_C_IMM			= 3,
	parameter	BW_C_RES			= 2
)
(	
	output		[BW_D_REG-1:0]		o_dp_pc,
	output							o_dp_alu_zero,
	output		[BW_D_REG-1:0]		o_dp_alu_result,
	output		[BW_D_REG-1:0]		o_dp_dmem_wr_data,
	input		[BW_D_REG-1:0]		i_dp_dmem_rd_data,
	input		[BW_D_REG-1:0]		i_dp_instr,
	input							i_dp_src_pc,
	input							i_dp_src_alu_a,
	input							i_dp_src_alu_b,
	input		[BW_C_IMM-1:0]		i_dp_src_imm,
	input		[BW_C_RES-1:0]		i_dp_src_result,
	input							i_dp_reg_wr,
	input		[BW_C_ALU-1:0]		i_dp_alu_ctrl,
	input							i_clk,
	input							i_rstn
);

	wire		[BW_D_REG-1:0]		w_reg_rd_data0;
	wire		[BW_D_REG-1:0]		w_reg_rd_data1;
	wire		[BW_D_REG-1:0]		w_reg_wr_data;
	wire		[BW_D_REG-1:0]		w_alu_a;
	wire		[BW_D_REG-1:0]		w_alu_b;
	wire		[BW_D_REG-1:0]		w_imm_ext;

	wire		[BW_D_REG-1:0]		w_dp_pcnext;
	wire		[BW_D_REG-1:0]		w_dp_pcplus4;
	wire		[BW_D_REG-1:0]		w_dp_pctarget;

	assign	o_dp_dmem_wr_data		= w_reg_rd_data1;

	assign	w_alu_a			= i_dp_src_alu_a ? o_dp_pc       : w_reg_rd_data0 ;
	assign	w_alu_b			= i_dp_src_alu_b ? w_imm_ext     : w_reg_rd_data1 ;

	assign	w_dp_pcnext		= i_dp_src_pc    ? w_dp_pctarget : w_dp_pcplus4   ;
	assign	w_dp_pcplus4	= o_dp_pc + 4                                     ;
	assign	w_dp_pctarget	= o_dp_pc + w_imm_ext                             ;

	assign	w_reg_wr_data	= (i_dp_src_result == 0) ? o_dp_alu_result   :
							  (i_dp_src_result == 1) ? i_dp_dmem_rd_data : w_dp_pcplus4;

	riscv_regfile
	#(
		.BW_DATA			(BW_D_REG		),
		.BW_ADDR			(BW_A_REG		)
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
		.BW_DATA			(BW_D_REG			),
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
		.BW_DATA			(BW_D_REG			),
		.BW_CTRL			(BW_C_IMM			)
	)
	u_riscv_immext(
		.o_imm_ext			(w_imm_ext			),
		.i_imm_instr		(i_dp_instr			),
		.i_imm_src			(i_dp_src_imm		)
	);

	riscv_dff
	#(
		.BW_DATA			(BW_D_REG			)
	)
	u_riscv_dff(
		.o_dff_q			(o_dp_pc			),
		.i_dff_d			(w_dp_pcnext		),
		.i_clk				(i_clk				),
		.i_rstn				(i_rstn				)
	);

endmodule
