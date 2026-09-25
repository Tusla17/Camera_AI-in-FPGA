// Tính dot của N tap: mỗi tap có valid (1=trong ảnh), a_bit, w_bit (1=+1,0=-1)
// Trả về tổng có dấu. Tap không valid (padding) cộng 0.
module binmac #(parameter N = 288, W = 12) (
    input  [N-1:0] a_bit,
    input  [N-1:0] w_bit,
    input  [N-1:0] valid,
    output signed [W-1:0] sum
);
    integer i; reg signed [W-1:0] acc;
    always @* begin
        acc = 0;
        for (i=0;i<N;i=i+1)
            if (valid[i])
                acc = acc + ((a_bit[i]==w_bit[i]) ? 1 : -1); // XNOR → ±1
        // (với conv1 input thực: thay nhánh này bằng ±a_fixed[i])
    end
    assign sum = acc;
endmodule
