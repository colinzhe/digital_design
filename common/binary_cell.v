module binary_cell (
    input cs, wr_data, rd_wr,
    output rd_data//, S_in, R_in, Q
);
    wire S_in, R_in, Q;

    assign S_in = cs & ~rd_wr & wr_data;
    assign R_in = cs & ~rd_wr & ~wr_data;
    //assign rd_data = (cs & rd_wr) ? Q : 1'bZ;
    assign rd_data = cs & Q & rd_wr;

    sr_latch srlatch (
        .S (S_in),
        .R (R_in),
        .Q (Q),
        .Qn ()
    );
endmodule

module sr_latch (
    input S, R,
    output Q, Qn
);
    assign Q = ~(R | Qn);
    assign Qn = ~(S | Q);
endmodule
