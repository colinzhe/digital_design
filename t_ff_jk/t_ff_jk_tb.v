module t_ff_jk_tb;
    reg rstn, clk, T;
    wire Q, Qn;

    t_ff_jk dut (
        rstn, clk, T,
        Q, Qn
    );

    initial
    begin
        {rstn, clk, T} = 2'b00;
    end

    initial
    begin
        #20 rstn = 1'b1;
        #20 T = 1'b1;
        #10 T = 1'b0;
        #20;
        repeat (4) #20 T = ~T;
        $finish;
    end

    always
        #5 clk = ~clk;
endmodule
