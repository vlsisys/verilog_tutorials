// ==================================================
//	[ VLSISYS Lab. ]
//	* Author		: Woong Choi (woongchoi@sm.ac.kr)
//	* Filename		: params.v
//	* Description	: 
// ==================================================

// --------------------------------------------------
//	Register File
// --------------------------------------------------
`define	REG_DATA_BIT		32
`define	REG_ADDR_BIT		5
`define	REG_DATA_BUS		`REG_DATA_BIT-1:0
`define	REG_ADDR_BUS		`REG_ADDR_BIT-1:0

// --------------------------------------------------
//	Memory (Instruction/Data)
// --------------------------------------------------
`define	MEM_DATA_BIT		32
`define	MEM_ADDR_BIT		5
`define	MEM_DATA_BUS		`MEM_DATA_BIT-1:0
`define	MEM_ADDR_BUS		`MEM_ADDR_BIT-1:0

// --------------------------------------------------
//	ALU (Arithmetic & Logical Unit)
// --------------------------------------------------
`define	ALU_DATA_BIT		32
`define	ALU_DATA_BUS		`ALU_DATA_BIT-1:0
//	func3 
`define	ALU_FN3_ADDSUB		3'b000
`define	ALU_FN3_SLL			3'b001	// Shift Left Logical
`define	ALU_FN3_SLT			3'b010	// Set on Less Than
`define	ALU_FN3_SLTU		3'b011	// Set on Less Than Unsigned
`define	ALU_FN3_XOR			3'b100
`define	ALU_FN3_SRLSRA		3'b101	// Shift Right Logical / Arithmetic
`define	ALU_FN3_OR			3'b110
`define	ALU_FN3_AND			3'b111
//	func7
`define	ALU_FN7_ADD			7'b0000000
`define	ALU_FN7_SUB			7'b0100000
`define	ALU_FN7_SRL			7'b0000000
`define	ALU_FN7_SRA			7'b0100000
//	opcode
`define	ALU_OPC_IMM			7'b0010011
`define	ALU_OPC_REG			7'b0110011
