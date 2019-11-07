module four_bit_johnson_cntr (
    input rstn, clk,
    output [7:0] count
);
    reg [3:0] state;

    always @ (posedge clk, negedge rstn)
    begin
        if (!rstn)
        begin
            state <= 4'b0110;
        end
        else
        begin
            case (state)
                4'b0000 : state <= 4'b1000;
                4'b1000 : state <= 4'b1100;
                4'b1100 : state <= 4'b1110;
                4'b1110 : state <= 4'b1111;
                4'b1111 : state <= 4'b0111;
                4'b0111 : state <= 4'b0011;
                4'b0011 : state <= 4'b0001;
                4'b0001 : state <= 4'b0000;
                default : state <= 4'b0000;
            endcase
        end
    end

    //wire [3:0] Q_out;
    //wire Q0n;

    //d_ff dff_A (
    //    .rstn (rstn),
    //    .clk (clk),
    //    .D (Q0n),
    //    .Q (Q_out[3]),
    //    .Qn ()
    //);

    //d_ff dff_B (
    //    .rstn (rstn),
    //    .clk (clk),
    //    .D (Q_out[3]),
    //    .Q (Q_out[2]),
    //    .Qn ()
    //);

    //d_ff dff_C (
    //    .rstn (rstn),
    //    .clk (clk),
    //    .D (Q_out[2] && (Q_out[3] || Q_out[1])),
    //    .Q (Q_out[1]),
    //    .Qn ()
    //);

    //d_ff dff_E (
    //    .rstn (rstn),
    //    .clk (clk),
    //    .D (Q_out[1]),
    //    .Q (Q_out[0]),
    //    .Qn (Q0n)
    //);

    four_by_eight_dec dec (
        .x_in (state),
        .y_out (count)
    );
endmodule

module d_ff (
    input rstn, clk, D,
    output reg Q,
    output Qn
);
    always @ (posedge clk, negedge rstn)
    begin
        if (!rstn)
        begin
            Q <= 1'b0;
        end
        else
        begin
            Q <= D;
        end
    end

    assign Qn = ~Q;
endmodule

module four_by_eight_dec (
    input [3:0] x_in,
    output reg [7:0] y_out
);
    always @ (x_in)
    begin
        case (x_in)
            4'b0000 : y_out = 8'b1000_0000;
            4'b1000 : y_out = 8'b0100_0000;
            4'b1100 : y_out = 8'b0010_0000;
            4'b1110 : y_out = 8'b0001_0000;
            4'b1111 : y_out = 8'b0000_1000;
            4'b0111 : y_out = 8'b0000_0100;
            4'b0011 : y_out = 8'b0000_0010;
            4'b0001 : y_out = 8'b0000_0001;
            default : y_out = 8'b0000_0000;
        endcase
    end
endmodule
