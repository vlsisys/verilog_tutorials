# ==================================================
#	[ VLSISYS Lab. ]
#	* Author		: Woong Choi (woongchoi@sm.ac.kr)
#	* Filename		: Makefile
#	* Description	: 
# ==================================================

MODULE	= counter

all:	gtkwave

V$(MODULE).mk: $(MODULE).v $(MODULE).tb.cpp
	verilator -Wall --trace -cc $(MODULE).v --exe $(MODULE).tb.cpp

V$(MODULE): V$(MODULE).mk
	make -C obj_dir -f V$(MODULE).mk

$(MODULE).vcd: V$(MODULE)
	./obj_dir/v$(module)

gtkwave: $(MODULE).vcd
	gtkwave	$(MODULE).vcd &

clean:
	rm -rf ./obj_dir

.PHONY:	gtkwave clean $(MODULE).vcd
