// ==================================================
//	[ VLSISYS Lab. ]
//	* Author		: Woong Choi (woongchoi@sm.ac.kr)
//	* Filename		: regfile_2r1w.v
//	* Description	: 
// ==================================================

`include	"params.v"
module regfile_2r1w
#(
	parameter	BW	= 32
)
(
	output		[BW-1:0]	o_rd_data0,
	output		[BW-1:0]	o_rd_data1,
	input		[   4:0]	i_rd_addr0,
	input		[   4:0]	i_rd_addr1,
	input		[BW-1:0]	i_wr_data,
	input		[   4:0]	i_wr_addr,
	input					i_wr_en,
	input					i_clk,
	input					i_rstn
);

	reg			[BW-1:0]	reg_q[0:31];

	// Async. Read 
	assign		o_rd_data0	= reg_q[i_rd_addr0];
	assign		o_rd_data1	= reg_q[i_rd_addr1];

	always @(posedge i_clk) begin
		if(!i_rstn) begin
			reg_q[ 0] <= {BW{1'b0}}; // $zero
			reg_q[ 1] <= {BW{1'b0}}; // $ra
			reg_q[ 2] <= {BW{1'b0}}; // $sp
			reg_q[ 3] <= {BW{1'b0}}; // $gp
			reg_q[ 4] <= {BW{1'b0}}; // $tp
			reg_q[ 5] <= {BW{1'b0}}; // $t0
			reg_q[ 6] <= {BW{1'b0}}; // $t1
			reg_q[ 7] <= {BW{1'b0}}; // $t2
			reg_q[ 8] <= {BW{1'b0}}; // $s0/fp
			reg_q[ 9] <= {BW{1'b0}}; // $s1
			reg_q[10] <= {BW{1'b0}}; // $a0
			reg_q[11] <= {BW{1'b0}}; // $a1
			reg_q[12] <= {BW{1'b0}}; // $a2
			reg_q[13] <= {BW{1'b0}}; // $a3
			reg_q[14] <= {BW{1'b0}}; // $a4
			reg_q[15] <= {BW{1'b0}}; // $a5
			reg_q[16] <= {BW{1'b0}}; // $a6
			reg_q[17] <= {BW{1'b0}}; // $a7
			reg_q[18] <= {BW{1'b0}}; // $s2
			reg_q[19] <= {BW{1'b0}}; // $s3
			reg_q[20] <= {BW{1'b0}}; // $s4
			reg_q[21] <= {BW{1'b0}}; // $s5
			reg_q[22] <= {BW{1'b0}}; // $s6
			reg_q[23] <= {BW{1'b0}}; // $s7
			reg_q[24] <= {BW{1'b0}}; // $s8
			reg_q[25] <= {BW{1'b0}}; // $s9
			reg_q[26] <= {BW{1'b0}}; // $s10
			reg_q[27] <= {BW{1'b0}}; // $s11
			reg_q[28] <= {BW{1'b0}}; // $t3
			reg_q[29] <= {BW{1'b0}}; // $t4
			reg_q[30] <= {BW{1'b0}}; // $t5
			reg_q[31] <= {BW{1'b0}}; // $t6end
		end else begin
			//	"Write" and  "Write Address != 0"
			if (i_wr_en && (i_wr_addr != 0)) begin
				reg_q[i_wr_addr] <= i_wr_data;
			//	Hold Data
			end else begin
				reg_q[i_wr_addr] <= reg_q[i_wr_addr];
			end
		end
	end
endmodule
