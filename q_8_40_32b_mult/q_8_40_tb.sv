import q_8_40_pkg::*;

module q_8_40_tb;
    reg rst_b, clk, start;
    reg [7:0] M;
    wire rdy, send_output;
    wire [7:0] P;

    q_8_40 dut (.*);

    wire [2:0] state = dut.state;
    wire run = dut.run;
    wire init_regs = dut.init_regs;
    wire calc_done = dut.calc_done;
    wire output_done = dut.output_done;
    wire load_bus = dut.load_bus;
    wire load_done = dut.load_done;

    wire [31:0] A = dut.A;
    wire [31:0] B = dut.B;
    wire [31:0] Q = dut.Q;
    wire C = dut.C;
    wire Q0 = dut.Q[0];
    wire [32:0] CA = {C, A};
    wire [64:0] CAQ = {C, A, Q};
    wire [63:0] AQ = {A, Q};
    wire [5:0] calc_cntr = dut.calc_cntr;
    wire [2:0] load_cntr = dut.load_cntr;

    initial #2000 $finish; // tb duration

    initial
    begin : clk_and_init
        {rst_b, clk, start} = '0;
        M = '0;
        forever #5 clk = ~clk;
    end : clk_and_init

    initial
    fork : tb
        #10 rst_b = 1'b1;
        #10 start = 1'b1;
        #10 M = 8'hAA;
        #20 start = 1'b0;
        //#40 M = 8'hAA;
        //#50 M = 8'hAA;
    join : tb
endmodule
