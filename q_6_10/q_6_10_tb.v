module q_6_10_tb;
    reg rstn, clk, shift, load, SI;
    reg [3:0] I;
    wire [3:0] A;
    wire y;

    q_6_10 dut (
        rstn, clk, shift, load, SI, I,
        A, y
    );

    initial
    begin
        {rstn, clk, shift, load, SI} = 5'b00000;
        I = 4'b0000;
        forever #5 clk = ~clk;
    end

    initial
    begin
        forever #10 SI = $random;
    end

    initial
    begin
        #10 rstn = 1'b1; I = 4'b1100;
        #20 load = 1'b1;
        #20 load = 1'b0; shift = 1'b1;
        #50 rstn = 1'b0;
        #10 rstn = 1'b1;
        #100 $finish;
    end
endmodule
