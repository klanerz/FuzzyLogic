`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/04/2017 02:45:08 PM
// Design Name: 
// Module Name: BCD7seg_sim
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


module BCD7seg_sim(); //module BCD_to_7seg(bcd,en, led);
reg [3:0]bcd;
reg en;
wire [7:1]led;

BCD_to_7seg uut(bcd,en,led);

initial begin
en = 1;

bcd = 4'b0000;
#1 bcd = 4'b0000;
#1 bcd = 4'b0001;
#1 bcd = 4'b0011;
#1 bcd = 4'b0100;
#1 bcd = 4'b0101;
#1 bcd = 4'b0110;
#1 bcd = 4'b0111;
#1 bcd = 4'b1000;
#1 bcd = 4'b1001;
end
endmodule
