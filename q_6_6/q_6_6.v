module q_6_6 (
    input rstn, clk, load, shift,
    input [3:0] I,
    input SI,
    output SO,
    output [3:0] A
);
    wire [3:0] D_in;
    wire [3:0] Q_out;

    assign D_in[0] = (load && ~shift && I[0]) || (shift && SI) || (~load && ~shift && Q_out[0]);
    assign D_in[1] = (load && ~shift && I[1]) || (shift && Q_out[0]) || (~load && ~shift && Q_out[1]);
    assign D_in[2] = (load && ~shift && I[2]) || (shift && Q_out[1]) || (~load && ~shift && Q_out[2]);
    assign D_in[3] = (load && ~shift && I[3]) || (shift && Q_out[2]) || (~load && ~shift && Q_out[3]);

    assign SO = Q_out[3];

    assign A = Q_out;

    d_ff dff_0 (
        .rstn (rstn),
        .clk (clk),
        .D (D_in[0]),
        .Q (Q_out[0])
    );

    d_ff dff_1 (
        .rstn (rstn),
        .clk (clk),
        .D (D_in[1]),
        .Q (Q_out[1])
    );

    d_ff dff_2 (
        .rstn (rstn),
        .clk (clk),
        .D (D_in[2]),
        .Q (Q_out[2])
    );

    d_ff dff_3 (
        .rstn (rstn),
        .clk (clk),
        .D (D_in[3]),
        .Q (Q_out[3])
    );
endmodule

module d_ff (
    input rstn, clk, D,
    output reg Q
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
endmodule
