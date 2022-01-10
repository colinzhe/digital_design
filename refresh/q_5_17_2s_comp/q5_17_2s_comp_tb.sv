import q5_17_2s_comp_pkg::*;

module q5_17_2s_comp_tb;
    reg rst_b, clk, stream;
    wire twos_comp;
    
    real pi;
    real freq;
    
    typedef struct {
        int coins;
        real dollars;
    } s_wallet;
    
    event event_a, event_b, event_c;
    
    s_wallet my_wallet = '{5, 4.34};
    
    int my_fifo [0:7];
    int your_fifo [8];
    
    q5_17_2s_comp dut (
        rst_b, clk, stream,
        twos_comp
    );
    
    wire [st_width-1:0] state = dut.state;
    
    task apply_reset();
        #0 rst_b = 1'b0;
        #10 rst_b = 1'b1;
    endtask
    
    initial #2000 $finish;
    
    initial
    begin
        {clk, stream} = 3'b000;
        forever #5 clk = ~clk;
    end
    
    initial
    begin
        pi = 3.14;
        freq = 1e6;
        
        my_fifo[5] = 32'hface_cafe;
        
        $display ("Value of pi = %f", pi);
        $display ("Value of freq = %0d", freq);
        
        $display ("Coins in my wallet = %0d", my_wallet.coins);
        $display ("Dollars in my wallet = %.2f", my_wallet.dollars);
        
        foreach (my_fifo[i])
            $display ("my_fifo[%0d] = 0x%0h", i, my_fifo[i]);
    end
    
    initial
    begin
        forever
        begin
            #10 stream = $urandom_range(0, 1);
        end
    end
    
    initial
    begin
        apply_reset();
        // #30 stream = 1'b1;
        // -> event_a;
        // $display ("event_a triggered");
        // #10 stream = 1'b0;
        // #10 stream = 1'b0;
        // -> event_b;
        // $display ("event_b triggered");
        // #10 stream = 1'b1;
        // #10 stream = 1'b1;
        // #10 stream = 1'b1;
        // -> event_c;
        // $display ("event_c triggered");
        // #10 stream = 1'b1;
        // #10 stream = 1'b0;
        // #10 apply_reset();
    end
    
    // initial
    // begin
        // $display($time,"\tWaiting for the Event's to trigger");
        // wait_order(event_a,event_b,event_c)
          // $display($time,"\tEvent's triggered Inorder");
        // else
          // $display($time,"\tEvent's triggered Out-Of-Order");
    // end
    
    initial
    begin
        #1 $display ("[%0t ns] start fork...", $time);
        
        // main process
        fork
            // thread1
            #5 $display ("[%0t ns] thread1: orange is named after orange", $time);
            
            // thread2
            begin
                #2 $display ("[%0t ns] thread2: apple keeps doctor away", $time);
                #4 $display ("[%0t ns] thread2: but not anymore", $time);
            end
            
            // thread3
            #10 $display ("[%0t ns] thread3: banana is a good fruit", $time);
        join_any
        
        $display ("[%0t ns] after join_any", $time);
    end
    
    function automatic int fn(ref int a);
        a += 5;
        
        return a;
    endfunction
endmodule