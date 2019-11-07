module four_bit_sync_par_cntr (
    input rstn, clk, cnt_en, load,
    input [3:0] I,
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
            case ({load, cnt_en})
                2'b00 : count <= count;
                2'b10 : count <= I;
                2'b11 : count <= I;
                2'b01 : count <= count + 1'b1;
                default: count <= count;
            endcase
        end
    end

    assign carry = &count;
endmodule
