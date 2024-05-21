// ==================================================
//	[ VLSISYS Lab. ]
//	* Author		: Woong Choi (woongchoi@sm.ac.kr)
//	* Filename		: riscv_ctrl.v
//	* Description	: 
// ==================================================

`include	"riscv_ctrl_maindec.v"
`include	"riscv_ctrl_aludec.v"

module riscv_ctrl
(	
	output				o_pc_src,
	output		[1:0]	o_res_src,
	output				o_mem_wr,
	output		[3:0]	o_alu_ctrl,
	output				o_alu_src_a,
	output				o_alu_src_b,
	output		[2:0]	o_imm_src,
	output				o_reg_wr,
	input				i_zero,
	input		[6:0]	i_opcode,
	input		[2:0]	i_funct3,
	input				i_funct7_5b
);

	wire				w_branch      	;
	wire				w_jump        	;
	wire		[1:0]	w_alu_op      	;
	wire				w_opcode_5b   	;
	assign	w_opcode_5b	= i_opcode[5] 	;

	riscv_ctrl_maindec
	u_riscv_ctrl_maindec(
		.o_branch		(w_branch		),
		.o_jump			(w_jump			),
		.o_reg_wr		(o_reg_wr		),
		.o_mem_wr		(o_mem_wr		),
		.o_alu_src_a	(o_alu_src_a	),
		.o_alu_src_b	(o_alu_src_b	),
		.o_res_src		(o_res_src		),
		.o_imm_src		(o_imm_src		),
		.o_alu_op		(w_alu_op		),
		.i_opcode		(i_opcode		)
	);

	riscv_ctrl_aludec
	u_riscv_ctrl_aludec(
		.o_alu_ctrl		(o_alu_ctrl		),
		.i_alu_op		(w_alu_op		),
		.i_funct3		(i_funct3		),
		.i_funct7_5b	(i_funct7_5b	),
		.i_opcode_5b	(w_opcode_5b	)
	);

endmodule
