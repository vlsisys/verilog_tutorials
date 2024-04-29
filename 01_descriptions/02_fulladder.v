// ==================================================
//	Practice 01 : Full-Adder
//		- Dataflow 1
// ==================================================

module	module_name
#(	parameter	PARAM0	= 0,
	parameter	PARAM1	= 1,
	parameter	PARAM2	= 2
)
(
	//	Outputs
	output	reg		[ 31:0]		o_dout,
	output	reg					o_valid,

	//	Inputs
	input	wire	[ 31:0]		i_din,
	input	wire				i_clk,
	input	wire				i_rst
);

endmodule

module fa_assign_with_boolean
(
	output						s,	// sum
	output						co,	// carry out
	input						a,	// input a
	input						b,	// input b
	input						ci	// carry in
);

	assign	s	= (~a & ~b & ci) + (~a & b & ~ci) + (a & b & ci) + (a & ~b & ~ci);
	assign	co	= (a & b) + (b & ci) + (a & ci);

endmodule

module fa_assign_with_concat
(
	output						s,
	output						co,
	input						a,
	input						b,
	input						ci
);

	assign	{co, s}	= a + b + ci;

endmodule

// ==================================================
//	Practice 01 : Full-Adder
//		- Behavior 1
// ==================================================
module fa_always_with_concat
(
	output	reg					s,
	output	reg					co,
	input						a,
	input						b,
	input						ci
);

	always @(*) begin
		{co, s}	= a + b + ci;
	end

endmodule

// ==================================================
//	Practice 01 : Full-Adder
//		- Behavior 2
// ==================================================
module fa_always_with_case
(
	output	reg					s,
	output	reg					co,
	input						a,
	input						b,
	input						ci
);

	always @(*) begin
		case({ci, a, b})
			3'b000:	{co, s}	= 2'b00;
			3'b001:	{co, s}	= 2'b01;
			3'b010:	{co, s}	= 2'b01;
			3'b011:	{co, s}	= 2'b10;
			3'b100:	{co, s}	= 2'b01;
			3'b101:	{co, s}	= 2'b10;
			3'b110:	{co, s}	= 2'b10;
			3'b111:	{co, s}	= 2'b11;
		endcase
	end

endmodule

// ==================================================
//	Practice 01 : 2:1 Multiplexer (MUX)
//		- Dataflow
// ==================================================
module mux2_dataflow(
	output 				y,
	input				d0,
	input				d1,
	input				s
);

	assign	y = s ? d1 : d0;

endmodule

// ==================================================
//	Practice 01 : 2:1 Multiplexer (MUX)
//		- Dataflow (Multibit)
// ==================================================
module mux2_dataflow_multibit(
	output 		[3:0]	y,
	input		[3:0]	d0,
	input		[3:0]	d1,
	input				s
);

	assign	y = s ? d1 : d0;

endmodule

// ==================================================
//	Practice 01 : 4:1 Multiplexer (MUX)
//		- If Statement
// ==================================================
module mux4_if(
	output reg			y,
	input				d0,
	input				d1,
	input				d2,
	input				d3,
	input		[1:0]	s
);

	always	@(*) begin
		if			(s == 2'b00) begin
			y = d0;
		end else if	(s == 2'b01) begin
			y = d1;
		end else if	(s == 2'b10) begin
			y = d2;
//		end else if	(s == 2'b11) begin
		end else begin
			y = d3;
		end
	end

endmodule

// ==================================================
//	Practice 01 : 4:1 Multiplexer (MUX)
//		- Case Statement
// ==================================================
module mux4_case(
	output reg			y,
	input				d0,
	input				d1,
	input				d2,
	input				d3,
	input		[1:0]	s
);

	always	@(*) begin
		case(s)
			2'b00:	y = d0;
			2'b01:	y = d1;
			2'b10:	y = d2;
			2'b11:	y = d3;
		endcase
	end

endmodule


// ==================================================
//	Practice 01 : 2:4 Decoder
//		- Dataflow
// ==================================================
module dec2_dataflow(
	output 		[3:0]	out,
	input		[1:0]	in,
	input				en
);

	assign	out	= (en == 1'b1) ? (4'd1 << in) : 4'd0;

endmodule

// ==================================================
//	Practice 01 : 2:4 Decoder
//		- Behavior
// ==================================================
module dec2_behavior(
	output reg	[3:0]	out,
	input		[1:0]	in,
	input				en
);

	always	@(*) begin
		if	(en == 1'b1) begin
			case(in)
				2'b00:	out	= 4'b0001;
				2'b01:	out	= 4'b0010;
				2'b10:	out	= 4'b0100;
				2'b11:	out	= 4'b1000;
			endcase
		end else begin
			out	= 4'd0;
		end
	end

endmodule

// ==================================================
//	Practice 02 : Multi-Bit Adder
// ==================================================
module fa4_concat(
	output		[3:0]	s,
	output				co,
	input		[3:0]	a,
	input		[3:0]	b,
	input				ci
);

	assign	{co, s}	= a + b + ci;

endmodule

module fa(
	output				s,
	output			  	co,
	input				a,
	input				b,
	input				ci
);

	assign	{co, s}	= a + b + ci;

endmodule

module fa4_hier(
	output		[3:0]	s,
	output				co,
	input		[3:0]	a,
	input		[3:0]	b,
	input				ci
);

	wire		[2:0]	carry;

	fa	fa_u0(
		.s		(s[0] 		),
		.co		(carry[0]	),
		.a		(a[0] 		),
		.b		(b[0] 		),
		.ci		(ci			));

	fa	fa_u1(
		.s		(s[1] 		),
		.co		(carry[1]	),
		.a		(a[1] 		),
		.b		(b[1] 		),
		.ci		(carry[0]	));

	fa	fa_u2(
		.s		(s[2] 		),
		.co		(carry[2]	),
		.a		(a[2] 		),
		.b		(b[2] 		),
		.ci		(carry[1]	));

	fa	fa_u3(
		.s		(s[3] 		),
		.co		(co			),
		.a		(a[3] 		),
		.b		(b[3] 		),
		.ci		(carry[2]	));

endmodule
