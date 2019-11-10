module q_6_23_tb;
    reg rstb, clk, cnt_en;
    wire [3:0] count;
    wire y;

    q_6_23 dut (
        rstb, clk, cnt_en,
        count,
        y
    );

    initial
    begin
        {rstb, clk, cnt_en} = 3'b000;
    end

    initial
    fork
        forever #5 clk = ~clk;
        #1000 $finish;
    join

    initial
    fork
        #10 rstb = 1'b1;
        #20 cnt_en = 1'b1;
        #30 cnt_en = 1'b0;
        #70 cnt_en = 1'b1;
        #100 cnt_en = 1'b0;
        #180 cnt_en = 1'b1;
        #200 rstb = 1'b0;
        #210 rstb = 1'b1;
    join
endmodule
