package three_ones_detector_pkg;
    parameter st_width = 2;
    typedef enum logic [st_width-1:0] {S_idle, S_1, S_2, S_3} state_t;
endpackage