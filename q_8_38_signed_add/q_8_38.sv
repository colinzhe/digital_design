module q_8_38 (
    input [7:0] A, B,
    output logic [7:0] sum,
    output logic carry
);
    // assume signed magnitude for A, B
    wire sign_eq = (A[7] == B[7]);
    wire A_gt_B = (A[6:0] > B[6:0]);
    wire B_gt_A = (B[6:0] > A[6:0]);

    always_comb
    begin
        carry = 0;
        if (sign_eq) begin {carry, sum[6:0]} = A[6:0] + B[6:0]; sum[7] = A[7]; end
        else
            if (A_gt_B) sum = {A[7], A[6:0] - B[6:0]};
            else if (B_gt_A) sum = {B[7], B[6:0] - A[6:0]};
            else sum = '0;
    end
endmodule
