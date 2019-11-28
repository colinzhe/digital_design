module fgcg_controller (
    input rstb, clk, valid_in, clk_en_in,
    output logic valid_out, clk_en_out, valid_clk
);
    always_ff @ (posedge clk, negedge rstb)
    begin
        if (!rstb) clk_en_out <= 1'b0;
        else clk_en_out <= clk_en_in;
    end

    always_comb
    begin
        valid_clk = clk_en_out & clk;
    end

    always_ff @ (posedge valid_clk)
    begin
        valid_out <= valid_in;
    end
endmodule
