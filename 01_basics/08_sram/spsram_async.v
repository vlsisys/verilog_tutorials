// ==================================================
//	[ VLSISYS Lab. ]
//	* Author		: Woong Choi (woongchoi@sm.ac.kr)
//	* Filename		: spsram_async.v
//	* Date			: 2024-05-15 21:29:10
//	* Description	: Single Port Async. SRAM
// ==================================================
module spsram_async
#(	
	parameter	BW_DATA	= 32,
	parameter	BW_CTRL	= 4
)
(	
	output reg	[BW_DATA-1:0]	o_data,
	input		[BW_DATA-1:0]	i_data`,
	input		[BW_CTRL-1:0]	i_ctrl,
	input						i_clk,
	input						i_rstn
);

endmodule

//`define     tWR         2
//`define     tRD         2
//
//module spram_async
//#(
//	parameter   BW_ADDR  = 4,
//	parameter   BW_DATA  = 32
//)(
//    output      [BW_DATA-1:0]        o_data,
//    input       [BW_DATA-1:0]        i_data,
//    input                               i_cen,
//    input                               i_wen,
//    input                               i_oen,
//    input       [BW_ADDR-1:0]        i_addr, 
//    input                               i_clk
//);
//    reg         [BW_DATA-1:0]        mem[0:2**BW_ADDR-1];
//    always @(posedge i_clk) begin
//        if(!i_cen && !i_wen) begin
//            #(`tWR)     mem[i_addr] <= i_data;
//        end else begin
//            mem[i_addr] <= mem[i_addr];
//        end
//    end
//    reg                                 oen;
//    reg         [BW_DATA-1:0]        data;
//    always @(posedge i_clk) begin
//        oen <= i_oen;
//        if(!i_cen && i_wen) begin
//            if(!i_oen) begin
//                #(`tRD) data    <= mem[i_addr];
//            end
//        end
//    end
//    assign  o_data = oen ? 'dz : data;
//endmodule
//
