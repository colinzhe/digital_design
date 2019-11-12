module q_6_30_tb;
    reg rstb, clk;
    wire [4:0] st_count;
    wire [9:0] count;

    q_6_30 dut (
        rstb, clk,
        st_count, count
    );

    initial
    begin
        {rstb, clk} = 2'b00;
    end

    initial
    begin
        #500 $finish;
    end

    initial
    begin
        forever #5 clk = ~clk;
    end

    initial
    begin
        #10 rstb = 1'b1;
        #150 rstb = 1'b0;
        #50 rstb = 1'b1;
    end
endmodule
