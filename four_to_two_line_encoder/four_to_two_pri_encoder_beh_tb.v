module four_to_two_pri_encoder_beh_tb;
    reg [3:0] D1t, D2t;
    wire wt, xt, yt, zt, V1t, V2t;
    integer j, k;

    four_to_two_pri_encoder_beh dut (
        D1t,
        D2t,
        wt,
        xt,
        yt,
        zt,
        V1t,
        V2t
    );

    initial
        #160 $finish;

    initial
    begin
        D1t = 4'b0000;
        k = 32'bx;
        for (k = 0; k <= 18; k = k + 1)
        begin
            D1t = k;
            #10;
        end
    end
    
    initial
    begin
        D2t = 4'b0000;
        j = 32'bx;
        for (j = 0; j <= 18; j = j + 1)
        begin
            D2t = j;
            #10;
        end
    end

    initial
        $monitor ("k = %b, j = %b", k, j);
endmodule
