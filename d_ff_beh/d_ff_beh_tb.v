module d_ff_beh_tb;
    reg rstn, clk, D;
    wire Q;

    d_ff_beh dut (
        rstn, clk, D,
        Q
    );

    initial
    begin
        {rstn, clk, D} = 3'b000;
        #10 rstn = 1'b1;
        #60 rstn = 1'b0;
    end

    initial
    begin
        repeat (10) #10 D = ~D;
        $finish;
    end

    always
        #5 clk = ~clk;
endmodule
