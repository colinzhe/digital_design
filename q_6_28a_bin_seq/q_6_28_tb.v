module q_6_28a_tb;
    reg rstb, clk;
    wire [2:0] count;

    q_6_28a dut (
        rstb, clk,
        count
    );

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
        #200 $finish;
    end

    initial
    begin
        #10 rstb = 1'b1;
        #90 rstb = 1'b0;
        #10 rstb = 1'b1;
    end
endmodule
