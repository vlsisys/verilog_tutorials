// ==================================================
//	[ VLSISYS Lab. ]
//	* Author		: Woong Choi (woongchoi@sm.ac.kr)
//	* Filename		: spsram.v
//	* Date			: 2024-05-15 22:06:21
//	* Description	: 
// ==================================================


module spsram
#(	
	parameter	BW_DATA	= 32,
	parameter	BW_ADDR	= 5
)
(	
	output		[BW_DATA-1:0]	o_data,
	input		[BW_DATA-1:0]	i_data,
	input		[BW_ADDR-1:0]	i_addr,
	input						i_wen,
	input						i_cen,
	input						i_oen,
	input						i_clk
);
	
	//	Memory Write
	reg		[BW_DATA-1:0]	mem[0:2**BW_ADDR-1];
	always @(posedge i_clk) begin
		if(i_cen && i_wen) begin
			mem[i_addr]	<= i_data;
		end else begin
			mem[i_addr]	<= mem[i_addr];
		end
	end

	`ifdef	SPSRAM_ASYNC
		assign	o_data	= (i_cen && !i_wen && i_oen) ? mem[i_addr] : 'bz;

	`else
		reg		[BW_DATA-1:0]	o_data;
		always @(posedge i_clk) begin
			if(i_cen && !i_wen && i_oen) begin
				o_data	<= mem[i_addr];
			end else begin
				o_data	<= mem[i_addr];
			end
		end
	`endif

endmodule
