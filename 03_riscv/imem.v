// ==================================================
//	[ VLSISYS Lab. ]
//	* Author		: Woong Choi (woongchoi@sm.ac.kr)
//	* Filename		: imem.v
//	* Description	: Instruction Cache
// ==================================================
module	imem
#(
	parameter	BW		= 10
)
(	
	output reg	[ 31:0]		o_instr,
	input		[ 31:0]		i_addr,
	input					i_clk,
	input					i_rstn
);

	reg		[31:0] RAM[63:0];

	initial
		$readmemh("imem_init.txt",RAM);

	assign	o_instr	= RAM[i_addr[31:2]]; // word aligned
endmodule
