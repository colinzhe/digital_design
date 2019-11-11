module q_6_25_dec (
    input rstb, clk, cnt_en,
    output [5:0] out,
    output [2:0] count
);
    three_bit_cntr cntr (
        .rstb (rstb),
        .clk (clk),
        .cnt_en (cnt_en),
        .count (count)
    );

    three_by_eight_dec dec (
        .x_in (count),
        .y_out (out)
    );
endmodule

module three_bit_cntr (
    input rstb, clk, cnt_en,
    output reg [2:0] count
);
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
                if (count == 3'b101)
                begin
                    count <= 3'b000;
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
endmodule

module three_by_eight_dec (
    input [2:0] x_in,
    output reg [5:0] y_out
);
    always @ (x_in)
    begin
        case (x_in)
            3'b000 : y_out = 6'b100000;
            3'b001 : y_out = 6'b010000;
            3'b010 : y_out = 6'b001000;
            3'b011 : y_out = 6'b000100;
            3'b100 : y_out = 6'b000010;
            3'b101 : y_out = 6'b000001;
            default: y_out = 6'b000000;
        endcase
    end
endmodule
