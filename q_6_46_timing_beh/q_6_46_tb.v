module q_6_46_tb;
    reg rstb, clk;
    wire [5:0] count;

    q_6_46 dut (
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
        #200 rstb = 1'b0;
        #50 rstb = 1'b1;
    end
endmodule
