`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/01/2017 02:56:51 PM
// Design Name: 
// Module Name: DIRAM
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


module DIRAM (clk, DIN,W,WADD,RADD,DOUT);
         input clk, W;
         input [5:0] DIN; 
         input [2:0] WADD, RADD;
         output [5:0] DOUT;
         reg [5:0] RAM [0:7];
integer i;
initial begin
            for (i = 0; i < 8; i = i+1)
                begin
                    RAM[i]= 6'b011111;
                end
end
always@(posedge clk)
  if(W) RAM[WADD]<= DIN;
assign DOUT=RAM[RADD];
endmodule

