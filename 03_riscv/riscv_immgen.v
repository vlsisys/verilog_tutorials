// ==================================================
//	[ VLSISYS Lab. ]
//	* Author		: Woong Choi (woongchoi@sm.ac.kr)
//	* Filename		: riscv_immgen.v
//	* Description	: 
// ==================================================

`include	"riscv_params.v"

module riscv_immgen
(	
	output reg	[`IMM_DATA_BUS]		o_imm_ext,
	input		[`IMM_INST_BUS]		i_imm_instr,
	input							i_imm_type
);

	always @(*) begin
		case(i_imm_type) 
			`IMM_TYPE_I	:	o_imm_ext	= {{20{i_imm_instr[31   ]}}, i_imm_instr[31:20]													};  
			`IMM_TYPE_S	:	o_imm_ext	= {{20{i_imm_instr[31   ]}}, i_imm_instr[31:25], i_imm_instr[11: 7]								}; 
			`IMM_TYPE_B	:	o_imm_ext	= {{20{i_imm_instr[31   ]}}, i_imm_instr[7    ], i_imm_instr[30:25], i_imm_instr[11: 8], 1'b0	}; 
			`IMM_TYPE_U	:	o_imm_ext	= {    i_imm_instr[31:12]  , 12'b0																}; 
			`IMM_TYPE_J	:	o_imm_ext	= {{12{i_imm_instr[31   ]}}, i_imm_instr[19:12], i_imm_instr[20   ], i_imm_instr[30:21], 1'b0	}; 
			default		:	o_imm_ext	= {`IMM_DATA_BIT{1'bx}};
		endcase             
	end

endmodule
