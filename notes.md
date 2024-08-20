# Testing:
  Running Verilog code on iverilog + gtkwave tools:
    `iverilog -o <program_tb> <program.v> <program_tb.v>`

Writing a testbench:
```
  `timescale 1ns/1ps  // Define the timescale for your simulation (for TT08, use the clock period)

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
  always #5 clk = ~clk;  // Every 5 time ticks (that we defined in line 1), flip clk

  initial begin
      // Initialize inputs
      clk = 0;
      rst = 1;

      // Apply reset
      #10 rst = 0;

      // Wait for some time to observe counter operation
      #100 $finish;  // Finish flag to indicate that we'll only run this for 100 ticks
  end

  // Waveform dump
  initial begin
      $dumpfile("counter_tb.vcd");
      $dumpvars(0, counter_tb);
  end

  endmodule
```
