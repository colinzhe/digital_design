module shift_reg (myIntf intf);
    always @ (posedge intf.clk, negedge intf.rst_b)
    begin
        if (!intf.rst_b)
            a_par <= 4'b0000;
        else
            case (sel)
                2'b00 : a_par <= a_par;
                2'b01 : a_par <= {a_par[3:1], intf.lsb_in);
                2'b10 : a_par <= {intf.msb_in, a_par[2:0]};
                2'b11 : a_par <= i_par;
                default : a_par <= 4'b0000;
            endcase
    end
endmodule