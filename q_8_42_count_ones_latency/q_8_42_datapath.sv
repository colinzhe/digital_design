import q_8_42_pkg::*;

module q_8_42_datapath (
    input rst_b, clk,
    input [data_size-1:0] data_in,
    input load_regs, incr_and_shift, shift_only,
    output logic zero, msb,
    output logic [r2_size-1:0] cnt
);
    logic [data_size-1:0] r1;
    logic [r2_size-1:0] r2;

    always_ff @ (posedge clk, negedge rst_b)
    begin
        if (!rst_b)
        begin
            r1 = '0; r2 = '0;
        end
        else
        begin
            if (load_regs)
            begin
                r1 <= data_in;
                r2 <= '0;
            end
            else if (incr_and_shift)
            begin
                r2 <= r2 + 1'b1;
                r1 <= r1 << 1;
            end
            else if (shift_only)
                r1 <= r1 << 1;
        end
    end

    assign zero = (r1 == '0);
    assign msb = (r1[data_size-1] == '1);
    assign cnt = r2;
endmodule
