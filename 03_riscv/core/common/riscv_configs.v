// ==================================================
//	[ VLSISYS Lab. ]
//	* Author		: Woong Choi (woongchoi@sm.ac.kr)
//	* Filename		: riscv_params.v
//	* Description	: 
// ==================================================

// --------------------------------------------------
//	Overall
// --------------------------------------------------
`define	CPU_DATA_BIT		32
`define	CPU_INST_BIT		32
`define	CPU_DATA_BUS		`CPU_DATA_BIT-1:0
`define	CPU_INST_BUS		`CPU_INST_BIT-1:0

// --------------------------------------------------
//	Data Path
// --------------------------------------------------
`define	ADD_DATA_BIT		32
`define	ADD_DATA_BUS		`ADD_DATA_BIT-1:0
`define	ADD_DATA_BIT		32
`define	ADD_DATA_BUS		`ADD_DATA_BIT-1:0

// --------------------------------------------------
//	ALU (Arithmetic & Logical Unit)
// --------------------------------------------------
`define	ALU_DATA_BIT		32
`define	ALU_DATA_BUS		`ALU_DATA_BIT-1:0
`define	ALU_CTRL_BIT		4
`define	ALU_CTRL_BUS		`ALU_CTRL_BIT-1:0
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
//	Immidiate Generate
// --------------------------------------------------
`define	IMM_DATA_BIT			32
`define	IMM_CTRL_BIT			3
`define	IMM_DATA_BUS			`IMM_DATA_BIT-1:0
`define	IMM_CTRL_BUS			`IMM_CTRL_BIT-1:0
`define	IMM_INST_BUS			31:7
//	IMM Type
`define	IMM_TYPE_I				3'b000
`define	IMM_TYPE_S				3'b001
`define	IMM_TYPE_B				3'b010
`define	IMM_TYPE_U				3'b011
`define	IMM_TYPE_J				3'b100

// --------------------------------------------------
//	Memory (Instruction / Data)
// --------------------------------------------------
`define	IME_ADDR_BIT		5
`define	DME_ADDR_BIT		32
`define	IME_ADDR_BUS		`IME_ADDR_BIT-1:0
`define	DME_ADDR_BUS		`DME_ADDR_BIT-1:0
`define	IME_INIT_FILE		""
`define	DME_INIT_FILE		""

