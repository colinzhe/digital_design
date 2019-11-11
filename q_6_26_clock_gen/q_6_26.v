module q_6_26 (
    input rstb, clk, cnt_en,
    output reg [2:0] count,
    output y
);
    assign y = count[2];

    always @ (posedge clk, negedge rstb)
    begin
        if (!rstb)
        begin
            count <= 3'b000;
        end
        else
        begin
            if (cnt_en)
            begin
                count <= count + 1'b1;
            end
            else
            begin
                count <= count;
            end
        end
    end
endmodule
