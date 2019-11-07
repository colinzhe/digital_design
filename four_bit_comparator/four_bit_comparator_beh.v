module four_bit_comparator_beh (
    input [3:0] A, B,
    output reg [5:0] Y
);
    always @ (A or B)
    begin
        Y = 6'b000000;
        if (A == B)
        begin
            Y[5] = 1;
            Y[0] = 1;
            Y[1] = 1;
        end
        else if (A < B)
        begin
            Y[2] = 1;
            Y[0] = 1;
            Y[4] = 1;
        end
        else if (A > B)
        begin
            Y[3] = 1;
            Y[1] = 1;
            Y[4] = 1;
        end
    end
endmodule
