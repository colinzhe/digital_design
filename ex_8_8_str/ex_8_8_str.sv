//`define nopkg;

`ifdef nopkg
`else
    import ex_8_8_pkg::*;
`endif

module ex_8_8_str (
    input rstb, clk, start,
    input [r1_size-1:0] data,
    output logic [r2_size-1:0] count,
    output logic rdy
);
    `ifdef nopkg
        parameter r1_size = 8, r2_size = 4;
    `endif
    logic load_regs, shift_left, incr_r2, zero, msb;

    controller controller_0 (.*);
    //    .rstb(rstb),
    //    .clk(clk),
    //    .start(start),
    //    .zero(zero),
    //    .msb(msb),
    //    .rdy(rdy),
    //    .load_regs(load_regs),
    //    .shift_left(shift_left),
    //    .incr_r2(incr_r2)
    //);

    data_path data_path_0 (.*);
    //    .clk(clk),
    //    .load_regs(load_regs),
    //    .shift_left(shift_left),
    //    .incr_r2(incr_r2),
    //    .data(data),
    //    .count(count),
    //    .zero(zero),
    //    .msb(msb)
    //);
endmodule

module controller (
    input rstb, clk, start, zero, msb,
    output logic rdy, load_regs, shift_left, incr_r2
);
    logic G0, D0_in, D1_in, G1;
    wire zero_b = ~zero, msb_b = ~msb;
    wire [1:0] sel = {G1, G0};
    logic [0:3] dec_out;

    supply0 GND;
    supply1 PWR;
    
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

module data_path (
    input clk, load_regs, shift_left, incr_r2,
    input [r1_size-1:0] data,
    output logic [r2_size-1:0] count,
    output logic zero, msb
);
    supply0 GND;
    supply1 PWR;

    `ifdef nopkg
        parameter r1_size = 8, r2_size = 4;
    `endif

    logic [r1_size-1:0] r1;
    assign zero = (r1 == 0);
    wire w1 = r1[r1_size-1] & shift_left;

    shift_reg shift_reg_0 (PWR, clk, data, GND, shift_left, load_regs, r1);
    counter counter_0 (PWR, clk, load_regs, incr_r2, count);
    d_ff dff_2 (PWR, clk, w1, msb);
endmodule

module shift_reg (
    input rstb, clk,
    input [r1_size-1:0] data_in,
    input shift_in, shift_en, load,
    output logic [r1_size-1:0] shift_reg
);
    `ifdef nopkg
        parameter r1_size = 8, r2_size = 4;
    `endif

    always_ff @ (posedge clk, negedge rstb)
    begin
        if (!rstb) shift_reg <= {r1_size{1'b0}};
        else
        begin
            if (load) shift_reg <= data_in;
            else if (shift_en) shift_reg <= {shift_reg[r1_size-2:0], shift_in};
            else shift_reg <= shift_reg;
        end
    end
endmodule

module counter (
    input rstb, clk,
    input load, cnt_en,
    output logic [r2_size-1:0] count
);
    `ifdef nopkg
        parameter r1_size = 8, r2_size = 4;
    `endif

    always_ff @ (posedge clk, negedge rstb)
    begin
        if (!rstb) count <= 0;
        else
        begin
            if (load) count <= {r2_size{1'b1}};
            else if (cnt_en) count <= count + 1'b1;
            else count <= count;
        end
    end
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
    output logic m_out
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
