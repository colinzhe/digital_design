module q_8_12_tb;
    reg rst_sync_b, clk, cnt_en;
    wire [3:0] cnt;
    wire carry;

    q_8_12 dut (.*);

    wire N0 = dut.N[0];
    wire N1 = dut.N[1];
    wire N2 = dut.N[2];
    wire N3 = dut.N[3];

    initial #300 $finish;

    initial
    begin : clk_and_reset
        {rst_sync_b, clk, cnt_en} = 3'b000;
        forever #5 clk = ~clk;
    end : clk_and_reset

    initial
    begin : tb
        #10 rst_sync_b = 1'b1;
        #30 cnt_en = 1'b1;
        #100 rst_sync_b = 1'b0;
        #50 rst_sync_b = 1'b1;
        #50 cnt_en = 1'b0;
        #50 cnt_en = 1'b1;
    end
endmodule
