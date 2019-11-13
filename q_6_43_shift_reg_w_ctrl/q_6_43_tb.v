module q_6_43_tb;
    reg rstb, clk;
    reg [1:0] mode;
    reg [3:0] I;
    wire [3:0] SR_A, SR_B;
    wire SO_A, SO_B;

    q_6_43 dut (
        rstb, clk, mode, I,
        SR_A, SR_B, SO_A, SO_B
    );

    initial
    begin
        {rstb, clk, mode} = 4'b0000;
        I = 4'b0000;
    end

    initial
    fork
        forever #5 clk = ~clk;
        #1000 $finish;
    join

    initial
    begin
        #10 rstb = 1'b1;
        #10 I = 4'b1001;
        #20 I = 4'b1100;
        #10 I = 4'b1011;
        #50 mode = 2'b10;
        #100 mode = 2'b01; I = 4'b0100;
        #40 mode = 2'b00;
        #10 I = 4'b0101;
        #10 mode = 2'b11;
        #10 I = 4'b0010;
        #10 mode = 3'b10;
        repeat (5) #10 I = $random;
        #10 mode = 2'b01;
    end
endmodule
