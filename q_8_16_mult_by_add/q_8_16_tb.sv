import q_8_16_pkg::*;

module q_8_16_tb;
    reg rst_b, clk, start;
    reg [data_width-1:0] A, B;
    wire [data_width*2-1:0] P;
    wire rdy;

    q_8_16 dut (.*);

    wire state = dut.state;
    wire load = dut.load;
    wire add = dut.add;
    wire decr_cntr = dut.decr_cntr;
    wire cntr_eq_zero = dut.cntr_eq_zero;
    wire [data_width-1:0] RA = dut.RA;
    wire [data_width-1:0] RB = dut.RB;
    wire [data_width*2-1:0] RP = dut.RP;

    initial #300 $finish; // tb duration

    initial
    begin : init_and_clocks
        {rst_b, clk, start} = 3'b000;
        A = {data_width{1'b0}};
        B = {data_width{1'b0}};
        forever #5 clk = ~clk;
    end : init_and_clocks

    initial
    begin : tb
        #10 rst_b = 1'b1; // release reset
        A = 4'h5; B = 4'h4; // init values
        start = 1'b1; // start controller
        #10 start = 1'b0;
        #60 A = 4'hF; B = 4'hF; // init values
        start = 1'b1; // start controller
        #10 start = 1'b0;
        #50 rst_b = 1'b0;
        #10 rst_b = 1'b1;
    end
endmodule
