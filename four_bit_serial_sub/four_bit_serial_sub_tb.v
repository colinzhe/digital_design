module four_bit_serial_sub_tb;
    reg rstn, clk, SI, SE;
    wire [3:0] shift_reg_A_out, shift_reg_B_out;
    wire Q, x, y, Sum, J, K;

    four_bit_serial_sub dut (
        rstn, clk, SI, SE,
        shift_reg_A_out, shift_reg_B_out,
        Q, x, y, Sum, J, K
    );

    initial
    begin
        {rstn, clk, SI, SE} = 4'b0000;
        forever #5 clk = ~clk;
    end

    initial
    begin
        #10 rstn = 1'b1; SI = 1'b0; SE = 1'b1;
        #10 SI = 1'b1;
        #10 SI = 1'b0;
        #10 SI = 1'b1;
        #10 SI = 1'b0;
        #10 SI = 1'b1;
        #40 $finish;
    end
endmodule
