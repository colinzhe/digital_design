module q_5_19_tb;
    reg rstn, clk, x_in;
    wire y_out;
    wire [2:0] state;

    q_5_19 dut (
        rstn, clk, x_in,
        y_out, state
    );

    always
    begin
        #5 clk = ~clk;
        #10 x_in = $random;
    end

    initial
    fork
        {rstn, clk, x_in} = 3'b000;
        #10 rstn = 1'b1;
        // #20 {E, F} = 2'b01;
        // #100 {E, F} = 2'b00;
        // #200 {E, F} = 2'b11;
        // #300 {E, F} = 2'b10;
        // #420 rstn = 1'b0;
        #1000 $finish;
    join
endmodule
