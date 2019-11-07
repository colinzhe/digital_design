module q_5_54_tb;
    reg rstn, clk;
    reg [1:0] x_in;
    wire y_out;

    q_5_54 dut (
        rstn, clk, x_in,
        y_out
    );

    initial
    begin
        {rstn, clk, x_in} = 4'b0000;
        #10 rstn = 1'b1;
    end

    initial
    begin
        #1000 $finish;
    end

    always
    begin
        #5 clk = ~clk;
    end

    initial
    begin
        forever #10 x_in = $random;
    end
endmodule
