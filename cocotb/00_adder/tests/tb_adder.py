#! /usr/bin/python3

# This file is public domain, it can be freely copied without restrictions.
# SPDX-License-Identifier: CC0-1.0
# Simple tests for an adder module
import os
import random
import sys
from pathlib import Path

import cocotb
from cocotb.triggers import Timer
from cocotb.runner import get_runner

if cocotb.simulator.is_running():
    from adder  import adder


#@cocotb.test()
#async def adder_basic_test(dut):
#    """Test for 5 + 10"""
#
#    A = 5
#    B = 10
#
#    dut.i_a.value = A
#    dut.i_b.value = B
#
#    await Timer(2, units="ns")
#
#    assert dut.o_s.value == adder(A, B), f"Adder result is incorrect: {dut.o_s.value} != 15"


@cocotb.test()
async def adder_randomised_test(dut):
    """Test for adding 2 random numbers multiple times"""
    for i in range(10):
        A = random.randint(0, 15)
        B = random.randint(0, 15)

        dut.i_a.value = A
        dut.i_b.value = B

        await Timer(2, units="ns")

        assert dut.o_s.value == adder(A, B), f"Randomised test failed with: {dut.i_a.value} + {dut.i_b.value} = {dut.i_s.value}"


def test_adder_runner():
    """Simulate the adder example using the Python runner.

    This file can be run directly or via pytest discovery.
    """
    hdl_toplevel_lang = os.getenv("HDL_TOPLEVEL_LANG", "verilog")
    sim = os.getenv("SIM", "icarus")

    proj_path = Path(__file__).resolve().parent.parent
    # equivalent to setting the PYTHONPATH environment variable
    sys.path.append(str(proj_path / "model"))

    sources = [proj_path / "hdl" / "adder.v"]


    # equivalent to setting the PYTHONPATH environment variable
    sys.path.append(str(proj_path / "tests"))

    runner = get_runner(sim)
    runner.build(
        sources=sources,
        hdl_toplevel="adder",
        always=True,
        waves=True
    )
    runner.test(
        hdl_toplevel="adder", test_module="tb_adder"
    )


if __name__ == "__main__":
    test_adder_runner()
