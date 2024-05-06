`timescale  1ns/1ps
`define     tWR         2
`define     tRD         2
module  spram_async#(
    parameter   ADDR_WIDTH  = 4,
    parameter   DATA_WIDTH  = 32
)(
    output      [DATA_WIDTH-1:0]        o_data,
    input       [DATA_WIDTH-1:0]        i_data,
    input                               i_cen,
    input                               i_wen,
    input                               i_oen,
    input       [ADDR_WIDTH-1:0]        i_addr, 
    input                               i_clk
);
    reg         [DATA_WIDTH-1:0]        mem[0:2**ADDR_WIDTH-1];
    always @(posedge i_clk) begin
        if(!i_cen && !i_wen) begin
            #(`tWR)     mem[i_addr] <= i_data;
        end else begin
            mem[i_addr] <= mem[i_addr];
        end
    end
    reg                                 oen;
    reg         [DATA_WIDTH-1:0]        data;
    always @(posedge i_clk) begin
        oen <= i_oen;
        if(!i_cen && i_wen) begin
            if(!i_oen) begin
                #(`tRD) data    <= mem[i_addr];
            end
        end
    end
    assign  o_data = oen ? 'dz : data;
endmodule

