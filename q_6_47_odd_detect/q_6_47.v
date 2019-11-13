module q_6_47 (
    input rstb, clk, x_in,
    output reg odd_out
);
    always @ (posedge clk, negedge rstb)
    begin   
        if (!rstb) odd_out <= 1'b0;
        else
            odd_out <= odd_out ^ x_in;
    end
endmodule
