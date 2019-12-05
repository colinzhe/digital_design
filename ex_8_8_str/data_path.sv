import ex_8_8_pkg::*;

module data_path (
    input clk, load_regs, shift_left, incr_r2,
    input [r1_size-1:0] data,
    output logic [r2_size-1:0] count,
    output logic zero, msb
);
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
