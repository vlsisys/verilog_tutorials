// ==================================================
//	[ VLSISYS Lab. ]
//	* Author		: Woong Choi (woongchoi@sm.ac.kr)
//	* Filename		: regfile.v
//	* Description	: 
// ==================================================

`include		"params.v"

module regfile
(
	output		[`REG_DATA_BUS]	o_rd_data0,
	output		[`REG_DATA_BUS]	o_rd_data1,
	input		[`REG_ADDR_BUS]	i_rd_addr0,
	input		[`REG_ADDR_BUS]	i_rd_addr1,
	input		[`REG_DATA_BUS]	i_wr_data,
	input		[`REG_ADDR_BUS]	i_wr_addr,
	input						i_wr_en,
	input						i_clk,
	input						i_rstn
);

	reg			[`REG_DATA_BUS]	reg_arr[0:2**`REG_ADDR_BIT-1];

	// Async. Read 
	assign		o_rd_data0	= reg_arr[i_rd_addr0];
	assign		o_rd_data1	= reg_arr[i_rd_addr1];

	integer		i;
	always @(posedge i_clk or negedge i_rstn) begin
		if(!i_rstn) begin
			for (i=0; i<2**`REG_ADDR_BIT-1; i++) begin
				reg_arr[i_wr_addr] <= 0;
			end
		end else begin
			//	"Write" and  "Write Address != 0"
			if (i_wr_en && (i_wr_addr != 0)) begin
				reg_arr[i_wr_addr] <= i_wr_data;
			//	Hold Data
			end else begin
				reg_arr[i_wr_addr] <= reg_arr[i_wr_addr];
			end
		end
	end

endmodule
