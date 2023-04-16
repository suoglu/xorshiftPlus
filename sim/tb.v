`timescale 1ns / 1ps
/* ------------------------------------------------ *
 * Title       : Xorshift+ Testbench                *
 * Project     : Xorshift+                          *
 * ------------------------------------------------ *
 * File        : tb.v                               *
 * Author      : Yigit Suoglu                       *
 * Last Edit   : 17/04/2023                         *
 * ------------------------------------------------ */

module tb();
  parameter SIM_CYCLES = 100000000;
  reg clk, rst;
  //Generate clocks
  always begin
    clk = 1;
    forever #5 clk = ~clk;
  end
  //Send reset
  initial begin
    rst <= 0;
    #3
    rst <= 1;
    #10
    rst <= 0;
  end
  initial begin
    $dumpfile("sim.vcd");
    $dumpvars(0,tb);
  end
  wire [63:0] seedBoth = 64'h1234;
  wire [63:0] randOut;
  wire [7:0] randOutshort = randOut;
  reg gen;

  xorshiftPlus uut(clk,rst,seedBoth,seedBoth,gen,randOut);

  integer f;
  initial begin
    f = $fopen("output.txt","w");
    gen = 0;
    #20
    gen = 1;
    fork
      begin
        repeat(SIM_CYCLES) @(posedge clk); #1;
        $fclose(f);  
        $finish; 
      end
      begin
        while(1) begin
          @(negedge clk); #1;
          $fstrobe(f,randOutshort);
        end
      end
    join
  end
endmodule
