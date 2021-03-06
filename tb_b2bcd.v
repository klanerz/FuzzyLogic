`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/04/2017 12:52:29 PM
// Design Name: 
// Module Name: tb_b2bcd
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


module tb_b2bcd;
reg clk;
reg [11:0]v1;
reg [11:0]v2;
wire [3:0] DV10,DV11,DV12,DV13,DV20,DV21,DV22,DV23;

B2BCD uut(clk,v1,v2,DV23,DV22,DV21,DV20,DV13,DV12,DV11,DV10);
initial begin
clk = 0;
v1 = 412; v2 = 3123;
repeat(1000)
begin
#1 clk =~clk;
end
end
endmodule
