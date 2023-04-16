/* ------------------------------------------------ *
 * Title       : Xorshift+                          *
 * Project     : Xorshift+                          *
 * ------------------------------------------------ *
 * File        : xorshift+.v                        *
 * Author      : Yigit Suoglu                       *
 * Last Edit   : 14/04/2023                         *
 * ------------------------------------------------ *
 * Description : Random number generator            *
 * ------------------------------------------------ *
 * Revisions                                        *
 *     v1      : Inital version                     *
 * ------------------------------------------------ */

module xorshiftPlus#(
  parameter BITSIZE = 64,
  parameter SHIFT0 = 23,
  parameter SHIFT1 = 18,
  parameter SHIFT2 = 5
)(
  input clk,
  input rst,
  input [BITSIZE-1:0] seed0,
  input [BITSIZE-1:0] seed1,
  input gen,
  output [BITSIZE-1:0] randOut
);
  reg [BITSIZE-1:0] state0, state1;
  wire [BITSIZE-1:0] state0_next, state1_next;
  reg [BITSIZE-1:0] intermediateVal; //combinational

  always@(posedge clk) begin
    if(rst) begin
      state0 <= seed0;
      state1 <= seed1;
    end else if(gen) begin
      state0 <= state0_next;
      state1 <= state1_next;
    end
  end

  always@* begin
    intermediateVal = state1 ^ (state1 << SHIFT0);
    intermediateVal = intermediateVal ^ (intermediateVal >> SHIFT1);
    intermediateVal = intermediateVal ^ state0 ^ (state0 >> SHIFT2);
  end

  assign state1_next = state0;
  assign state0_next = intermediateVal;
  assign randOut = state0 + state0_next;
endmodule
