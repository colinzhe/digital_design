module jk_ff_tb;
    reg rstn, clk, J, K;
    wire Q, Qn;
    
    jk_ff dut (
        rstn, clk, J, K,
        Q, Qn
    );

    initial
    begin
        {J, K, clk, rstn} = 4'b0000;
    end

    initial
    begin
        #20 rstn = 1'b1;
        #20 K = 1'b1;
        #20 K = 1'b0;
        #20 J = 1'b1;
        #20 J = 1'b0;
        #20 {J, K} = 2'b11;
        #20 {J, K} = 2'b00;
        #20 K = 1'b1;
        #20 K = 1'b0;
        #20 J = 1'b1;
        #20 J = 1'b0;
        #20;
        $finish;
    end

    always
        #5 clk = ~clk;

    initial
        $monitor ("J = %b, K = %b, Q = %b, Qn = %b, clk = %b",
            J, K, Q, Qn, clk);
endmodule
