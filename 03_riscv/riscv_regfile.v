// ==================================================
//	[ VLSISYS Lab. ]
//	* Author		: Woong Choi (woongchoi@sm.ac.kr)
//	* Filename		: riscv_regfile.v
//	* Description	: 
// ==================================================

`include		"riscv_params.v"

module riscv_regfile
(
	output		[`REG_DATA_BUS]	o_reg_rd_data0,
	output		[`REG_DATA_BUS]	o_reg_rd_data1,
	input		[`REG_ADDR_BUS]	i_reg_rd_addr0,
	input		[`REG_ADDR_BUS]	i_reg_rd_addr1,
	input		[`REG_DATA_BUS]	i_reg_wr_data,
	input		[`REG_ADDR_BUS]	i_reg_wr_addr,
	input						i_reg_wr_en,
	input						i_clk,
	input						i_rstn
);

	reg			[`REG_DATA_BUS]	reg_arr[0:2**`REG_ADDR_BIT-1];

	// Async. Read 
	assign		o_reg_rd_data0	= reg_arr[i_reg_rd_addr0];
	assign		o_reg_rd_data1	= reg_arr[i_reg_rd_addr1];

	integer		i;
	always @(posedge i_clk or negedge i_rstn) begin
		if(!i_rstn) begin
			for (i=0; i<2**`REG_ADDR_BIT-1; i++) begin
				reg_arr[i_reg_wr_addr] <= 0;
			end
		end else begin
			//	"Write" and  "Write Address != 0"
			if (i_reg_wr_en && (i_reg_wr_addr != 0)) begin
				reg_arr[i_reg_wr_addr] <= i_reg_wr_data;
			//	Hold Data
			end else begin
				reg_arr[i_reg_wr_addr] <= reg_arr[i_reg_wr_addr];
			end
		end
	end

endmodule
