module q_6_40_tb;
    reg rstb, clk;
    wire [7:0] count;

    q_6_40 dut (
        rstb, clk,
        count
    );

    initial
    begin
        {rstb, clk} = 2'b00;
    end

    initial
    fork
        forever #5 clk = ~clk;
        #500 $finish;
    join

    initial
    begin
        #10 rstb = 1'b1;
        #250 rstb = 1'b0;
        #30 rstb = 1'b1;
    end
endmodule
