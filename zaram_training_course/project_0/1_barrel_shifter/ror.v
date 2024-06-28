// ==================================================
//	[ VLSISYS Lab. ]
//	* Author		: Woong Choi (woongchoi@sm.ac.kr)
//	* Filename		: ror.v
//	* Date			: 2024-06-28 16:34:59
//	* Description	: 8-bit Rotate Right Barrel Shifter
// ==================================================

module ror
(	
	output reg	[7:0]	o_data,
	input		[7:0]	i_data,
	input		[2:0]	i_samt
);
	
	//	2^2 Stage
	mx2
	u_mx2_0(
		.o_data				(o_data			),
		.i_data_0			(i_data[0]		),
		.i_data_1			(i_data[4]		),
		.i_select			(i_samt[2]		)
	);

	mx2
	u_mx2_1(
		.o_data				(o_data			),
		.i_data_0			(i_data[1]		),
		.i_data_1			(i_data[5]		),
		.i_select			(i_samt[2]		)
	);

	mx2
	u_mx2_2(
		.o_data				(o_data			),
		.i_data_0			(i_data[2]		),
		.i_data_1			(i_data[6]		),
		.i_select			(i_samt[2]		)
	);

	mx2
	u_mx2_3(
		.o_data				(o_data			),
		.i_data_0			(i_data[3]		),
		.i_data_1			(i_data[7]		),
		.i_select			(i_samt[2]		)
	);

	mx2
	u_mx2_4(
		.o_data				(o_data			),
		.i_data_0			(i_data[4]		),
		.i_data_1			(i_data[1]		),
		.i_select			(i_samt[2]		)
	);

	mx2
	u_mx2_5(
		.o_data				(o_data			),
		.i_data_0			(i_data[5]		),
		.i_data_1			(i_data[2]		),
		.i_select			(i_samt[2]		)
	);

	mx2
	u_mx2_6(
		.o_data				(o_data			),
		.i_data_0			(i_data[6]		),
		.i_data_1			(i_data[3]		),
		.i_select			(i_samt[2]		)
	);

	mx2
	u_mx2_7(
		.o_data				(o_data			),
		.i_data_0			(i_data[7]		),
		.i_data_1			(i_data[4]		),
		.i_select			(i_samt[2]		)
	);




endmodule


module	mx2
(
	output		o_data,
	input		i_data_0,
	input		i_data_1,
	input		i_select
);
	assign	o_data	= i_select ? i_data_1 : i_data_0;

endmodule

