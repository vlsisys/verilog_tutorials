// ==================================================
//	[ VLSISYS Lab. ]
//	* Author		: Woong Choi (woongchoi@sm.ac.kr)
//	* Filename		: riscv_params.v
//	* Description	: 
// ==================================================





// --------------------------------------------------
//	MUX
// --------------------------------------------------
`define	MUX_DATA_BIT		32
`define	MUX_DATA_BUS		`MUX_DATA_BIT-1:0

// --------------------------------------------------
//	Adder
// --------------------------------------------------
`define	ADD_DATA_BIT		32
`define	ADD_DATA_BUS		`ADD_DATA_BIT-1:0

// --------------------------------------------------
//	DFF
// --------------------------------------------------
`define	DFF_DATA_BIT		32
`define	DFF_DATA_BUS		`DFF_DATA_BIT-1:0

// --------------------------------------------------
//	Register File
// --------------------------------------------------
`define	REG_DATA_BIT		32
`define	REG_ADDR_BIT		5
`define	REG_DATA_BUS		`REG_DATA_BIT-1:0
`define	REG_ADDR_BUS		`REG_ADDR_BIT-1:0

// --------------------------------------------------
//	Instruction Memory
// --------------------------------------------------
`define	IMEM_DATA_BIT		32
`define	IMEM_ADDR_BIT		5
`define	IMEM_DATA_BUS		`IMEM_DATA_BIT-1:0
`define	IMEM_ADDR_BUS		`IMEM_ADDR_BIT-1:0
`define	IMEM_INIT_FILE		""

// --------------------------------------------------
//	Data Memory
// --------------------------------------------------
`define	DMEM_DATA_BIT		32
`define	DMEM_ADDR_BIT		32
`define	DMEM_DATA_BUS		`DMEM_DATA_BIT-1:0
`define	DMEM_ADDR_BUS		`DMEM_ADDR_BIT-1:0
`define	DMEM_INIT_FILE		""

// --------------------------------------------------
//	ALU (Arithmetic & Logical Unit)
// --------------------------------------------------
`define	ALU_DATA_BIT		32
`define	ALU_CTRL_BIT		4
`define	ALU_DATA_BUS		`ALU_DATA_BIT-1:0
`define	ALU_CTRL_BUS		`ALU_CTRL_BIT-1:0
//							{func7[5], fucn3}
`define	ALU_OP_ADD			4'b0000
`define	ALU_OP_SUB			4'b1000
`define	ALU_OP_SLL			4'b0001	// Shift Left Logical
`define	ALU_OP_SLT			4'b0010	// Set on Less Than
`define	ALU_OP_SLTU			4'b0011	// Set on Less Than Unsigned
`define	ALU_OP_XOR			4'b0100
`define	ALU_OP_SRL			4'b0101	// Shift Right Logical / Arithmetic
`define	ALU_OP_SRA			4'b1101	// Shift Right Logical / Arithmetic
`define	ALU_OP_OR			4'b0110
`define	ALU_OP_AND			4'b0111

// --------------------------------------------------
//	Immidiate Generate
// --------------------------------------------------
`define	IMM_DATA_BIT		32
`define	IMM_CTRL_BIT		3
`define	IMM_DATA_BUS		`IMM_DATA_BIT-1:0
`define	IMM_CTRL_BUS		`IMM_CTRL_BIT-1:0
`define	IMM_INST_BUS		31:7
//	IMM Type
`define	IMM_TYPE_I			3'b000
`define	IMM_TYPE_S			3'b001
`define	IMM_TYPE_B			3'b010
`define	IMM_TYPE_U			3'b011
`define	IMM_TYPE_J			3'b100
