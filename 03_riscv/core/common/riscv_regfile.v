// ==================================================
//	[ VLSISYS Lab. ]
//	* Author		: Woong Choi (woongchoi@sm.ac.kr)
//	* Filename		: riscv_regfile.v
//	* Description	: 
// ==================================================

module riscv_regfile
#(	
	parameter	BW_DATA	= 32,
	parameter	BW_ADDR	= 5
)
(
	output		[BW_DATA-1:0]	o_reg_rd_data0,
	output		[BW_DATA-1:0]	o_reg_rd_data1,
	input		[BW_ADDR-1:0]	i_reg_rd_addr0,
	input		[BW_ADDR-1:0]	i_reg_rd_addr1,
	input		[BW_DATA-1:0]	i_reg_wr_data,
	input		[BW_ADDR-1:0]	i_reg_wr_addr,
	input						i_reg_wr_en,
	input						i_clk,
	input						i_rstn
);

	reg			[BW_DATA-1:0]	reg_arr[0:2**BW_ADDR-1];

	// Async. Read 
	assign		o_reg_rd_data0	= reg_arr[i_reg_rd_addr0];
	assign		o_reg_rd_data1	= reg_arr[i_reg_rd_addr1];

	integer		i;
	always @(posedge i_clk or negedge i_rstn) begin
		if(!i_rstn) begin
			for (i=0; i<2**BW_ADDR-1; i++) begin
				reg_arr[i] <= 0;
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
