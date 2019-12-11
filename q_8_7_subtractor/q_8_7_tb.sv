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
    wire borrow = dut.borrow;
    wire comp = dut.comp;
    wire [8:0] RA = dut.datapath_0.RA;
    wire [8:0] RB = dut.datapath_0.RB;
    wire [8:0] RC = dut.datapath_0.RC;

    initial #500 $finish;

    initial
    begin
        {rst_b, clk, start} = 3'b000;
        forever #5 clk = ~clk;
    end

    initial
    begin
        A = 8'b01010100; B = 8'b01000011;
        #10 rst_b = 1'b1; start = 1'b1;
        #10 start = 1'b0;
        #50 B = 8'b01010100; A = 8'b01000011;
        #10 start = 1'b1;
        #10 start = 1'b0;
    end
endmodule
