import q_8_39_pkg::*;

//`define dec_mux
//`define dec_only
`define onehot

module q_8_39 (
    input rst_b, clk, start,
    input [data_width-1:0] A, B,
    output logic rdy,
    output logic [data_width*2-1:0] P
);
    logic load_regs, add_decr, zero;
    
    controller controller_0 (.*);
    datapath datapath_0 (.*);
endmodule

module controller (
    input rst_b, clk, start, zero,
    output logic rdy, load_regs, add_decr
);
`ifdef dec_mux
    logic Q_out, D_in;
    logic [1:0] dec_out;

    my_mux mux_0 (
        .sel (Q_out),
        .data_in ({~zero, start}),
        .data_out (D_in)
    );

    d_ff dff_0 (
        .D (D_in),
        .Q (Q_out),
        .*
    );

    dec dec_0 (
        .dec_in (Q_out),
        .*
    );

    assign load_regs = start & dec_out[0];
    assign rdy = dec_out[0];
    assign add_decr = ~zero & dec_out[1];
`elsif dec_only
    logic [1:0] dec_out;
    wire D_in = (dec_out[0] & start) || (dec_out[1] & ~zero);
    logic Q_out;
    logic [1:0] dec_out;

    d_ff dff_0 (
        .D (D_in),
        .Q (Q_out),
        .*
    );

    dec dec_0 (
        .dec_in (Q_out),
        .*
    );

    assign load_regs = start & dec_out[0];
    assign rdy = dec_out[0];
    assign add_decr = ~zero & dec_out[1];
`else // assume onehot
    logic [1:0] D_in, Q_out;

    assign D_in[0] = (~start & Q_out[0]) || (zero & Q_out[1]);
    assign D_in[1] = (start & Q_out[0]) || (~zero & Q_out[1]);

    assign load_regs = Q_out[0] & start;
    assign add_decr = Q_out[1] & ~zero;
    assign rdy = Q_out[0];

    d_ff #(.RESET_VAL(1'b1)) dff_0 (
        .D (D_in[0]),
        .Q (Q_out[0]),
        .*
    );

    d_ff #(.RESET_VAL(1'b0)) dff_1 (
        .D (D_in[1]),
        .Q (Q_out[1]),
        .*
    );
`endif
endmodule

module d_ff #(parameter RESET_VAL = 1'b0) (
    input rst_b, clk, D,
    output logic Q
);
    always_ff @ (posedge clk, negedge rst_b)
    begin
        if (!rst_b) Q <= RESET_VAL;
        else Q <= D;
    end
endmodule

module my_mux (
    input sel,
    input [1:0] data_in,
    output logic data_out
);
    always_comb
    begin
        case (sel)
            1'b0 : data_out = data_in[0];
            1'b1 : data_out = data_in[1];
        endcase
    end
endmodule

module dec (
    input dec_in,
    output logic [1:0] dec_out
);
    always_comb
    begin
        //case (dec_in)
        //    1'b0 : dec_out = 2'b01;
        //    1'b1 : dec_out = 2'b10;
        //endcase
        for (int k = 0; k <= 1; k++)
        begin
            if (dec_in == k) dec_out[k] = 1'b1;
            else dec_out[k] = 1'b0;
        end
    end
endmodule

module datapath (
    input rst_b, clk, load_regs, add_decr,
    input [data_width-1:0] A, B,
    output logic [data_width*2-1:0] P,
    output logic zero
);
    logic [data_width-1:0] RA, RB;
    logic [data_width*2-1:0] RP;

    always_ff @ (posedge clk, negedge rst_b)
    begin
        if (!rst_b)
        begin
            RA <= '0;
            RB <= '0;
            RP <= '0;
        end
        else
            if (load_regs)
            begin
                RA <= A;
                RB <= B;
                RP <= '0;
            end
            else if (add_decr)
            begin
                RA <= RA - 1'b1;
                RP <= RP + RB;
            end
    end

    assign zero = (RA == '0);
    assign P = RP;
endmodule
