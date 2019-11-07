module four_bit_serial_sub (
    input rstn, clk, SI,
    input [1:0] sel,
    output [3:0] shift_reg_A_out, shift_reg_B_out,
    output reg Q,
    output Sum, J, K
);
    ex_6_1_usr usr_A (
        .rstn (rstn),
        .clk (clk),
        .MSB_in (Sum),
        .LSB_in (),
        .I_par (4'b0101),
        .sel (sel),
        .A_par (shift_reg_A_out)
    );

    //four_bit_shift_reg shift_reg_A (
    //    .rstn (rstn),
    //    .clk (clk),
    //    .SI (Sum),
    //    .SE (SE),
    //    .SO (x),
    //    .shift_reg (shift_reg_A_out)
    //);

    ex_6_1_usr usr_B (
        .rstn (rstn),
        .clk (clk),
        .MSB_in (SI),
        .LSB_in (),
        .I_par (4'b0111),
        .sel (sel),
        .A_par (shift_reg_B_out)
    );

    //four_bit_shift_reg shift_reg_B (
    //    .rstn (rstn),
    //    .clk (clk),
    //    .SI (SI),
    //    .SE (SE),
    //    .SO (y),
    //    .shift_reg (shift_reg_B_out)
    //);

    assign J = ~shift_reg_A_out[0] && shift_reg_B_out[0];
    assign K = shift_reg_A_out[0] && ~shift_reg_B_out[0];
    assign Sum = shift_reg_A_out[0] ^ shift_reg_B_out[0] ^ Q;

    always @ (posedge clk, negedge rstn)
    begin
        if (!rstn)
        begin
            Q <= 1'b0;
        end
        else
        begin
            case ({J, K})
                2'b00 : Q <= Q;
                2'b01 : Q <= 1'b0;
                2'b10 : Q <= 1'b1;
                2'b11 : Q <= ~Q;
            endcase
        end
    end

    //full_adder adder_0 (
    //    .x (x),
    //    .y (y),
    //    .Cin (Q),
    //    .S (Sum),
    //    .Cout (Cout)
    //);

    //always @ (posedge clk, negedge rstn)
    //begin
    //    if (!rstn)
    //    begin
    //        Q <= 1'b0;
    //    end
    //    else
    //    begin
    //        Q <= Cout;
    //    end
    //end

    //assign Cin = Q;
endmodule
