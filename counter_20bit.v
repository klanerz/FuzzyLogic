`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/01/2017 02:58:47 PM
// Design Name: 
// Module Name: counter_20bit
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


module counter_20bit(clk,rst,en,count);
input clk;
input rst;
input en;
output [19:17]count;
reg [19:0]count;

always @(posedge clk)
begin
    if(rst==1)
        count = 20'b0;
    else if(en==1)
        count = count+1;
end
endmodule
