module q_5_42_tb;
    reg rstn, clk, x_in;
    wire y_out, A, B;

    q_5_42 dut (
        rstn, clk, x_in,
        y_out, A, B
    );

    always
    begin
        #5 clk = ~clk;
    end

    always
    begin
        #10 x_in = $random;
    end

    initial
    fork
        {rstn, clk, x_in} = 3'b000;
        #10 rstn = 1'b1;
        #1000 $finish;
    join
endmodule
