module q_6_26_tb;
    reg rstb, clk, cnt_en;
    wire [2:0] count;
    wire y;

    q_6_26 dut (
        rstb, clk, cnt_en,
        count, y
    );

    initial
    begin
        {rstb, clk, cnt_en} = 3'b000;
    end

    initial
    begin
        forever #5 clk = ~clk;
    end

    initial
    begin
        #500 $finish;
    end

    initial
    fork
        #10 rstb = 1'b1;
        #20 cnt_en = 1'b1;
        #100 cnt_en = 1'b0;
        #130 cnt_en = 1'b1;
        #140 rstb = 1'b0;
        #150 cnt_en = 1'b0;
        #160 rstb = 1'b1;
        #170 cnt_en = 1'b1;
    join
endmodule
