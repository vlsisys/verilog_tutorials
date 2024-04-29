module	mux2to1_gatelevel_tb;

	wire	o_out;

	reg		i_sel;
	reg		i_in0;
	reg		i_in1;

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
		$monitor ("T=%0t:	sel=%0b	in0/1=%0b/%0b",	$time,	i_sel, i_in0, i_in1);
		for	(i=0; i<10; i++) begin
			#1
			i_sel	= $random;
			i_in0	= $random;
			i_in1	= $random;
		end
	end
endmodule
