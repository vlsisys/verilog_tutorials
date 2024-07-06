// ==================================================
//	[ VLSISYS Lab. ]
//	* Author		: Woong Choi (woongchoi@sm.ac.kr)
//	* Filename		: example.v
//	* Description	: 
// ==================================================

module example
(	
	output		y,
	input		a, 
	input		b, 
	input		c
);

	wire		ab, bb, cb, n1, n2, n3;
	wire		n4;

	assign	#1	{ab, bb, cb}	=	~{a, b,	c};
	assign	#2				n1	=	ab	&	bb	&	cb;
	assign	#2				n2	=	a	&	bb	&	cb;
	assign	#2				n3	=	a	&	bb	&	c;
	assign	#2				n4	=	a	|	bb	&	cb;
	assign	#4				y	=	n1	|	n2	|	n3;

endmodule 
