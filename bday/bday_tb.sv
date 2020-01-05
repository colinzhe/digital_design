import bday_pkg::*;
`define arry_cntr_method
module bday_tb;
    reg rst_b, clk;
`ifdef state_method
    reg start;
`endif
    wire [6:0] led [3:0];

    bday dut (.*);

    wire clk_d = dut.clk_d;
`ifdef state_method
    wire [4:0] state = dut.state;
`endif

    initial #2000 $finish; // tb duration

    initial
    begin : init_and_clk
        {rst_b, clk} = '0;
`ifdef state_method
        start = '0;
`endif
        forever #5 clk = ~clk;
    end : init_and_clk

    initial
    begin : tb
        #10 rst_b = '1;
`ifdef state_method
        #30 start = '1;
`endif
    end : tb
endmodule
