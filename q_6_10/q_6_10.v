module q_6_10 (
    input rstn, clk, shift, load, SI,
    input [3:0] I,
    output [3:0] A,
    output y
);
    wire D, Q, x;

    assign y = Q ^ x;

    d_ff dff_0 (
        .rstn (rstn),
        .clk (clk),
        .D (x || Q),
        .en (shift),
        .Q (Q)
    );

    shift_reg sr_0 (
        .rstn (rstn),
        .clk (clk),
        .SI (SI),
        .shift (shift),
        .load (load),
        .I (I),
        .SO (x),
        .A (A)
    );
endmodule

module d_ff (
    input rstn, clk, D, en,
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
            if (en)
            begin
                Q <= D;
            end
        end
    end
endmodule

module shift_reg (
    input rstn, clk, SI, shift, load,
    input [3:0] I,
    output SO,
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
            if (load)
            begin
                A <= I;
            end
            else if (shift)
            begin
                A <= {SI, A[3:1]};
            end
            else
            begin
                A <= A;
            end
        end
    end

    assign SO = A[0];
endmodule
