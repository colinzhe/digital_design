module four_bit_register_tb;
    reg rstn, clk, load;
    reg [3:0] I;
    wire [3:0] A;

    four_bit_register dut (
        rstn, clk, load, I,
        A
    );

    initial
    begin
        {rstn, clk, load, I} = 7'b0000000;
    end

    initial
    fork
        #10 rstn = 1'b1;
        forever #5 clk = ~clk;
        forever #10 I = $random;
        forever #10 load = $random;
        #200 $finish;
    join
endmodule
