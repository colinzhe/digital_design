module q_5_28_tb;
    reg rstn, clk;
    reg [1:0] x_in;
    wire y_out_beh, y_out_str;

    q_5_28_beh dut_beh (
        rstn, clk, x_in,
        y_out_beh
    );

    q_5_28_str dut_str (
        rstn, clk, x_in,
        y_out_str
    );

    initial
    begin
        #200 $finish;
    end

    initial
    begin
        {rstn, clk, x_in} = 4'b0000;
        forever #5 clk = ~clk;
    end

    initial
    fork
        #2 rstn = 1;
        #82 rstn = 0;
        #89 rstn = 1;
    join

    initial
    begin
        forever #10 x_in = $random;
    end
endmodule
