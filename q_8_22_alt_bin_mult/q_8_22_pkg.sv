package q_8_22_pkg;
    parameter dp_width = 5;
    parameter st_width = 4;
    parameter bc_size = 3;
    typedef enum logic [st_width-1:0] {
        S_idle = 4'b0001,
        S_loaded = 4'b0010,
        S_sum = 4'b0100,
        S_shifted = 4'b1000
    } state_t;
endpackage
