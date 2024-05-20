// ==================================================
//	[ VLSISYS Lab. ]
//	* Author		: Woong Choi (woongchoi@sm.ac.kr)
//	* Filename		: riscv_configs.v
//	* Description	: 
// ==================================================

// --------------------------------------------------
//	Immidiate Generate
// --------------------------------------------------
`define	IMM_TYPE_I			3'b000
`define	IMM_TYPE_S			3'b001
`define	IMM_TYPE_B			3'b010
`define	IMM_TYPE_U			3'b011
`define	IMM_TYPE_J			3'b100

// --------------------------------------------------
//	ALU (Arithmetic & Logical Unit)
// --------------------------------------------------
//							{func7[5], func3}
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

// --------------------------------------------------
//	ALUOP
// --------------------------------------------------
`define	ALUOP_LOAD_STORE	2'b00
`define	ALUOP_BRANCH		2'b01
`define	ALUOP_RTYPE_ITYPE	2'b10

// --------------------------------------------------
//	Memory (Instruction / Data)
// --------------------------------------------------
`define	IME_ADDR_BIT		5
`define	DME_ADDR_BIT		32
`define	IME_ADDR_BUS		`IME_ADDR_BIT-1:0
`define	DME_ADDR_BUS		`DME_ADDR_BIT-1:0
`define	IME_INIT_FILE		""
`define	DME_INIT_FILE		""

