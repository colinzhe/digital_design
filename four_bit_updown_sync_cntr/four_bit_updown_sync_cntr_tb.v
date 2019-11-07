module four_bit_updown_sync_cntr_tb;
    reg rstn, clk, up, down;
    wire [3:0] count;
    wire carry;
    wire [3:0] T_in;

    four_bit_updown_sync_cntr dut (
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
        forever #10 {up, down} = $random;
        #1000 $finish;
    join
endmodule
