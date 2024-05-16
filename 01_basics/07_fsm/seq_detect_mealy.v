// ==================================================
//	[ VLSISYS Lab. ]
//	* Author		: Woong Choi (woongchoi@sm.ac.kr)
//	* Filename		: seq_detect_mealy.v
//	* Description	: 
//		- '1011' Sequence Detect Using Mealy FSM
// ==================================================
module seq_detect_mealy
(	
	output reg					o_out,
	input						i_seq,
	input						i_clk,
	input						i_rstn
);

	reg		[1:0]	cState;
	reg		[1:0]	nState;
	
	// States
	localparam	S_IDLE	=	2'b00;
	localparam	S_H		=	2'b01;
	localparam	S_HL	=   2'b10;
	localparam	S_HLH	=   2'b11;

	// State Register
	always @(posedge i_clk or negedge i_rstn) begin
		if(!i_rstn) begin
			cState	<= S_IDLE;
		end else begin
			cState	<= nState;
		end
	end

	// 'Next State' Comb. Logic
	always @(*) begin
		if(i_seq == 1'b0) begin
			case(cState)
				S_IDLE	:	nState	= S_IDLE;
				S_H		:	nState	= S_HL;
				S_HL	:   nState	= S_IDLE;
				S_HLH	:   nState	= S_HL;
			endcase
		end else begin
			case(cState)
				S_IDLE	:	nState	= S_H;
				S_H		:	nState	= S_H;
				S_HL	:   nState	= S_HLH;
				S_HLH	:   nState	= S_IDLE;
			endcase
		end
	end
	
	// 'Output' Comb. Logic
	always @(*) begin
		case({cState, nState, i_seq})
			{S_HLH, S_IDLE, 1'b1}	:	o_out	= 1'b1;
			default					:	o_out	= 1'b0;
		endcase
	end

endmodule
