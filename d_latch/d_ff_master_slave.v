module d_ff_master_slave (
    input D, clk,
    output Q, Qn
);
    wire Y;

    d_latch d_latch_master (
        .D (D),
        .En (~clk),
        .Q (Y),
        .Qn ()
    );

    d_latch d_latch_slave (
        .D (Y),
        .En (clk),
        .Q (Q),
        .Qn (Qn)
    );
endmodule
