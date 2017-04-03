`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/02/2017 10:34:14 AM
// Design Name: 
// Module Name: BCD_to_7seg
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
/*
   _a_
 |     |
f| _g_ |b
 |     |
e| _d_ |c

*/
module BCD_to_7seg(bcd,en, led);
input [3:0] bcd; //DOUT[4:1]
input en; // DOUT[5]
output [1:7]led;
reg [1:7] led;

always @(bcd)
if(en == 1)
led = 7'b1111111;
else
begin    
    case(bcd)
        0: led = 7'b0000001; // 0
        1: led = 7'b1001111; // 1
        2: led = 7'b0010010; // 2
        3: led = 7'b0000110; // 3
        4: led = 7'b1001100; // 4
        5: led = 7'b0100100; // 5
        6: led = 7'b0100000; // 6
        7: led = 7'b0001111; // 7 
        8: led = 7'b0000000; // 8
        9: led = 7'b0000100; // 9
        default: led = 7'bx;
    endcase
end
endmodule
