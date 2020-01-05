package bday_pkg;
    //`define state_method
    //`define arry_cntr_method
    //`define rom_method
    typedef enum logic [4:0] {
        S_idle,
        S_1,
        S_2,
        S_3,
        S_4,
        S_5,
        S_6,
        S_7,
        S_8,
        S_9,
        S_10,
        S_11,
        S_12,
        S_13,
        S_14,
        S_15,
        S_16,
        S_17,
        S_18,
        S_19,
        S_20,
        S_21,
        S_22
    } state_t;

    parameter H = 7'b0001001;
    parameter A = 7'b0001000;
    parameter P = 7'b0001100;
    parameter Y = 7'b0010001;
    parameter B = 7'b0000011;
    parameter D = 7'b0100001;
    parameter S = 7'b0010010;
    parameter T = 7'b0000111;
    parameter O = 7'b0100011;
    parameter C = 7'b1000110;
    parameter N = 7'b0101011;
    parameter BLANK = 7'b1111111;

    parameter msg_size = 11;
    parameter logic [6:0] msg [msg_size] = '{H, A, P, P, Y, BLANK, B, D, A, Y, BLANK};
    parameter cntr_size = 4;
endpackage
