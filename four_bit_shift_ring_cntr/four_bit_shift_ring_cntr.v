module four_bit_shift_ring_cntr (
    input rstn, clk, cnt_en,
    output reg [3:0] count
);
    always @ (posedge clk, negedge rstn)
    begin
        if (!rstn)
        begin
            count <= 4'b1000;
        end
        else
        begin
            if (!cnt_en)
            begin
                count <= count;
            end
            else
            begin
                count[3] <= count[0];
                count[2] <= count[3];
                count[1] <= count[2];
                count[0] <= count[1];
            end
        end
    end
endmodule
