module counter (
    input wire clk,          // Clock input
    input wire rst,          // Reset input
    output reg [3:0] out     // 4-bit counter output
);

always @(posedge clk or posedge rst) begin
    if (rst)
        out <= 4'b0000;      // Reset counter to 0
    else
        out <= out + 1'b1;   // Increment counter
end

endmodule
