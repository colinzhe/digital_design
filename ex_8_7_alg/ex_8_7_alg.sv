module ex_8_7_alg #(parameter dp_width = 5) (
    input [dp_width-1:0] multiplicand, multiplier,
    output logic [2*dp_width-1:0] product,
    output logic [dp_width-1:0] A, B, Q,
    output logic C
);
    //logic [dp_width-1:0] A, B, Q;
    //logic C;

    always_comb
    begin
        Q = multiplier;
        B = multiplicand;
        C = 0;
        A = 0;

        for (integer k = 0; k <= dp_width-1; k++)
        begin
            if (Q[0]) {C, A} = A + B;
            {C, A, Q} = {C, A, Q} >> 1;
        end
    end

    always_comb
    begin
        product = {A, Q};
    end
endmodule

//module ex_8_7_alg #(parameter dp_width = 5) (
//    input [dp_width-1:0] multiplicand, multiplier,
//    output logic [2*dp_width-1:0] product,
//    output logic [dp_width-1:0] A, B, Q,
//    output logic C
//);
//    always_comb
//    begin
//        product = {A, Q};
//
//        Q = multiplier;
//        B = multiplicand;
//        C = 0;
//        A = 0;
//        
//        for (integer k = 0; k <= dp_width-1; k++)
//        begin
//            if (Q[0]) {C, A} = A + B;
//            {C, A, Q} = {C, A, Q} >> 1;
//        end
//    end
//endmodule
