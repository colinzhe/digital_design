module q_6_18_tb;
    reg rstn, clk, up, down;
    wire [3:0] count;
    wire carry;
    wire [3:0] T_in;

    q_6_18 dut (
        rstn, clk, up, down,
        count, carry, T_in
    );

    initial
    begin
        {rstn, clk, up, down} = 4'b0000;
    end

    initial
    fork
        #10 rstn = 1'b1;
        forever #5 clk = ~clk;
        //forever #10 {up, down} = $random;
        #40 {up, down} = 2'b01;
        #200 {up, down} = 2'b10;
        #360 {up, down} = 2'b11;
        #400 {up, down} = 2'b10;
        #450 {up, down} = 2'b01;
        #490 rstn = 1'b0;
        #500 rstn = 1'b1;
        #1000 $finish;
    join
endmodule
