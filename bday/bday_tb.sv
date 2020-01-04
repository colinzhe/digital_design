module bday_tb;
    reg rst_b, clk, start;
    wire [6:0] led [3:0];

    bday dut (.*);

    wire clk_d = dut.clk_d;
    wire [4:0] state = dut.state;

    initial #1200 $finish; // tb duration

    initial
    begin : init_and_clk
        {rst_b, clk, start} = '0;
        forever #5 clk = ~clk;
    end : init_and_clk

    initial
    begin : tb
        #10 rst_b = '1;
        #30 start = '1;
    end : tb
endmodule
