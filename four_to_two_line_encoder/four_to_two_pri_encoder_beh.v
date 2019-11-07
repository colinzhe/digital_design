module four_to_two_pri_encoder_beh (
    input [3:0] D1, D2,
    output reg w, x, y, z, V1, V2
);
    always @ (D1)
    begin
        {w, x, V1} = 3'b000;
        casez (D1)
            4'b0000 : {w, x, V1} = 3'b??0;
            4'b0001 : {w, x, V1} = 3'b001;
            4'b001? : {w, x, V1} = 3'b011;
            4'b01?? : {w, x, V1} = 3'b101;
            4'b1??? : {w, x, V1} = 3'b111;
            default : {w, x, V1} = 3'b000;
        endcase
    end

    always @ (D2)
    begin
        {y, z, V2} = 3'b000;
        if (D2[3] == 1'b1)
        begin
            {y, z, V2} = 3'b111;
        end
        else if (D2[2] == 1'b1)
        begin
            {y, z, V2} = 3'b101;
        end
        else if (D2[1] == 1'b1)
        begin
            {y, z, V2} = 3'b011;
        end
        else if (D2[0] == 1'b1)
        begin
            {y, z, V2} = 3'b001;
        end
        else if (D2 == 4'b0000)
        begin
            {y, z, V2} = 3'b??0;
        end
        else
        begin
            {y, z, V2} = 4'b000;
        end
    end
endmodule
