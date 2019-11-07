module three_to_eight_line_decoder_with_en (
    x,
    y,
    z,
    E,
    D
);
    input x, y, z, E;
    output [7:0] D;

    assign D[0] = ~x && ~y && ~z & E;
    assign D[1] = ~x && ~y &&  z & E;
    assign D[2] = ~x &&  y && ~z & E;
    assign D[3] = ~x &&  y &&  z & E;
    assign D[4] =  x && ~y && ~z & E;
    assign D[5] =  x && ~y &&  z & E;
    assign D[6] =  x &&  y && ~z & E;
    assign D[7] =  x &&  y &&  z & E;
endmodule
