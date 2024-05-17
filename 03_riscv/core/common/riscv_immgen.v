// ==================================================
//	[ VLSISYS Lab. ]
//	* Author		: Woong Choi (woongchoi@sm.ac.kr)
//	* Filename		: riscv_immgen.v
//	* Description	: 
// ==================================================

`include	"riscv_configs.v"

module riscv_immgen
#(
	parameter	BW_DATA	= 32
)
(	
	output reg	[BW_DATA-1:0]		o_imm_ext,
	input		[BW_DATA-1:0]		i_imm_instr,
	input		[2:0]				i_imm_type
);

	always @(*) begin
		case(i_imm_type) 
			`IMM_TYPE_I	:	o_imm_ext	= {{20{i_imm_instr[31   ]}}, i_imm_instr[31:20]													};  
			`IMM_TYPE_S	:	o_imm_ext	= {{20{i_imm_instr[31   ]}}, i_imm_instr[31:25], i_imm_instr[11: 7]								}; 
			`IMM_TYPE_B	:	o_imm_ext	= {{20{i_imm_instr[31   ]}}, i_imm_instr[7    ], i_imm_instr[30:25], i_imm_instr[11: 8], 1'b0	}; 
			`IMM_TYPE_U	:	o_imm_ext	= {    i_imm_instr[31:12]  , 12'b0																}; 
			`IMM_TYPE_J	:	o_imm_ext	= {{12{i_imm_instr[31   ]}}, i_imm_instr[19:12], i_imm_instr[20   ], i_imm_instr[30:21], 1'b0	}; 
			default		:	o_imm_ext	= {BW_DATA{1'bx}};
		endcase             
	end

    // Immediate format
    //       31.............30........20.19........12.11.....11.10.........5.4..........1.0.....0
    // I = { {21{inst[31]}},                                     inst[30:25], inst[24:20]         };
    // S = { {21{inst[31]}},                                     inst[30:25], inst[11:7]          };
    // B = { {20{inst[31]}}, inst[7],                            inst[30:25], inst[11:8],   1'b0  };
    // U = { {1{inst[31]}},  inst[30:20], inst[19:12],                                      12'b0 };
    // J = { {12{inst[31]}},              inst[19:12], inst[20], inst[30:25], inst[24:21],  1'b0  };

    //always_comb begin
    //    immediate = 32'b0;
    //    case (inst[6:0]) // Opcode
    //        `OPCODE_LOAD,
    //        `OPCODE_LOAD_FP,
    //        `OPCODE_OP_IMM,
    //        `OPCODE_JALR:   // I-type immediate
    //            immediate = { {21{inst[31]}}, inst[30:25], inst[24:20] };
    //        `OPCODE_STORE_FP,
    //        `OPCODE_STORE:  // S-type immediate
    //            immediate = { {21{inst[31]}}, inst[30:25], inst[11:7] };
    //        `OPCODE_BRANCH: // B-type immediate
    //            immediate = { {20{inst[31]}}, inst[7], inst[30:25], inst[11:8], 1'b0 };
    //        `OPCODE_AUIPC,
    //        `OPCODE_LUI:    // U-type immediate
    //            immediate = { {1{inst[31]}}, inst[30:20], inst[19:12], 12'b0 };
    //        `OPCODE_JAL:    // J-type immediate
    //            immediate = { {12{inst[31]}}, inst[19:12], inst[20], inst[30:25], inst[24:21], 1'b0 };
    //        default: immediate = 32'b0;
    //    endcase
    //end

endmodule
