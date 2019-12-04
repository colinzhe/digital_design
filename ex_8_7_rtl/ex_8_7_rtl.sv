module ex_8_7_rtl #(parameter dp_width = 5)
(
    input [dp_width-1:0] multiplicand, multiplier,
    output logic [2*dp_width-1:0] product
);
    always_comb
    begin
        product = multiplicand * multiplier;
    end
endmodule
