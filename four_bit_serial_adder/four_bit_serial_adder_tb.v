module four_bit_serial_adder_tb;
    reg rstn, clk, SI, SE;
    wire [3:0] shift_reg_A_out, shift_reg_B_out;
    wire Q, x, y, Cin, Sum, Cout;

    four_bit_serial_adder dut (
        rstn, clk, SI, SE,
        shift_reg_A_out, shift_reg_B_out,
        Q, x, y, Cin, Sum, Cout
    );

    initial
    begin
        {rstn, clk, SI, SE} = 4'b0000;
    end

    initial
    fork
        #10 rstn = 1'b1; SE = 1'b1;
        forever #5 clk = ~clk;
        forever #10 SI = $random;
        #200 $finish;
    join
endmodule
