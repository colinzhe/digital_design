module jk_ff_mux_tb;
    reg rstn, clk, J, K;
    wire Q, Qn;

    jk_ff_mux dut (
        rstn, clk, J, K,
        Q, Qn
    );

    initial
    begin
        {rstn, clk, J, K} = 4'b0000;
        #10 rstn = 1'b1;
        #200 rstn = 1'b0;
    end

    initial
    begin
        repeat (30) #10 {J, K} = $random;
        $finish;
    end
    
    always
        #5 clk = ~clk;
endmodule
