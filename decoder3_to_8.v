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


module decoder3_to_8(w,out,en);
input [2:0]w;
input en;
output [7:0]out;
//reg [7:0]out;

assign out[0] = ~w[0]&~w[1]&~w[2]&en;
assign out[1] = ~w[0]&~w[1]&w[2]&en;
assign out[2] = ~w[0]&w[1]&~w[2]&en;
assign out[3] = ~w[0]&w[1]&w[2]&en;
assign out[4] = w[0]&~w[1]&~w[2]&en;
assign out[5] = w[0]&~w[1]&w[2]&en;
assign out[6] = w[0]&w[1]&~w[2]&en;
assign out[7] = w[0]&w[1]&w[2]&en;
endmodule
