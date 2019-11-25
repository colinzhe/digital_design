module d_ff_sv (
    input logic rstb, clk, D,
    output logic Q, Qb
);
    always_ff @ (posedge clk or negedge rstb)
    begin: dff
        if (!rstb) Q <= 1'b0;
        else Q <= D;
    end: dff

    always_comb
    begin: inverter
        Qb = ~Q;
    end: inverter
endmodule: d_ff_sv
