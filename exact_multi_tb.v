`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.11.2023 01:13:11
// Design Name: 
// Module Name: exact_multi_tb
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


module exact_multi_tb();
reg [7:0]a;
reg [7:0]b;
wire [15:0]y;
integer i;
integer s;

exact_multi dut(a,b,y);
initial
begin
s = $fopen("PEM.txt","w");
for(i = 0; i< 65536;i = i+1) 
begin
{a,b} = i;
$monitor ("a =%b,b = %b, y= %d",a,b,y);
#100;
$fdisplay(s,y);
end
$fclose(s);
$finish;
end
endmodule
