module q_6_5_tb;
    reg rstn, clk, MSB_in, LSB_in;
    reg [1:0] sel;
    reg [7:0] I;
    wire [7:0] A;

    q_6_5 dut (
        rstn, clk, MSB_in, LSB_in,
        sel, I,
        A
    );

    initial
    begin
        {rstn, clk, MSB_in, LSB_in} = 4'b0000;
        sel = 2'b00;
        I = 8'b0000_0000;
        forever #5 clk = ~clk;
    end

    initial
    begin
        #10 rstn = 1'b1; I = 8'b1010_1010;
        #20 sel = 2'b11;
        #10 sel = 2'b01;
        #20 MSB_in = 1'b1;
        #30 sel = 2'b10;
        #20 LSB_in = 1'b1; I = 8'b1111_0000;
        #10 rstn = 1'b0;
        #10 rstn = 1'b1;
        #10 sel = 2'b11;
        #10 {MSB_in, LSB_in} = 2'b00;
        #30 $finish;
    end
endmodule
