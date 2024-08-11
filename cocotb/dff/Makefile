# Makefile

PWD				= $(shell pwd)
# defaults
SIM				= icarus
WAVES			= 1
TOPLEVEL_LANG	= verilog
VERILOG_SOURCES	+= dff.v
TOPLEVEL		= dff	
MODULE			= test_dff

# include cocotb's make rules to take care of the simulator setup
include	$(shell cocotb-config --makefiles)/Makefile.sim
