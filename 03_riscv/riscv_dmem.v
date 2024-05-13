// ==================================================
//	[ VLSISYS Lab. ]
//	* Author		: Woong Choi (woongchoi@sm.ac.kr)
//	* Filename		: riscv_dmem.v
//	* Description	: 
// ==================================================

`include	"riscv_params.v"

module riscv_dmem 
(	
	output		[`DMEM_DATA_BUS]	o_mem_data,
	input		[`DMEM_DATA_BUS]	i_mem_data,
	input		[`DMEM_ADDR_BUS]	i_mem_addr,
	input							i_mem_wr_en,
	input							i_clk
);

	reg			[`DMEM_DATA_BUS]	mem_arr[0:2**`DMEM_ADDR_BIT-1];
	initial		$readmemh(`DMEM_INIT_FILE, mem_arr);

	assign		o_mem_data = (i_mem_wr_en) ? o_mem_data : mem_arr[i_mem_addr];

	always @(posedge i_clk) begin
		if (i_mem_wr_en) begin
			mem_arr[i_mem_addr] <= i_mem_data;
		end else begin
			mem_arr[i_mem_addr] <= mem_arr[i_mem_addr];
		end
	end

endmodule
