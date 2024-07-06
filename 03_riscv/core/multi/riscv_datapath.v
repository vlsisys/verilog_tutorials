// ==================================================
//	[ VLSISYS Lab. ]
//	* Author		: Woong Choi (woongchoi@sm.ac.kr)
//	* Filename		: riscv_datapath.v
//	* Description	: 
// ==================================================
`ifndef	DELINC
	`include	"/home/woong/projects/verilog_tutorials/03_riscv/core/common/riscv_alu.v"
	`include	"/home/woong/projects/verilog_tutorials/03_riscv/core/common/riscv_configs.v"
	`include	"/home/woong/projects/verilog_tutorials/03_riscv/core/common/riscv_dff.v"
	`include	"/home/woong/projects/verilog_tutorials/03_riscv/core/common/riscv_dff_enabled.v"
	`include	"/home/woong/projects/verilog_tutorials/03_riscv/core/common/riscv_immext.v"
	`include	"/home/woong/projects/verilog_tutorials/03_riscv/core/common/riscv_mem.v"
	`include	"/home/woong/projects/verilog_tutorials/03_riscv/core/common/riscv_regfile.v"
`endif

module riscv_datapath
#(	
	parameter	BW_DATA			= 32,
	parameter	BW_ADDR			= 4,
	parameter	BW_CTRL			= 4
)
(	
	output reg	[BW_DATA-1:0]	o_dp_mem_addr,
	output reg	[BW_DATA-1:0]	o_dp_mem_data,
	output reg					o_valid,
	input		[BW_DATA-1:0]	i_data,
	input		[BW_ADDR-1:0]	i_addr,
	input		[BW_CTRL-1:0]	i_ctrl,
	input						i_clk,
	input						i_rstn
);

	wire		[BW_DATA-1:0]	o_dff_q;
	wire		[BW_DATA-1:0]	i_dff_d;
	wire						i_en;

	//	PCNext -> PC
	riscv_dff_enabled
	#(
		.BW_DATA			(BW_DATA			)
	)
	u_riscv_dff_enabled_pc(
		.o_dff_q			(o_dff_q			),
		.i_dff_d			(i_dff_d			),
		.i_en				(i_en				),
		.i_clk				(i_clk				),
		.i_rstn				(i_rstn				)
	);


endmodule
