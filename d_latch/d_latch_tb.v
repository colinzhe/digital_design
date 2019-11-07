module d_latch_tb;
    reg D, En;
    wire Q, Qn;

    d_latch dut (
        D, En,
        Q, Qn
    );

    initial
    begin
        {D, En} = 2'b00;
        #10 D = 1'b1;
        #10 En = 1'b1;
        #10 D = 1'b0;
        #10;
        $finish;
    end

    initial
        $monitor ("D = %b, En = %b, Q = %b, Qn = %b",
            D, En, Q, Qn);
endmodule
