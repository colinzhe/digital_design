module q_6_5 (
    input rstn, clk, MSB_in, LSB_in,
    input [1:0] sel,
    input [7:0] I,
    output [7:0] A
);
    four_bit_usr msb_usr (
        .rstn (rstn),
        .clk (clk),
        .MSB_in (MSB_in),
        .LSB_in (A[3]),
        .sel (sel),
        .I (I[7:4]),
        .A (A[7:4])
    );

    four_bit_usr lsb_usr (
        .rstn (rstn),
        .clk (clk),
        .MSB_in (A[4]),
        .LSB_in (LSB_in),
        .sel (sel),
        .I (I[3:0]),
        .A (A[3:0])
    );
endmodule

module four_bit_usr(
    input rstn, clk, MSB_in, LSB_in,
    input [1:0] sel,
    input [3:0] I,
    output reg [3:0] A
);
    always @ (posedge clk, negedge rstn)
    begin
        if (!rstn)
        begin
            A <= 4'b0000;
        end
        else
        begin
            case (sel)
                2'b00 : A <= A;
                2'b01 : A <= {MSB_in, A[3:1]};
                2'b10 : A <= {A[2:0], LSB_in};
                2'b11 : A <= I;
            endcase
        end
    end
endmodule
