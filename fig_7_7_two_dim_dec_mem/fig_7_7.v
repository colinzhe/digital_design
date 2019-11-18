module fig_7_7 (
    input mem_en, rd_wr,
    input [1:0] addr,
    input [3:0] wr_data,
    output [3:0] rd_data
);
    wire [3:0] word_sel;
    wire [1:0] word_sel_row, word_sel_col;
    wire [3:0] rd_data_arr[3:0];

    //two_by_four_dec dec (
    //    .x_in (addr),
    //    .en (mem_en),
    //    .y_out (word_sel)
    //);

    one_by_two_dec dec_row (
        .x_in (addr[0]),
        .en (mem_en),
        .y_out (word_sel_row)
    );

    one_by_two_dec dec_col (
        .x_in (addr[1]),
        .en (mem_en),
        .y_out (word_sel_col)
    );
    
    assign word_sel[0] = word_sel_row[1] & ~word_sel_row[0] &
        word_sel_col[1] & ~word_sel_col[0];
    assign word_sel[1] = word_sel_row[1] & ~word_sel_row[0] &
        ~word_sel_col[1] & word_sel_col[0];
    assign word_sel[2] = ~word_sel_row[1] & word_sel_row[0] &
        word_sel_col[1] & ~word_sel_col[0];
    assign word_sel[3] = ~word_sel_row[1] & word_sel_row[0] &
        ~word_sel_col[1] & word_sel_col[0];

    genvar i, j, k;
    generate
        for (i = 0; i < 4; i = i + 1)
        begin : bc_loop
            for (j = 0; j < 4; j = j + 1)
            begin : word_sel_loop
                binary_cell bc (
                    .cs (word_sel[j]),
                    .wr_data (wr_data[i]),
                    .rd_wr (rd_wr),
                    .rd_data (rd_data_arr[i][j])
                );
            end
        end
    endgenerate

    generate
        for (k = 0; k < 4; k = k + 1)
        begin : rd_data_loop
            assign rd_data[k] = mem_en ? (rd_wr ? |rd_data_arr[k] : 1'bZ) : 1'bZ;
        end
    endgenerate
endmodule

module one_by_two_dec (
    input x_in,
    input en,
    output reg [1:0] y_out
);
    always @ (x_in, en)
    begin
        if (en)
        begin
            case (x_in)
                1'b0 : y_out = 2'b10;
                1'b1 : y_out = 2'b01;
                default : y_out = 2'b00;
            endcase
        end
        else
            y_out = 2'b00;
    end
endmodule

//module two_by_four_dec (
//    input [1:0] x_in,
//    input en,
//    output reg [3:0] y_out
//);
//    always @ (x_in, en)
//    begin
//        if (en)
//        begin
//            case (x_in)
//                2'b00 : y_out = 4'b1000;
//                2'b01 : y_out = 4'b0100;
//                2'b10 : y_out = 4'b0010;
//                2'b11 : y_out = 4'b0001;
//                default : y_out = 4'b0000;
//            endcase
//        end
//        else
//            y_out = 4'b0000;
//    end
//endmodule
