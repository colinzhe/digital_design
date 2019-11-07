module mealy_zero_detector_tb;
    reg rstn, clk, x_in;
    wire y_out;

    mealy_zero_detector dut (
        rstn, clk, x_in,
        y_out
    );

    initial
    begin
        {rstn, clk, x_in} = 3'b000;
        #200 $finish;
    end

    always
        #5 clk = ~clk;

    initial
    fork
        #2 rstn = 1'b1;
        #87 rstn = 1'b0;
        #89 rstn = 1'b1;
        #10 x_in = 1'b1;
        #30 x_in = 1'b0;
        #40 x_in = 1'b1;
        #50 x_in = 1'b0;
        #52 x_in = 1'b1;
        #54 x_in = 1'b0;
        #70 x_in = 1'b1;
        #100 x_in = 1'b0;
        #120 x_in = 1'b1;
        #160 x_in = 1'b0;
        #170 x_in = 1'b1;
    join
endmodule
