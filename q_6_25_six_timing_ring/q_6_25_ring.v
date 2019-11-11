module q_6_25_ring (
    input rstb, clk, cnt_en,
    output reg [5:0] out
);
    always @ (posedge clk, negedge rstb)
    begin
        if (!rstb)
        begin
            out <= 6'b100000;
        end
        else
        begin
            if (cnt_en)
            begin
                out <= {out[0], out[5:1]};
            end
            else
            begin
                out <= out;
            end
        end
    end
endmodule
