`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/08/2017 07:40:28 PM
// Design Name: 
// Module Name: FuzzyLogic_sim
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


module FuzzyLogic_sim;
//module fuzzyLogic(clk,V1,V2,PW);
reg clk;
reg [7:0] V1,V2;
wire [11:0] PW;

membership_Function uut(clk, V1, V2, PW);

initial begin
clk = 0;
V1 = 50;
V2 = 100;
end

always begin
#1 clk = ~clk;
end
endmodule
