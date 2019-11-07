module q_6_6_tb;
    reg rstn, clk, load, shift, SI;
    reg [3:0] I;
    wire SO;
    wire [3:0] A;

    q_6_6 dut (
        rstn, clk, load, shift, I, SI,
        SO, A
    );

    initial
    begin
        {rstn, clk, load, shift} = 4'b0000;
        I = 4'b0000;
        SI = 1'b0;
        forever #5 clk = ~clk;
    end

    initial
    begin
        #10 rstn = 1'b1;
        #10 I = 4'b1010;
        #50 load = 1'b1;
        #20 shift = 1'b1;
        #50 SI = 1'b1;
        #10 load = 1'b0;
        #50 shift = 1'b0;
        #10 rstn = 1'b0;
        #10 load = 1'b1;
        #10 shift = 1'b1;
        #10 load = 1'b0;
        #10 rstn = 1'b1;
        #10 load = 1'b1;
        #20 shift = 1'b0;
        #50 $finish;
    end
endmodule
