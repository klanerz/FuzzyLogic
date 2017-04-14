`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/03/2017 01:57:39 PM
// Design Name: 
// Module Name: ADC_Controller
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


module ADC_Controller(clk,ready,address_in,data,v1,v2);
input clk;
input ready;
output reg[6:0]address_in;
input [15:0]data;
output [11:0]v1,v2;

//reg [7:0]address_in;
reg [11:0]v1,v2;
reg [3:0] state;

initial begin
v1 <= 0;
v2 <= 0;
state <= 0;
end
always @(posedge clk)
begin
if(ready == 1'b1)
begin 
case(state)
    0: begin if(ready == 1)
        begin
            state <= 1;
            v1 <= data[15:4];
            address_in <= 7'h1b;
        end
       end
    1: begin if(ready == 1)
        begin
            state <= 0;
            v2 <= data[15:4];
            address_in <= 7'h13;
        end
       end
     default: state <= 0;
endcase
end
end

endmodule
