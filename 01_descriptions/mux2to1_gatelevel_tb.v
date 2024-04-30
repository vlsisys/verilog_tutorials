`include	"mux2to1_gatelevel.v"

module	mux2to1_gatelevel_tb;

	reg	[8*32-1:0]	vcd_file;

	wire			o_out;

	reg				i_sel;
	reg				i_in0;
	reg				i_in1;

	mux2to1_gatelevel
	dut(
		.o_out	(o_out		),
		.i_sel	(i_sel		),
		.i_in0	(i_in0		),
		.i_in1	(i_in1		)
	);

	integer	i;
	initial begin
		{i_sel, i_in0, i_in1} = 3'b000;
		#(10);
		$monitor("T=%0t		sel=%0b	in0/1=%0b/%0b out=%0b",	$time,	i_sel, i_in0, i_in1, o_out);
		for	(i=0; i<10; i++) begin
			#(1);
				i_sel	= $urandom_range(0,1);
				i_in0	= $urandom_range(0,1);
				i_in1	= $urandom_range(0,1);
			#(9);
		end
	end
	initial begin
		if ($value$plusargs("vcd_file=%s", vcd_file)) begin
			$dumpfile(vcd_file);
			$dumpvars;
		end
	end

	task dispAsFixedPoint;
		input reg	[127:0]					sDescription;
		input		[`DEF_BIT_FULL-1:0]	bIn;
		begin
			$display("[%0s] Binary: %b > Fixed Point Number: %f", sDescription, bIn, bIn*(2.0**-(`DEF_BIT_FRAC)));
		end
	endtask

endmodule
