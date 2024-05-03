
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


