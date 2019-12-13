package q_8_9_pkg;
    parameter st_width = 3;
    typedef enum logic [st_width-1:0] {
        S_idle = 3'b100,
        S_1 = 3'b010,
        S_2 = 3'b001
    } state_t;
endpackage
