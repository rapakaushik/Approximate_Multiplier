`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.11.2023 01:11:04
// Design Name: 
// Module Name: exact_multi
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module exact_multi(
input [7:0] A,
 input [7:0] B,
 output [15:0] P
    );
    
  reg [15:0] product;
  always @* begin
    product = A * B;
  end
  assign P = product;
endmodule
