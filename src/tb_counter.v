`timescale 1ns/1ps

module counter_tb;

reg clk;
reg rst;
wire [3:0] out;

// Instantiate the counter module
counter uut (
    .clk(clk),
    .rst(rst),
    .out(out)
);

// Clock generation
always #5 clk = ~clk;

initial begin
    // Initialize inputs
    clk = 0;
    rst = 1;

    // Apply reset
    #10 rst = 0;

    // Wait for some time to observe counter operation
    #100 $finish;
end

// Waveform dump
initial begin
    $dumpfile("counter_tb.vcd");
    $dumpvars(0, counter_tb);
end

endmodule
