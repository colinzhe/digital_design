module d_latch_beh (
    input enable, D,
    output reg Q
);
    always @ (enable, D)
        if (enable) Q <= D;
endmodule
