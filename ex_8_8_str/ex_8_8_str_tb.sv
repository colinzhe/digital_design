import ex_8_8_pkg::*;

module ex_8_8_str_tb;
    reg rstb, clk, start;
    reg [r1_size-1:0] data;
    wire [r2_size-1:0] count;
    wire rdy;
    wire [1:0] state;

    ex_8_8_str dut (
        rstb, clk, start, data,
        count, rdy
    );

    assign state = {dut.controller_0.G1, dut.controller_0.G0};

    initial #650 $finish;

    initial
    begin
        {rstb, clk, start} = 3'b000;
        forever #5 clk = ~clk;
    end

    initial
    fork
        #4 rstb = 1'b1; data = 8'hFF;
        #25 start = 1'b1;
        #27 rstb = 1'b0;
        #29 rstb = 1'b1;
        #40 start = 1'b0;
        #55 start = 1'b1;
        #65 start = 1'b0;
        #345 data = 8'hAA;
        #355 rstb = 1'b0;
        #365 rstb = 1'b1;
        #395 start = 1'b1;
        #405 start = 1'b0;
    join
endmodule
