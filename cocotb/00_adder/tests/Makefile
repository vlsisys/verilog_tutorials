# Makefile

PWD				= $(shell pwd)
# defaults
SIM				= icarus
WAVES			= 1
TOPLEVEL_LANG	= verilog
VERILOG_SOURCES	+= $(PWD)/../hdl/addr.v
TOPLEVEL		= adder					# verilog top module
MODULE			= tb_adder				# python name

# include cocotb's make rules to take care of the simulator setup
include	$(shell cocotb-config --makefiles)/Makefile.sim
