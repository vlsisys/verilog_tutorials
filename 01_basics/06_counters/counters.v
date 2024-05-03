
// ==============================
//	Practice 02 : Counter
// ==============================
module	upcnt60(
	output reg	[5:0]	o_cnt,
	input				i_clk,
	input				i_rstn
);

	always @(posedge i_clk or negedge i_rstn) begin
		if(!i_rstn) begin
			o_cnt	<= 0;
		end else begin
			if(o_cnt == 59) begin
				o_cnt	<= 0;
			end else begin
				o_cnt	<= o_cnt + 1;
			end
		end
	end

endmodule

module	dwcnt60(
	output reg	[5:0]	o_cnt,
	input				i_clk,
	input				i_rstn
);

	always @(posedge i_clk or negedge i_rstn) begin
		if(!i_rstn) begin
			o_cnt	<= 59;
		end else begin
			if(o_cnt == 0) begin
				o_cnt	<= 59;
			end else begin
				o_cnt	<= o_cnt - 1;
			end
		end
	end

endmodule


module	upcnt_param	#(
	parameter	UPBND	= 60
)(
	output reg	[$clog2(UPBND)-1:0]		o_cnt,
	input								i_clk,
	input								i_rstn
);

	always @(posedge i_clk or negedge i_rstn) begin
		if(!i_rstn) begin
			o_cnt	<= 0;
		end else begin
			if(o_cnt == UPBND-1) begin
				o_cnt	<= 0;
			end else begin
				o_cnt	<= o_cnt + 1;
			end
		end
	end

endmodule

