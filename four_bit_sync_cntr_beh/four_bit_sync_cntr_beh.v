module four_bit_sync_cntr_beh (
    input rstn, clk, cnt_en,
    output reg [3:0] count,
    output carry
);
    always @ (posedge clk, negedge rstn)
    begin
        if (!rstn)
        begin
            count <= 4'b0000;
        end
        else
        begin
            if (cnt_en)
            begin
                if (count == 4'b1001)
                begin
                    count <= 4'b0000;
                end
                else
                begin
                    count <= count + 1'b1;
                end
            end
            else
            begin
                count <= count;
            end
        end
    end

    assign carry = count[3] && count[0];
endmodule
