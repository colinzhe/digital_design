module d_ff_3_sr_tb;
    reg D, clk;
    wire Q, Qn;

    d_ff_3_sr dut (
        D, clk,
        Q, Qn
    );

    initial
    begin
        clk = 1'b0;
        D = 1'b0;
        #10 D = 1'b1;
        #20 D = 1'b0;
        #10 D = 1'b1;
        #10 D = 1'b0;
    end

    initial
        #100 $finish;

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
