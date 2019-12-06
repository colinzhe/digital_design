import ex_8_8_pkg::*;

module controller (
    input rstb, clk, start, zero, msb,
    output logic rdy, load_regs, shift_left, incr_r2
);
    logic G0, D0_in, D1_in, G1;
    wire zero_b = ~zero, msb_b = ~msb;
    wire [1:0] sel = {G1, G0};
    logic [0:3] dec_out;
    
    assign  rdy = ~dec_out[0],
            incr_r2 = ~dec_out[1],
            shift_left = ~dec_out[2],
            load_regs = rdy & start;

    mux_4x1 mux_1 (sel, GND, zero_b, PWR, msb_b, D1_in);
    mux_4x1 mux_0 (sel, start, GND, PWR, msb, D0_in);
    d_ff dff_1 (rstb, clk, D1_in, G1);
    d_ff dff_0 (rstb, clk, D0_in, G0);
    dec_2x4 dec_0 (G1, G0, GND, dec_out);
endmodule

module d_ff (
    input rstb, clk, D,
    output logic Q
);
    always_ff @ (posedge clk, negedge rstb)
    begin
        if (!rstb) Q <= 1'b0;
        else Q <= D;
    end
endmodule

module mux_4x1 (
    input [1:0] sel,
    input in_0, in_1, in_2, in_3,
    output m_out
);
    always_comb
    begin
        case (sel)
            2'b00 : m_out = in_0;
            2'b01 : m_out = in_1;
            2'b10 : m_out = in_2;
            2'b11 : m_out = in_3;
        endcase
    end
endmodule

module dec_2x4 (
    input A, B, enable_b,
    output [0:3] D
);
    assign  D[0] = ~(~A & ~B & ~enable_b),
            D[1] = ~(~A & B & ~enable_b),
            D[2] = ~(A & ~B & ~enable_b),
            D[3] = ~(A & B & ~enable_b);
endmodule
