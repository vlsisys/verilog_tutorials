// ==================================================
//	[ VLSISYS Lab. ]
//	* Author		: Woong Choi (woongchoi@sm.ac.kr)
//	* Filename		: riscv_ctrl.v
//	* Description	: 
// ==================================================

module riscv_ctrl
#(	
	parameter	BW_CTRL	= 4
)
(	
	output						o_pc_src,
	output		[1:0]			o_result_src,
	output						o_mem_wr,
	output						o_alu_src,
	output		[1:0]			o_imm_src,
	output						o_reg_wr,
	output		[3:0]			o_alu_ctrl,
	input						i_zero,
	input		[6:0]			i_opcode
);
	wire			jump;
	wire			branch;
	wire			alu_op;
	reg		[10:0]	controls;
	assign	{	o_pc_src,
				o_result_src,
				o_mem_wr,
				o_alu_src,
				o_imm_src,
				o_reg_wr,
				o_alu_op


	always @(*) begin
		case (i_opcode)
			`OPCODE_LUI:	
			
			
		endcase
	end

endmodule
