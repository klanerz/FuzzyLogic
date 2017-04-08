`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/04/2017 01:14:51 PM
// Design Name: 
// Module Name: counter_sim
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


module counter_sim();
//module counter_20bit(clk,rst,en,count);
reg clk;
wire [2:0]count;

initial begin
clk =1;
end

always begin
#5 clk =~clk;
end

counter_20bit uut(clk,count);

endmodule
