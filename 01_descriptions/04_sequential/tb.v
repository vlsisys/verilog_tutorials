// ==================================================
//	[ VLSISYS Lab. ]
//	* Filename		: tb.v
//	* Author		: Woong Choi (woongchoi@sm.ac.kr)
//	* Description	: 
//		- Key Points
//			1. 
//			2. 
// ==================================================


`define		SYSFREQ		100		// Unit: MHz
`define		CLKPERIOD	1000/`SYSFREQ
`define		SIMCYCLE	20

`include	"dut.v"
module	tb_latch_dff;

	wire			q_latch;
	wire			q_dff;

	reg				d;
	reg				clk;

	latch	u_latch(
		.q		(q_latch	),
		.d		(d			),
		.clk	(clk		));

	dff		u_dff(
		.q		(q_dff		),
		.d		(d			),
		.clk	(clk		));

	initial					clk	= 1'b1;
	always	#(500/`SYSFREQ)	clk = ~clk;

	integer			i,j;
	initial begin
		for(i=0; i<`SIMCYCLE; i=i+1) begin
			j = $urandom_range(0,10);
			#( (j*0.1)		*`CLKPERIOD);
			d = $urandom;	
			#( (1-(j*0.1))	*`CLKPERIOD);
		end
		$finish;
	end

endmodule

// ==============================
//	Practice 01 : DFF w/ Two Type Reset
// ==============================
module	tb_dffs;

	wire			q_dff_sync;
	wire			q_dff_async;

	reg				d;
	reg				clk;
	reg				rst_n;

	dff_sync		u_dff_sync(
	.q		(q_dff_sync		),
	.d		(d	  			),
	.clk	(clk  			),
	.rst_n	(rst_n			));

	dff_async		u_dff_async(
	.q		(q_dff_async	),
	.d		(d	  			),
	.clk	(clk  			),
	.rst_n	(rst_n			));

	initial					clk	= 1'b1;
	always	#(500/`SYSFREQ)	clk = ~clk;

	integer			i,j;
	initial	begin
		for(i=0; i<`SIMCYCLE; i=i+1) begin
			j = $urandom_range(0,10);
			#( (j*0.1) * `CLKPERIOD);	
			d		= $urandom;
			rst_n	= $urandom;
			#( (1-(j*0.1)) * `CLKPERIOD);	
		end
		$finish;
	end

endmodule

// ==============================
//	Practice 01: Block vs Non-Block
// ==============================
module	tb_blocking;

	wire			q_block;
	wire			q_nonblock;

	reg				d;
	reg				clk;

	block			u_block(
	.q		(q_block		),
	.d		(d	  			),
	.clk	(clk  			));

	nonblock		u_nonblock(
	.q		(q_nonblock		),
	.d		(d	  			),
	.clk	(clk  			));

	initial					clk	= 1'b1;
	always	#(500/`SYSFREQ)	clk = ~clk;

	integer			i,j;
	initial	begin
		for(i=0; i<`SIMCYCLE; i=i+1) begin
			j = $urandom_range(0,10);
			#( (j*0.1) * `CLKPERIOD);	
			d		= $urandom;
			#( (1-(j*0.1)) * `CLKPERIOD);	
		end
		$finish;
	end

endmodule

// ==============================
//	Practice 02: Counter
// ==============================
module	tb_counter;

	wire	[5:0]	o_upcnt;
	wire	[5:0]	o_dwcnt;

	reg				i_clk;
	reg				i_rstn;

	upcnt60	u_upcnt60(
	.o_cnt		(o_upcnt 	),
	.i_clk		(i_clk 		),
	.i_rstn		(i_rstn		));

	dwcnt60	u_dwcnt60(
	.o_cnt		(o_dwcnt 	),
	.i_clk		(i_clk 		),
	.i_rstn		(i_rstn		));

	initial					i_clk	= 1'b1;
	always	#(500/`SYSFREQ)	i_clk = ~i_clk;

	integer			i;
	initial	begin
		i_rstn	= 1'b0;
		#(4*`CLKPERIOD);
		i_rstn	= 1'b1;
		for(i=0; i<100; i=i+1) begin
			#(`CLKPERIOD);	
		end
		$finish;
	end

endmodule

// ==============================
//	Practice 02: Counter
// ==============================
module	tb_counter_param;

	localparam						UPBND0 = 60;
	localparam						UPBND1 = 12;
	localparam						UPBND2 = 24;

	wire	[$clog2(UPBND0)-1:0]	o_upcnt0;
	wire	[$clog2(UPBND1)-1:0]	o_upcnt1;
	wire	[$clog2(UPBND2)-1:0]	o_upcnt2;

	reg								i_clk;
	reg								i_rstn;

	upcnt_param	#(
	.UPBND		(UPBND0		))
	u_upcnt_param0(
	.o_cnt		(o_upcnt0 	),
	.i_clk		(i_clk 		),
	.i_rstn		(i_rstn		));

	upcnt_param	#(
	.UPBND		(UPBND1		))
	u_upcnt_param1(
	.o_cnt		(o_upcnt1 	),
	.i_clk		(i_clk 		),
	.i_rstn		(i_rstn		));

	upcnt_param	#(
	.UPBND		(UPBND2		))
	u_upcnt_param2(
	.o_cnt		(o_upcnt2 	),
	.i_clk		(i_clk 		),
	.i_rstn		(i_rstn		));

	initial					i_clk	= 1'b1;
	always	#(500/`SYSFREQ)	i_clk = ~i_clk;

	integer			i;
	initial	begin
		i_rstn	= 1'b0;
		#(4*`CLKPERIOD);
		i_rstn	= 1'b1;
		for(i=0; i<100; i=i+1) begin
			#(`CLKPERIOD);	
		end
		$finish;
	end

endmodule

// ==============================
//	Practice 02: Counter
// ==============================
module	tb_nco;

	localparam			I_NUM	= 4;

	wire				o_clk;

	reg					i_clk;
	reg					i_rstn;

	nco		u_nco(
	.o_clk		(o_clk 		),
	.i_num		(I_NUM		),
	.i_clk		(i_clk 		),
	.i_rstn		(i_rstn		));

	initial					i_clk	= 1'b1;
	always	#(500/`SYSFREQ)	i_clk = ~i_clk;

	integer			i;
	initial	begin
		i_rstn	= 1'b0;
		#(4*`CLKPERIOD);
		i_rstn	= 1'b1;
		for(i=0; i<`SIMCYCLE; i=i+1) begin
			#(`CLKPERIOD);	
		end
		$finish;
	end

endmodule




module	tb_a1;

	wire		o_q;
	reg			i_d;
	reg			i_clk;
	reg			i_setn;

	dff_active_low_set	dut(
		.o_q			(o_q			),	
		.i_d			(i_d			),	
		.i_clk			(i_clk			),	
		.i_setn			(i_setn			));	


	initial					i_clk	= 1'b1;
	always	#(500/`SYSFREQ)	i_clk = ~i_clk;

	integer			i,j;
	initial begin
		i_d		= $urandom;
		i_setn	= 1'b0;
		#(4*`CLKPERIOD);
		i_setn	= 1'b1;
		for(i=0; i<`SIMCYCLE; i=i+1) begin
			j = $urandom_range(0,10);
			#( (j*0.1)		*`CLKPERIOD);
			i_d = $urandom;	
			#( (1-(j*0.1))	*`CLKPERIOD);
		end
		$finish;
	end

endmodule
