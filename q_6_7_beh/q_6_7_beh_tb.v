module q_6_7_beh_tb;
    reg clk;
    reg [1:0] sel;
    reg [3:0] I;
    wire [3:0] A;

    q_6_7_beh dut (
        clk, sel, I,
        A
    );

    initial
    begin
        {clk, sel} = 3'b001;
        I = 4'b0000;
        forever #5 clk = ~clk;
    end

    initial
    begin
        #10 I = 4'b1010;
        #10 sel = 2'b00;
        #20 sel = 2'b11;
        #20 I = 4'b0011;
        #20 sel = 2'b00;
        #20 I = 4'b1100;
        #20 sel = 2'b10;
        #20 I = 4'b1111;
        #20 sel = 2'b11;
        #20 sel = 2'b01;
        #20 $finish;
    end
endmodule
