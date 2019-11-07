module t_ff_beh_st_tb;
    reg rstn, clk, T;
    wire Q;

    t_ff_beh_st dut (
        rstn, clk, T,
        Q
    );

    initial
    begin
        {rstn, clk, T} = 3'b000;
        #10 rstn = 1'b1;
        #200 rstn = 1'b0;
    end

    initial
    begin
        repeat (30) #10 T = $random;
        $finish;
    end
    
    always
        #5 clk = ~clk;
endmodule
