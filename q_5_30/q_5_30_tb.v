module q_5_30_tb;
    reg clk, A, B, C;
    wire Q, E;

    q_5_30 dut (
        clk, A, B, C,
        Q, E
    );

    initial
    begin
        {clk, A, B, C} = 4'h0;
        #200 $finish;
    end

    initial
    begin
        forever #5 clk = ~clk;
    end

    initial
    begin
        forever #10 {A, B, C} = $random;
    end
endmodule
