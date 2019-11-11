module q_6_24_str_tb;
    reg rstb, clk;
    wire [2:0] count;

    q_6_24_str dut (
        rstb, clk,
        count
    );

    initial
    begin
        {rstb, clk} = 2'b00;
    end

    initial
    begin
        #500 $finish;
    end

    initial
    fork
        forever #5 clk = ~clk;
    join

    initial
    fork
        #10 rstb = 1'b1;
        #100 rstb = 1'b0;
        #110 rstb = 1'b1;
    join
endmodule
