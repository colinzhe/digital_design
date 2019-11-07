module moore_binary_counter_tb;
    reg rstn, clk, x_in;
    wire y_out_beh;
    wire y_out_str, A_str, B_str;

    moore_binary_counter_beh dut1 (
        rstn, clk, x_in,
        y_out_beh
    );

    moore_binary_counter_str dut2 (
        rstn, clk, x_in,
        y_out_str, A_str, B_str
    );

    initial
    begin
        {rstn, clk, x_in} = 3'b000;
        #200 $finish;
    end

    initial
    begin
        #5 rstn = 1;
        repeat (16) #5 clk = ~clk;
    end

    initial
    begin
        #15 x_in = 1;
        repeat (8) #10 x_in = ~x_in;
    end
endmodule
