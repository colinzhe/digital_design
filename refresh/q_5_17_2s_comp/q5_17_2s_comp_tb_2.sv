import q5_17_2s_comp_pkg::*;

module q5_17_2s_comp_tb;
    bit clk;
    always #5 clk = ~clk;
    
    myIntf intf (clk);
    
    q5_17_2s_comp_2 dut (intf.DUT);
    // q5_17_2s_comp_2 dut (.*, .intf(intf.DUT));
    
    wire [st_width-1:0] state = dut.state;
    
    task apply_reset();
        #0 intf.rst_b = 1'b0;
        #10 intf.rst_b = 1'b1;
    endtask
    
    initial #2000 $finish;
    
    initial
    begin
        {clk, intf.stream} = 3'b000;
    end
    
    initial
    begin
        forever
        begin
            #10 intf.stream = $urandom_range(0, 1);
        end
    end
    
    initial
    begin
        apply_reset();
    end
endmodule