module q_5_18_tb;
    reg rstn, clk, E, F;
    wire [1:0] y_out;

    q_5_18 dut (
        rstn, clk, E, F,
        y_out
    );

    always
    begin
        #5 clk = ~clk;
        // #10 {E, F} = $random;
    end

    initial
    fork
        {rstn, clk, E, F} = 4'b0000;
        #10 rstn = 1'b1;
        #20 {E, F} = 2'b01;
        #100 {E, F} = 2'b00;
        #200 {E, F} = 2'b11;
        #300 {E, F} = 2'b10;
        #420 rstn = 1'b0;
        #1000 $finish;
    join
endmodule
