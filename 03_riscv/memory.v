// ==================================================
//	[ VLSISYS Lab. ]
//	* Author		: Woong Choi (woongchoi@sm.ac.kr)
//	* Filename		: memory.v
//	* Description	: 
// ==================================================

`include	"params.v"

module memory
#(
	parameter	MEM_INIT_FILE	= "memory.init"
)
(	
	output		[`MEM_DATA_BUS]		o_data,
	input		[`MEM_DATA_BUS]		i_data,
	input		[`MEM_ADDR_BUS]		i_addr,
	input							i_wr_en,
	input							i_clk
);

	reg			[`MEM_DATA_BUS]	mem_arr[0:2**`MEM_ADDR_BIT-1];
	initial		$readmemh(MEM_INIT_FILE, mem_arr);

	assign		o_data = (i_wr_en) ? o_data : mem_arr[i_addr];

	always @(posedge i_clk) begin
		if (i_wr_en) begin
			mem_arr[i_addr] <= i_data;
		end else begin
			mem_arr[i_addr] <= mem_arr[i_addr];
		end
	end

	endmodule

