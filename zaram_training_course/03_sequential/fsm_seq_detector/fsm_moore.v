// ==================================================
//	[ VLSISYS Lab. ]
//	* Author		: Woong Choi (woongchoi@sm.ac.kr)
//	* Filename		: fsm_moore.v
//	* Date			: 2024-06-24 16:18:38
//	* Description	: '1011' sequence detector
// ==================================================

module fsm_moore
(	
	output reg	o_out,
	input		i_seq,
	input		i_clk,
	input		i_rstn
);

	localparam	S_IDLE = 3'b000;
	localparam	S_H    = 3'b001;
	localparam	S_HL   = 3'b010;
	localparam	S_HLH  = 3'b011;
	localparam	S_HLHH = 3'b100;

	reg	[2:0]	cState;
	reg	[2:0]	nState;

	reg			seq;

	//	State Register
	always @(posedge i_clk or negedge i_rstn) begin
		if(!i_rstn) begin
			cState	<= 0;
			seq		<= 0;
		end else begin
			cState	<= nState;
			seq		<= i_seq;
		end
	end

	//	Next State Logic
	always @(*) begin
		if(seq==1'b0) begin
			case(cState)
				S_IDLE	:	nState	= S_IDLE;
				S_H		:	nState	= S_HL;
				S_HL	:	nState	= S_IDLE;
				S_HLH	:	nState	= S_HL;
				S_HLHH	:	nState	= S_IDLE;
			endcase
		end else begin
			case(cState)
				S_IDLE	:	nState	= S_H;
				S_H		:	nState	= S_H;
				S_HL	:	nState	= S_HLH;
				S_HLH	:	nState	= S_HLHH;
				S_HLHH	:	nState	= S_H;
			endcase
		end
	end

	//	Output Logic
	always @(*) begin
		case(cState)
			S_HLHH	:	o_out	= 1'b1;
			default	:	o_out	= 1'b0;
		endcase
	end

	`ifdef	DEBUG
		reg	[32*8-1:0]	stateMonitor;
		always @(*) begin
			case(cState)
				S_IDLE	:	stateMonitor	= "S_IDLE";
				S_H		:	stateMonitor	= "S_H";
				S_HL	:	stateMonitor	= "S_HL";
				S_HLH	:	stateMonitor	= "S_HLH";
				S_HLHH	:	stateMonitor	= "S_HLHH";
			endcase
		end
	`endif

endmodule
