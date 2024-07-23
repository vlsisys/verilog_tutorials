# ==================================================
#	[ VLSISYS Lab. ]
#	* Author		: Woong Choi (woongchoi@sm.ac.kr)
#	* Filename		: Makefile
#	* Description	: 
# ==================================================

MODULE		= counter
#RUN_FLAGS	= +vcd

all:	gtkwave

#V$(MODULE).mk: $(MODULE).v $(MODULE).tb.cpp
verilate: $(MODULE).v tb.cpp
	#verilator -Wall --trace -cc $(MODULE).v --exe $(MODULE).tb.cpp
	verilator -Wall --trace -cc $(MODULE).v --exe tb.cpp

build: verilate
	make -C obj_dir -f V$(MODULE).mk

run: build
	./obj_dir/V$(MODULE) $(RUN_FLAGS)

gtkwave: run ./counter.vcd
	gtkwave	$(MODULE).vcd &

clean:
	rm -rf ./obj_dir *.vcd

.PHONY:	gtkwave clean $(MODULE).vcd
