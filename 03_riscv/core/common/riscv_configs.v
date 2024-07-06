// ==================================================
//	[ VLSISYS Lab. ]
//	* Author		: Woong Choi (woongchoi@sm.ac.kr)
//	* Filename		: riscv_configs.v
//	* Description	: 
// ==================================================

`define	BUS_32BIT			31:0
// --------------------------------------------------
// Instruction opcodes
// --------------------------------------------------
`define	OPCODE_LUI			7'b0110111	//	U-Type, x[rd] = sext(imm[31:12] << 12)
`define	OPCODE_AUIPC		7'b0010111	//	U-Type, x[rd] = pc + sext(imm[31:12] << 12)
`define	OPCODE_JAL			7'b1101111	//	J-Type, x[rd] = pc + 4; pc += sext(offset)
`define	OPCODE_JALR			7'b1100111	//	J-Type, x[rd] = pc + 4; pc = (x[rs1] + sext(offset)) & ~1
`define	OPCODE_BRANCH		7'b1100011	//	B-Type, if (rs1 'op' rs2) pc += sext(offset)
`define	OPCODE_LOAD			7'b0000011	//	I-Type, x[rd] = sext(M[x[rs1] + sext(offset)][31:0])
`define	OPCODE_STORE		7'b0100011	//	S-Type, M[x[rs1] + sext(offset)] = x[rs2][31:0]
`define	OPCODE_OP_IMM		7'b0010011	//	I-Type, x[rd] = x[rs1] 'op' sext(imm)
`define	OPCODE_OP			7'b0110011	//	R-Type, x[rd] = x[rd] = x[rs1] 'op' x[rs2]
`define	OPCODE_FENCE		7'b0001111	//	I-Type, 
`define	OPCODE_SYSTEM		7'b1110011	//	I-Type, 

// --------------------------------------------------
// Result Source (Register Write Data)
// --------------------------------------------------
`define	RES_SRC_ALU   		2'b00		//	From ALU
`define	RES_SRC_DME   		2'b01		//	From Data Memory
`define	RES_SRC_PC4			2'b10		//	From PC + 4
`define	RES_SRC_NOP			2'b11		//	Don't Care

// --------------------------------------------------
//	Immidiate Generate
// --------------------------------------------------
`define	INSTR_R_TYPE		3'b000
`define	INSTR_I_TYPE		3'b001
`define	INSTR_S_TYPE		3'b010
`define	INSTR_B_TYPE		3'b011
`define	INSTR_U_TYPE		3'b100
`define	INSTR_J_TYPE		3'b101

// --------------------------------------------------
//	ALU (Arithmetic & Logical Unit)
// --------------------------------------------------
//							{funct7[5], funct3}
`define	ALU_CTRL_ADD		4'b0000
`define	ALU_CTRL_SUB		4'b1000
`define	ALU_CTRL_SLL		4'b0001	// Shift Left Logical
`define	ALU_CTRL_SLT		4'b0010	// Set on Less Than
`define	ALU_CTRL_SLTU		4'b0011	// Set on Less Than Unsigned
`define	ALU_CTRL_XOR		4'b0100
`define	ALU_CTRL_SRL		4'b0101	// Shift Right Logical / Arithmetic
`define	ALU_CTRL_SRA		4'b1101	// Shift Right Logical / Arithmetic
`define	ALU_CTRL_OR			4'b0110
`define	ALU_CTRL_AND		4'b0111
`define	ALU_CTRL_NOP		4'b1111

// --------------------------------------------------
//	ALUOP
// --------------------------------------------------
`define	ALUOP_AUIPC_LOAD_STORE	3'b000
`define	ALUOP_BRANCH			3'b001
`define	ALUOP_RTYPE				3'b010
`define	ALUOP_ITYPE				3'b011
`define	ALUOP_NOP				3'b100

// --------------------------------------------------
//	Memory (Instruction / Data)
// --------------------------------------------------
`define	IME_ADDR_BIT		5
`define	DME_ADDR_BIT		32
`define	IME_ADDR_BUS		`IME_ADDR_BIT-1:0
`define	DME_ADDR_BUS		`DME_ADDR_BIT-1:0
`define	IME_INIT_FILE		""
`define	DME_INIT_FILE		""

