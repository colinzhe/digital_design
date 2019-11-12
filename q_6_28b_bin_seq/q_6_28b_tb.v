module q_6_28b_tb;
    reg rstb, clk, cnt_en;
    wire [3:0] count[10:0];

    // integer reset_vals[10:0];
    // reset_vals[0] = 1;
    // reset_vals[1] = 3;
    // reset_vals[2] = 5;
    // reset_vals[3] = 7;
    // reset_vals[4] = 9;
    // reset_vals[5] = 10;
    // reset_vals[6] = 11;
    // reset_vals[7] = 12;
    // reset_vals[8] = 13;
    // reset_vals[9] = 14;
    // reset_vals[10] = 15;
    
    genvar i;
    generate
        for (i = 0; i < 11; i = i + 1)
        begin
            q_6_28b #(.RESET_VALUE(i)) dut (
                rstb, clk, cnt_en, count[i]
            );
        end
    endgenerate

    // q_6_28b #(.RESET_VALUE(4'b0001)) dut1 (
    //     rstb, clk, cnt_en,
    //     count[0]
    // );

    // q_6_28b dut2 (
    //     rstb, clk, cnt_en,
    //     count[1]
    // );

    // q_6_28b dut3 (
    //     rstb, clk, cnt_en,
    //     count[2]
    // );

    initial
    begin
        {rstb, clk, cnt_en} = 3'b000;
    end

    initial
    begin
        forever #5 clk = ~clk;
    end

    initial
    begin
        #200 $finish;
    end

    initial
    begin
        #10 rstb = 1'b1;
        #10 cnt_en = 1'b1;
        #90 rstb = 1'b0;
        #10 rstb = 1'b1;
    end
endmodule
