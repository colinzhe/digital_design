import q_8_7_pkg::*;

module q_8_7_tb;
    reg rst_b, clk, start;
    reg [7:0] A, B;
    wire [7:0] result;
    wire rdy;
    
    q_8_7 dut (
        rst_b, clk, start,
        A, B,
        result, rdy
    );

    wire [st_width-1:0] state = dut.controller_0.state;
    wire load_regs = dut.load_regs;
    wire sub_regs = dut.sub_regs;
    wire pos = dut.pos;
    wire comp = dut.comp;
    wire borrow = dut.borrow;
    wire [7:0] RA = dut.datapath_0.RA;
    wire [7:0] RB = dut.datapath_0.RB;
    wire [7:0] RC = dut.datapath_0.RC;

    initial #600 $finish;

    initial
    begin
        {rst_b, clk, start} = 3'b000;
        forever #5 clk = ~clk;
    end

    initial
    begin
        A = 8'b0101_0100; B = 8'b0100_0011;
        #10 rst_b = 1'b1; start = 1'b1;
        #10 start = 1'b0;
        #50 B = 8'b01001_0100; A = 8'b0100_0011;
        #10 start = 1'b1;
        #10 start = 1'b0;
        #50 A = 8'd50; B = 8'd20;
        #10 start = 1'b1;
        #10 start = 1'b0;
        #50 A = 8'd20; B = 8'd50;
        #10 start = 1'b1;
        #10 start = 1'b0;
        #50 A = 8'd50; B = 8'd50;
        #10 start = 1'b1;
        #10 start = 1'b0;
        #50 A = 8'd10; B = 8'd40;
        #10 start = 1'b1;
        #10 start = 1'b0;
        #10 rst_b = 1'b0;
        #10 rst_b = 1'b1;
        #50 A = 8'b1111_11111; B = 8'b1111_1111;
        #10 start = 1'b1;
        #10 start = 1'b0;
    end
endmodule
