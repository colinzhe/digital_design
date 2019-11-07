module d_ff_3_sr_wr_tb;
    reg rstn, clk, D;
    wire Q, Qn;

    d_ff_3_sr_wr dut (
        D, clk, rstn,
        Q, Qn
    );

    initial
    begin
        rstn = 1'b0;
        clk = 1'b0;
        D = 1'b1;
        #20 rstn = 1'b1;
        repeat (4) #20 D = ~D;
        #20;
        $finish;
    end

    //initial
    //begin
    //    clk = 1'b0;
    //    forever
    //    begin
    //        #5 clk = ~clk;
    //    end
    //end

    //always
    //begin
    //    clk = 1; #5; clk = 0; #5;
    //end

    //initial
    //begin
    //    clk = 1'b0;
    //    forever #5 clk = ~clk;
    //end

    always
        #5 clk = ~clk;
endmodule
