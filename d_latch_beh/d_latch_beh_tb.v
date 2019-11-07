module d_latch_beh_tb;
    reg enable, D;
    wire Q;

    d_latch_beh dut (
        enable, D,
        Q
    );

    initial
    begin
        {enable, D} = 2'b00;
        #10 D = 1'b1;
        #10 enable = 1'b1;
        #10 D = 1'b0;
        #10 enable = 1'b0;
        repeat (5) #10 D = ~D;
        #10;
        $finish;
    end
endmodule
