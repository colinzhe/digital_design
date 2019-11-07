module sr_latch_tb;
    reg S, R;
    wire Q, Qn;

    sr_latch dut (
        S, R,
        Q, Qn
    );

    initial
    begin
        {S, R} = 2'b11;
        #10 S = 1'b0;
        #10 S = 1'b1;
        #10 R = 1'b0;
        #10 R = 1'b1;
        #10 {S, R} = 2'b11;
        #10 {S, R} = 2'b01;
        #10 S = 1'b1;
        $finish;
    end

    initial
        $monitor ("S = %b, R = %b, Q = %b, Qn = %b",
            S, R, Q, Qn);
endmodule
