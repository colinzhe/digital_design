module four_bit_serial_sub_tb;
    reg rstn, clk, SI;
    reg [1:0] sel;
    wire [3:0] shift_reg_A_out, shift_reg_B_out;
    wire Q, Sum, J, K;

    four_bit_serial_sub dut (
        rstn, clk, SI, sel,
        shift_reg_A_out, shift_reg_B_out,
        Q, Sum, J, K
    );

    initial
    begin
        {rstn, clk, SI} = 3'b000;
        sel = 2'b00;
        forever #5 clk = ~clk;
    end

    initial
    begin
        #10 rstn = 1'b1; SI = 1'b0; sel = 2'b11;
        #10 sel = 2'b01;
        #40 $finish;
    end
endmodule
