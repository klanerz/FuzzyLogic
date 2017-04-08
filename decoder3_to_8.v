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


module decoder3_to_8(w,out);
input [2:0]w;
output [7:0]out;
//reg [7:0]out;

assign out[0] = ~w[0]&~w[1]&~w[2]; // 000
assign out[1] = w[0]&~w[1]&~w[2]; // 001
assign out[2] = ~w[0]&w[1]&~w[2];
assign out[3] = w[0]&w[1]&~w[2];
assign out[4] = ~w[0]&~w[1]&w[2];
assign out[5] = w[0]&~w[1]&w[2];
assign out[6] = ~w[0]&w[1]&w[2];
assign out[7] = w[0]&w[1]&w[2];
endmodule
