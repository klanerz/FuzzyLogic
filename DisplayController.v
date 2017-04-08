`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/03/2017 10:54:02 AM
// Design Name: 
// Module Name: DisplayController
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


module DisplayController(clk,DV23,DV22,DV21,DV20,DV13,DV12,DV11,DV10,W,WADD,DIN);
input clk;
input [3:0]DV10,DV11,DV12,DV13,DV20,DV21,DV22,DV23;
output W;
output [2:0]WADD;
output [5:0]DIN;
reg [3:0]state = 0;
reg [2:0]WADD;
reg [5:0]DIN;
reg W;
always @(posedge clk)
case(state)
    0: begin state <= 1; WADD <= 7; DIN <={1'b1, DV23,1'b1};end
    1: begin state <= 2; WADD <= WADD-1; DIN <={1'b1, DV22,1'b1};end
    2: begin state <= 3; WADD <= WADD-1; DIN <={1'b1, DV21,1'b1};end
    3: begin state <= 4; WADD <= WADD-1; DIN <={1'b1, DV20,1'b1};end
    4: begin state <= 5; WADD <= WADD-1; DIN <={1'b1, DV13,1'b1};end
    5: begin state <= 6; WADD <= WADD-1; DIN <={1'b1, DV12,1'b1};end
    6: begin state <= 7; WADD <= WADD-1; DIN <={1'b1, DV11,1'b1};end
    7: begin state <= 8; WADD <= WADD-1; DIN <={1'b1, DV10,1'b1};end
    8: begin state <= 0; end
    default: state <= 0;
endcase

always @(*)
begin
case(state)
    0: W = 0;
    1: W = 1;
    2: W = 1;
    3: W = 1;
    4: W = 1;
    5: W = 1;
    6: W = 1;
    7: W = 1;
    8: W = 1;
    default: W = 0;
endcase
end
endmodule
