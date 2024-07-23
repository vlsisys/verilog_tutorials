// ------------------------------------------------------------
//	C++ Standard Libaries
// ------------------------------------------------------------
#include <stdlib.h>
#include <iostream>
#include <cstdlib>

// ------------------------------------------------------------
//	For Common Verilator Routines & VCD (value change dump) File
// ------------------------------------------------------------
#include <verilated.h>
#include <verilated_vcd_c.h>

// ------------------------------------------------------------
//	Verilated DUT
// ------------------------------------------------------------
#include "Vcounter.h"

// ------------------------------------------------------------
//	Track Simulation
// ------------------------------------------------------------
#define MAX_SIM_TIME 20
vluint64_t sim_time = 0;

// ------------------------------------------------------------
//	Functions
// ------------------------------------------------------------
void dutReset(Vcounter *dut, vluint64_t &sim_time){
	dut->i_rstn = 0;
	if (sim_time > 10) {
        dut->i_rstn = 1;
    }
}
//	------------------------------------------------------------
//	Main Function
//	------------------------------------------------------------
int main(int argc, char** argv, char** env)
{	
	//	Verilator Info.
	printf("Built with %s %s.\n", Verilated::productName(), Verilated::productVersion());

	//	Verilator Arguments
	Verilated::commandArgs(argc, argv);

	//	DUT Instanciate
    Vcounter *dut = new Vcounter;

	//	Plus Arguments based VCD
	VerilatedVcdC *vcdTrace = new VerilatedVcdC;
	const char* flag_vcd = Verilated::commandArgsPlusMatch("vcd");
	if (flag_vcd && 0==strcmp(flag_vcd, "+vcd")) {
		Verilated::traceEverOn(true);
		dut->trace (vcdTrace, 99);
		vcdTrace->open("counter.vcd");
	}

    while (sim_time < MAX_SIM_TIME)
	{
		dutReset(dut, sim_time);
        dut->i_clk ^= 1;
        dut->eval();
        if (flag_vcd && 0==strcmp(flag_vcd, "+vcd")) vcdTrace->dump(sim_time);
        sim_time++;
    }

    if (flag_vcd && 0==strcmp(flag_vcd, "+vcd")) vcdTrace->close();
    delete dut;
    exit(EXIT_SUCCESS);
}
