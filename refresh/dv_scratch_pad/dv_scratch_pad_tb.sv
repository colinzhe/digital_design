class Packet;
    int addr;
    
    // constructor
    function new (int addr);
        this.addr = addr;
    endfunction
    
    function void display();
        $display ("[Base] addr=0x%0h", addr);
    endfunction
endclass

class ExtPacket extends Packet;
    int data;
    
    function new (int addr, int data);
        super.new(addr);
        this.data = data;
    endfunction
    
    function void display();
        $display ("[Child] addr=0x%0h, data=0x%0h", addr, data);
    endfunction
endclass

class Base;
    rand bit [7:0] addr;
    rand bit [7:0] data;
    
    virtual function void display (string tag = "Thread1");
        $display ("[Base] %s: addr=0x%0h, data=0x%0h", tag, addr, data);
    endfunction
endclass

class Child extends Base;
    rand bit en;
    
    function void display (string tag = "Thread1");
        $display ("[Child] %s: addr=0x%0h, data=0x%0h, en=0x%0h", tag, addr, data, en);
    endfunction
endclass

class Rdm;
    rand bit [2:0] data;
endclass

class MemoryBlock;
    bit [31:0] m_ram_start; // start addr of RAM
    bit [31:0] m_ram_end; // end addr of RAM
    
    rand bit [31:0] m_start_addr; // start of test block
    rand bit [31:0] m_end_addr; // end of test block
    rand int m_block_size; // size of block
    
    constraint c_addr {
        m_start_addr >= m_ram_start;
        m_start_addr < m_ram_end;
        m_start_addr % 4 == 0;
        m_end_addr == m_start_addr + m_block_size - 1;
    };
    
    constraint c_size {
        m_block_size inside { 64, 128, 512};
    };
    
    function void display();
        $display ("----- Memory Block -----");
        $display ("RAM start addr = 0x%0h", m_ram_start);
        $display ("RAM end addr = 0x%0h", m_ram_end);
        $display ("RAM block start = 0x%0h", m_start_addr);
        $display ("RAM block end = 0x%0h", m_end_addr);
        $display ("RAM block size = 0x%0h", m_block_size);
    endfunction
endclass

interface my_if (input bit clk);
    logic pop;
    logic push;
    logic empty;
    logic full;
endinterface

module my_des (my_if _if);
    always @ (posedge _if.clk)
    begin
        if (_if.push)
        begin
            a_push: assert (!_if.full)
            begin
                $display ("[PASS] push when fifo not full");
            end
            else
            begin
                $display ("[FAIL] push when fifo is full");
            end
        end
        
        if (_if.pop)
        begin
            a_pop: assert (!_if.empty)
            begin
                $display ("[PASS] pop when fifo is not empty");
            end
            else
            begin
                $display ("[FAIL] pop when fifo is empty");
            end
        end
    end
endmodule

module tb_top;
    Packet pkt;
    ExtPacket extPkt;
    
    // classes and inheritance
    initial
    begin
        pkt = new (32'hbabe_face);
        pkt.display();
        
        extPkt = new (32'hdead_beef, 32'h1234_5678);
        extPkt.display();
    end
    
    Base base = new ();
    Child child = new ();
    
    // random
    // initial
    // begin
        // base.randomize();
        // child.randomize();
        // base.display("Thread1");
        // child.display("Thread1");
    // end
    
    // more random
    // initial
    // begin
        // Rdm rdm = new ();
        // for (int i = 0; i < 10; ++i)
        // begin
            // if (rdm.randomize())
                // $display ("itr=%0d, data=%0h", i, rdm.data);
            // else
                // $display ("failed to generate rand");
        // end
    // end
    
    // memory random test
    // initial
    // begin
        // MemoryBlock mem = new ();
        // mem.m_ram_start = 32'h0;
        // mem.m_ram_end = 32'h7ff;
        // mem.randomize();
        // mem.display();
    // end
    
    // covergroups and cover points
    // bit [1:0] mode;
    // bit [2:0] cfg;
    
    // bit clk;
    // always #20 clk = ~clk;
    
    // covergroup cg @ (posedge clk);
        // coverpoint mode;
    // endgroup
    
    // cg cg_inst;
    
    // initial
    // begin
        // cg_inst = new ();
        
        // for (int i = 0; i < 5; ++i)
        // begin
            // @ (negedge clk);
            // mode = $random;
            // cfg = $random;
            // $display ("[%0t] mode=0x%0h, cfg=0x%0h", $time, mode, cfg);
        // end
    // end
    
    // initial
    // begin
        // #500 $display ("Coverage=%0.2f%%", cg_inst.get_inst_coverage());
        // $finish;
    // end
    
    // assertions
    bit clk;
    always #10 clk = ~clk;
    
    my_if _if (clk);
    my_des u0 (.*);
    
    initial
    begin
        for (int i = 0; i < 5; ++i)
        begin
            _if.push <= $random;
            _if.pop <= $random;
            _if.empty <= $random;
            _if.full <= $random;
            
            $strobe("[%0t] push=0x%0b, full=0x%0b, pop=0x%0b, empty=0x%0b",
                $time, _if.push, _if.full, _if.pop, _if.empty);
            @ (posedge clk);
        end
        #10 $finish;
    end
endmodule