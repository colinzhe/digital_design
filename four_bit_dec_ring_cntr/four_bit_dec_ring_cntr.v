module four_bit_dec_ring_cntr (
    input rstn, clk, cnt_en,
    output [3:0] count
);
    wire [1:0] cnt_temp;

    two_by_four_dec dec0 (
        .x_in (cnt_temp),
        .y_out (count)
    );

    two_bit_cntr cntr0 (
        .rstn (rstn),
        .clk (clk),
        .cnt_en (cnt_en),
        .count (cnt_temp)
    );
endmodule

module two_by_four_dec (
    input [1:0] x_in,
    output reg [3:0] y_out
);
    always @ (x_in)
    begin
        case (x_in)
            2'b00 : y_out = 4'b1000;
            2'b01 : y_out = 4'b0100;
            2'b10 : y_out = 4'b0010;
            2'b11 : y_out = 4'b0001;
            default: y_out = 4'b0000;
        endcase
    end
endmodule

module two_bit_cntr (
    input rstn, clk, cnt_en,
    output reg [1:0] count
);
    always @ (posedge clk, negedge rstn)
    begin
        if (!rstn)
        begin
            count <= 2'b00;
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
