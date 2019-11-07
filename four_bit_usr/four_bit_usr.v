module four_bit_usr (
    input rstn, clk,
    input [1:0] mode,
    input [3:0] par_in,
    input SI,
    output [3:0] par_out,
    output reg [3:0] shift_reg,
    output reg SO
);
    parameter no_change = 2'b00, shift_left = 2'b01, shift_right = 2'b10,
        par_load = 2'b11;

    always @ (posedge clk, negedge rstn)
    begin
        if (!rstn)
        begin
            shift_reg <= 4'b0000;
        end
        else
        begin
            case (mode)
                no_change :
                    shift_reg <= shift_reg;
                shift_left :
                    begin
                        shift_reg[3] <= shift_reg[2];
                        shift_reg[2] <= shift_reg[1];
                        shift_reg[1] <= shift_reg[0];
                        shift_reg[0] <= SI;
                    end
                shift_right :
                    begin
                        shift_reg[3] <= SI;
                        shift_reg[2] <= shift_reg[3];
                        shift_reg[1] <= shift_reg[2];
                        shift_reg[0] <= shift_reg[1];
                    end
                par_load :
                    shift_reg <= par_in;
            endcase
        end
    end

    always @ (mode, shift_reg)
    begin
        case (mode)
            shift_left : SO = shift_reg[3];
            shift_right : SO = shift_reg[0];
            default : SO = 1'bZ;
        endcase
    end

    assign par_out = shift_reg;
endmodule
