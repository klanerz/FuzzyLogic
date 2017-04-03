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
input wire W;
input wire [2:0]WADD;
input wire [5:0]DIN;
output [7:0]E;
output [7:1]segOut;
output DP;

//Outputs of RAM
wire [2:0]RADD;
wire [5:0]DOUT;

//Output of counter & Input of 3x8Decoder
wire [19:17]counter;

//Input of BCD
wire [4:1]bcd; 
wire en; //E of BCD

//
//Initialize Modules
counter_20bit counter20(.clk(clk),.rst(1'b0),.en(1'b1),.count(counter));
DIRAM RAM(clk,DIN,W,WADD,RADD,DOUT);
BCD_to_7seg BCD(.bcd(DOUT[4:1]),.en(DOUT[5]),.led(segOut));
decoder3_to_8 decoder3x8(.w(counter),.out(E),.en(1'b1));

assign DP = DOUT[0];

endmodule
