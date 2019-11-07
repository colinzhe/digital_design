module four_bit_shift_reg_tb;
    reg rstn, clk, SI, SE;
    wire SO;
    wire [3:0] shift_reg;

    four_bit_shift_reg dut (
        rstn, clk, SI, SE,
        SO, shift_reg
    );

    initial
    begin
        {rstn, clk, SI, SE} = 4'b0000;
    end

    initial
    fork
        #10 rstn = 1'b1;
        forever #5 clk = ~clk;
        forever #10 SI = $random;
        forever #10 SE = $random;
        #200 $finish;
    join
endmodule
