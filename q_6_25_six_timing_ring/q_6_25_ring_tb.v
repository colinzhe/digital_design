module q_6_25_ring_tb;
    reg rstb, clk, cnt_en;
    wire [5:0] out;

    q_6_25_ring dut (
        rstb, clk, cnt_en,
        out
    );

    initial
    begin
        {rstb, clk, cnt_en} = 3'b000;
    end

    initial
    fork
        forever #5 clk = ~clk;
        #500 $finish;
    join

    initial
    begin
        #10 rstb = 1'b1;
        #10 cnt_en = 1'b1;
        #20 cnt_en = 1'b0;
        #30 cnt_en = 1'b1;
        #120 rstb = 1'b0;
        #50 rstb = 1'b1;
    end
endmodule
