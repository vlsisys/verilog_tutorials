// ==================================================
//	[ VLSISYS Lab. ]
//	* Author		: Woong Choi (woongchoi@sm.ac.kr)
//	* Filename		: mux.v
//	* Description	: 
// ==================================================

module mux
#(	
	parameter	BW_DATA			= 32,
	parameter	IN_NUM			= 4
)
(	
	output 		[BW_DATA-1        : 0]	o_out,
	input		[BW_DATA-1        : 0]	i_in[0:IN_NUM-1],
	input		[$clog2(IN_NUM)-1 : 0]	i_sel
);

	assign	o_out	= i_in[i_sel];

endmodule
