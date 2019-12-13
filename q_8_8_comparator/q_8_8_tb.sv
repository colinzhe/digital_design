import q_8_8_pkg::*;

module q_8_8_tb;
    reg rst_b, clk, start;
    reg [15:0] A, B;
    wire [15:0] C;
    wire carry, rdy;

    q_8_8 dut (.*);

    wire [15:0] RA = dut.RA;
    wire [15:0] RB = dut.RB;
    wire [15:0] RC = dut.RC;
    wire load_regs = dut.load_regs;
    wire div = dut.div;
    wire mul = dut.mul;
    wire clr = dut.clr;
    wire RA_lt_0 = dut.RA_lt_0;
    wire RA_gt_0 = dut.RA_gt_0;
    wire RA_eq_0 = dut.RA_eq_0;
    wire [st_width-1:0] state = dut.state;

    initial #500 $finish;

    initial
    begin
        {rst_b, clk, start} = 3'b000;
        forever #5 clk = ~clk;
    end

    initial
    begin
        #10 rst_b = 1'b1;
        A = 16'h5555; B = 16'h1234;
        start = 1'b1;
        #10 start = 1'b0;
        #50 A = 16'h0000; B = 16'hFFFF;
        start = 1'b1;
        #10 start = 1'b0;
        #50 A = 16'hAAA5; B = 16'h5500;
        start = 1'b1;
        #10 start = 1'b0;
        #50 A = 16'h0FFF; B = 16'h7FFF;
        start = 1'b1;
        #10 start = 1'b0;
        #50 A = 16'h0001; B = 16'hFFFF;
        start = 1'b1;
        #10 start = 1'b0;
        #50 A = 16'h3211; B = 16'hE4AC;
        start = 1'b1;
        #10 rst_b = 1'b0; start = 1'b0;
        #10 rst_b = 1'b1;
    end
endmodule
