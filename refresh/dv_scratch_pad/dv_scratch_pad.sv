module dv_scratch_pad (
    input logic clk, rst_b, d,
    output logic q, q_b
);
    always @ (posedge clk, negedge rst_b)
    begin
        if (!rst_b) q <= 1'b0;
        else q <= d;
    end
    
    always_comb
    begin
        q_b = ~q;
    end
endmodule