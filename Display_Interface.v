`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/01/2017 02:55:22 PM
// Design Name: 
// Module Name: Display_Interface
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


module Display_Interface(clk,W,WADD,DIN,E,segOut,DP);
input clk;
input W;
input [2:0]WADD;
input [5:0]DIN;
output [7:0]E;
output [6:0]segOut;
output DP;

//Input and Outputs of RAM
//wire [2:0]RADD;
wire [5:0]DOUT;
//Output of counter & Input of 3x8Decoder
wire[2:0]counter; // RADD

//Input of BCD
wire [3:0]bcd;
wire en;
wire DP;
wire clk,W;

assign DP = DOUT[0];

counter_20bit counter20(.clk(clk),.count(counter));
DIRAM RAM(clk,DIN,W,WADD,counter,DOUT);
BCD_to_7seg BCD(.bcd(DOUT[4:1]),.en(DOUT[5]),.led(segOut));
decoder3_to_8 decoder3x8(.w(counter),.Y(E));


endmodule
