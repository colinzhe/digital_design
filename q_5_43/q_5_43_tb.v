module q_5_43_tb;
    reg rstn, clk;
    wire [2:0] y_out;

    q_5_43 dut (
        rstn, clk,
        y_out
    );

    initial
    begin
        {rstn, clk} = 2'b00;
    end

    initial
    fork
        #10 rstn = 1'b1;
        #200 $finish;
    join

    initial
    begin
        forever #5 clk = ~clk;
    end
endmodule
