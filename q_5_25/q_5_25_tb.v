module q_5_25_tb;
    reg rstn, clk;
    reg [1:0] sel;
    reg [3:0] D;
    wire Q;

    q_5_25 dut (
        rstn, clk, sel, D,
        Q
    );

    always
        #5 clk = ~clk;

    initial
    begin
        {rstn, clk, sel, D} = 8'h00;
        #10 rstn = 1'b1;
    end

    initial
    fork
        #20 D = 4'b1010;
        #30 sel = 2'b01;
        #40 sel = 2'b10;
        #50 sel = 2'b11;
        #60 D = 4'b0101;
        #70 sel = 2'b10;
        #80 sel = 2'b01;
        #90 sel = 2'b00;
        #100 rstn = 1'b0;
    join

    initial
    begin
        #200 $finish;
    end
endmodule
