module	mux2to1_gatelevel(
	output		o_out,
	input		i_sel,
	input		i_in0,
	input		i_in1
);
	wire		sel_n;
	wire		out_0;
	wire		out_1;

	not	u_not0	(sel_n , i_sel         ) ;
	and	u_and0	(out_0 , i_in0 , sel_n ) ;
	and	u_and1	(out_1 , i_in1 , i_sel ) ;
	or	u_or0	(o_out , out_0 , out_1 ) ;

endmodule
