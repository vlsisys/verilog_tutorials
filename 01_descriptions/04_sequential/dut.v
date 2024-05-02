// ==================================================
//	[ VLSISYS Lab. ]
//	* Filename		: dut.v
//	* Author		: Woong Choi (woongchoi@sm.ac.kr)
//	* Description	: 
//		- Key Points
//			1. 
//			2. 
// ==================================================

module	latch(
	output reg		q,
	input			d,
	input			clk
);

	always @(*) begin
//		if(clk == 1'b1) begin
		if(clk) begin
			q	<= d;
		end
	end

endmodule

// ==============================
//	Practice 01 : DFF
//		- Edge Sensitive
// ==============================
module	dff(
	output reg		q,
	input			d,
	input			clk
);

	always @(posedge clk) begin
		q	<= d;
	end

endmodule

// ==============================
//	Practice 01 : DFF w/ Sync. Reset
//		- Edge Sensitive
// ==============================
module	dff_sync(
	output reg		q,
	input			d,
	input			clk,
	input			rst_n
);

	always @(posedge clk) begin
//		if(rst_n == 1'b0) begin
		if(!rst_n) begin
			q	<= 1'b0;
		end else begin
			q	<= d;
		end
	end

endmodule

// ==============================
//	Practice 01 : DFF w/ Sync. Reset
//		- Edge Sensitive
// ==============================
module	dff_async(
	output reg		q,
	input			d,
	input			clk,
	input			rst_n
);

	always @(posedge clk or negedge rst_n) begin
//		if(rst_n == 1'b0) begin
		if(!rst_n) begin
			q	<= 1'b0;
		end else begin
			q	<= d;
		end
	end

endmodule

// ==============================
//	Practice 01 : Blocking
// ==============================
module	block(
	output reg		q,
	input			d,
	input			clk
);

	reg				n1;
	always @(posedge clk) begin
		n1	= d;
		q	= n1;
	end

endmodule

// ==============================
//	Practice 01 : Non-Blocking
// ==============================
module	nonblock(
	output reg		q,
	input			d,
	input			clk
);

	reg				n1;
	always @(posedge clk) begin
		n1	<= d;
		q	<= n1;
	end

endmodule


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

// ==============================
//	Practice 02 : NCO
//		- Numerical Controlled Oscillator
// ==============================
module	nco(
	output reg			o_clk,
	input		[31:0]	i_num,
	input				i_clk,
	input				i_rstn
);

	reg	[31:0]			cnt;
	always @(posedge i_clk or negedge i_rstn) begin
		if(!i_rstn) begin
			cnt		<= {32{1'b1}};
			o_clk	<= 0;
		end else begin
			if(cnt >= i_num/2 - 1) begin
				cnt		<= 0;
				o_clk	<= ~o_clk;
			end else begin
				cnt		<= cnt + 1;
				o_clk	<= o_clk;
			end
		end
	end

endmodule

module	dff_active_low_set(
	output			o_q,
	input			i_d,
	input			i_clk,
	input			i_setn
);

	wire	node[0:3];

	buf		u_buf_0		(node[3],	i_setn);

	notif0	u_notif0_l	(node[0],	i_d,		i_clk);
	notif1	u_notif1_l	(node[0],	node[1],	i_clk);
	nand	u_nand_l	(node[1],	node[0],	node[3]);

	notif1	u_notif1_r	(node[2],	node[1],	i_clk);
	notif0	u_notif0_r	(node[2],	o_q,		i_clk);
	nand	u_nand_r	(o_q,		node[2],	node[3]);

endmodule
