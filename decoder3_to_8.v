`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/02/2017 12:13:40 AM
// Design Name: 
// Module Name: decoder3_to_8
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


module decoder3_to_8(w,Y);
input [2:0]w;
output reg[7:0]Y;
//reg [7:0]out;
always @(w)
case(w)
3'b000: Y = 8'b11111110;
3'b001: Y = 8'b11111101;
3'b010: Y = 8'b11111011;
3'b011: Y = 8'b11110111;
3'b100: Y = 8'b11101111;
3'b101: Y = 8'b11011111;
3'b110: Y = 8'b10111111;
3'b111: Y = 8'b01111111;
default: Y = 8'b11111111;
endcase
endmodule
