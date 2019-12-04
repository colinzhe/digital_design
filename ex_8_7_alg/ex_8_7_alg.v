module ex_8_7_alg #(parameter dp_width = 5) (
    input [dp_width-1:0] multiplicand, multiplier,
    output [2*dp_width-1:0] product
);
    reg [dp_width-1:0] A, B, Q;
    reg C;
    integer k;

    assign product = {A, Q};

    always @ (multiplier, multiplicand)
    begin
        Q = multiplier;
        B = multiplicand;
        C = 0;
        A = 0;

        for (k = 0; k <= dp_width-1; k = k+1)
        begin
            if (Q[0]) {C, A} = A + B;
            {C, A, Q} = {C, A, Q} >> 1;
        end
    end
endmodule
