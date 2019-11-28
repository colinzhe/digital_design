module fgcg_controller_tb;
    reg rstb, clk, valid_in, clk_en_in;
    wire valid_out, clk_en_out, valid_clk;

    fgcg_controller dut (
        rstb, clk, valid_in, clk_en_in,
        valid_out, clk_en_out, valid_clk
    );

    initial #100 $finish;

    initial
    begin
        {rstb, clk, valid_in, clk_en_in} = 4'b0000;
    end

    initial
    fork
        forever #5 clk = ~clk;
        #10 rstb = 1;
    join
endmodule
