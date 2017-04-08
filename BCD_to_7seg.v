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
output [7:1]led;
reg [7:1] led;

always @(bcd)
begin
if(en == 0)
begin
led = 7'b1111111;
end
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
       10: led = 7'b0001000; // A
       11: led = 7'b1100000; // B
       12: led = 7'b0110001; // C
       13: led = 7'b1000010; // D
       14: led = 7'b0110000; // E
       15: led = 7'b0111000; // F
       
        default: led = 7'bx;
    endcase
end
end
endmodule
