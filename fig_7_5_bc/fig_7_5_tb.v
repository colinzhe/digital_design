module fig_7_5_tb;
    reg cs, wr_data, rd_wr;
    wire rd_data;//, S_in, R_in, Q;

    fig_7_5 dut (
        cs, wr_data, rd_wr,
        rd_data//, S_in, R_in, Q
    );

    initial
    begin
        {cs, wr_data, rd_wr} = 3'b000;
    end

    initial
    begin
        #10 wr_data = 1'b1; // prepare write data
        #10 cs = 1'b1; // latch 1'b1
        #10 rd_wr = 1'b1; // read latch data
        #10 cs = 1'b0;
        #10 wr_data = 1'b0; // prepare write data
        #10 cs = 1'b1; rd_wr = 1'b0; // latch 1'b0
        #10 rd_wr = 1'b1; // read latch data
        #10 cs = 1'b0;
        #10 $finish;
    end
endmodule
