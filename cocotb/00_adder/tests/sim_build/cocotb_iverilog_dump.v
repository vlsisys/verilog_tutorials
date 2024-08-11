module cocotb_iverilog_dump();
initial begin
    $dumpfile("/home/woong/projects/verilog_tutorials/cocotb/00_adder/tests/sim_build/adder.fst");
    $dumpvars(0, adder);
end
endmodule
