module ex_6_3_sync_cntr (
    input rstn, clk, load, cnt_en,
    input [3:0] data_in,
    output [3:0] count,
    output carry
);
    always @ (posedge clk, negedge rstn)
    begin
        if (!rstn)
        begin
            count <= 4'b0000;
        end
        else if (load)
        begin
            count <= data_in;
        end
        else if (cnt_en)
        begin
            count <= count + 1'b1;
        end
        else
        begin
            count <= count;
        end
    end

    assign carry = (count == 4'b1111);
endmodule
