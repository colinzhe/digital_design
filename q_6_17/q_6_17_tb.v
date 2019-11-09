module q_6_17_tb;
    reg rstb, clk;
    wire [3:0] count;

    q_6_17 dut (
        rstb, clk,
        count
    );

    initial
    begin
        #200 $finish;
    end

    initial
    begin
        {rstb, clk} = 2'b00;
    end

    initial
    begin
        forever #5 clk = ~clk;
    end

    initial
    begin
        #10 rstb = 1'b1;
    end
endmodule
