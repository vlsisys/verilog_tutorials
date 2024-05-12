// ==================================================
//	[ VLSISYS Lab. ]
//	* Author		: Woong Choi (woongchoi@sm.ac.kr)
//	* Filename		: 01_instruction_decoder.v
//	* Description	: 
// ==================================================

//	https://github.com/riscv/riscv-isa-manual/releases/download/Ratified-IMAFDQC/riscv-spec-20191213.pdf


	reg		[31:0]	instr;
// --------------------------------------------------
//  RV32 Base Instruction Set (p.130): 11 cases
// --------------------------------------------------
	wire			isLUI		= (instr[6:0] == 7'b0110111); // rd <- Uimm
	wire			isAUIPC		= (instr[6:0] == 7'b0010111); // rd <- PC + Uimm
	wire			isJAL		= (instr[6:0] == 7'b1101111); // rd <- PC+4; PC<-PC+Jimm
	wire			isJALR		= (instr[6:0] == 7'b1100111); // rd <- PC+4; PC<-rs1+Iimm
	wire			isBranch	= (instr[6:0] == 7'b1100011); // if(rs1 OP rs2) PC<-PC+Bimm
	wire			isLoad		= (instr[6:0] == 7'b0000011); // rd <- mem[rs1+Iimm]
	wire			isStore		= (instr[6:0] == 7'b0100011); // mem[rs1+Simm] <- rs2
	wire			isALUimm	= (instr[6:0] == 7'b0010011); // rd <- rs1 OP Iimm
	wire			isALUreg	= (instr[6:0] == 7'b0110011); // rd <- rs1 OP rs2
//	wire			isFENSE		= (instr[6:0] == 7'b0001111); // 
	wire			isSYSTEM	= (instr[6:0] == 7'b1110011); // special

// --------------------------------------------------
//  Source & Destination Registers
// --------------------------------------------------
	wire	[ 4:0]	rs1Idx	= instr[19:15];
	wire	[ 4:0]	rs2Idx	= instr[24:20];
	wire	[ 4:0]	rdxIdx	= instr[11: 7];

// --------------------------------------------------
//  Function Codes
// --------------------------------------------------
	wire	[ 2:0]	funct3	= instr[14:12];
	wire	[ 6:0]	funct7	= instr[31:25];

// --------------------------------------------------
//  Immediate Formats
// --------------------------------------------------
	wire	[31:0]	immI	= {{21{instr[31]}}, instr[30:20]};
	wire	[31:0]	immS	= {{21{instr[31]}}, instr[30:25], instr[11:7]};
	wire	[31:0]	immB	= {{20{instr[31]}}, instr[7],     instr[30:25], instr[11: 8], 1'b0};
	wire	[31:0]	immU	= {    instr[31],   instr[30:12], {12{1'b0}}};
	wire	[31:0]	immJ	= {{12{instr[31]}}, instr[19:12], instr[20],    instr[30:21], 1'b0};
