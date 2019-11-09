module q_6_20_tb;
    reg rstb, clk, cnt_en;
    wire [7:0] count;
    wire carry;

    q_6_20 dut (
        rstb, clk, cnt_en,
        count,
        carry
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
        #10 rstb = 1'b1;
        #10 cnt_en = 1'b1;
        #1980 $finish;
    end
endmodule
