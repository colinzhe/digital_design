module q_6_44_tb;
    reg rstn, clk, SI, SE;
    wire [3:0] shift_reg_A_out, shift_reg_B_out;
    wire x, y, Cin, Sum, Cout;

    q_6_44 dut (
        rstn, clk, SI, SE,
        shift_reg_A_out, shift_reg_B_out,
        x, y, Cin, Sum, Cout
    );

    initial
    begin
        {rstn, clk, SI, SE} = 4'b0000;
    end

    initial
    fork 
        forever #5 clk = ~clk;
        forever #10 SI = $random;
        #1000 $finish;
    join

    initial
    begin
        #10 rstn = 1'b1; SE = 1'b1;
        #200 rstn = 1'b0;
        #10 SE = 1'b0;
        #20 SE = 1'b1;
        #50 rstn = 1'b1;
        #20 SE = 1'b0;
        #50 SE = 1'b1;
        #50 SE = 1'b0;
        #20 SE = 1'b1;
    end
endmodule
