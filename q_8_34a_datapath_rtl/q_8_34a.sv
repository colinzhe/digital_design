import q_8_34a_pkg::*;

module q_8_34a (
    input rst_b, clk,
    input [data_size-1:0] data_in,
    input load_regs, incr_r2, shift,
    output logic zero, E,
    output logic [r2_size-1:0] cnt
);
    logic [data_size-1:0] r1;
    logic [r2_size-1:0] r2;

    always_ff @ (posedge clk, negedge rst_b)
    begin
        if (!rst_b)
        begin
            E <= 1'b0; r1 = '0; r2 = '0;
        end
        else
        begin
            if (load_regs)
            begin
                r1 <= data_in;
                r2 <= '1;
            end
            if (incr_r2) r2 <= r2 + 1'b1;
            if (shift) {E, r1} <= {E, r1} << 1;
        end
    end

    assign zero = (r1 == '0);
    assign cnt = r2;
endmodule
