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


module ADC_Controller(clk,ready,initialaddress_in,data,v1,v2);
input clk;
input ready;
input [7:0] initialaddress_in;
input [15:0]data;
output [11:0]v1,v2;

//reg [7:0]address_in;
reg [11:0]v1,v2;
reg [7:0] address_in;
reg [1:0] state = 0;

always @(posedge clk)
begin
if(ready == 1'b1)
begin 
case(state)
    
endcase
end
begin
    if(address_in == 8'h13) 
    begin
        v1 <= data[15:4];
        address_in <= 8'h1b; 
    end
    else //temperature in
    begin
        v2 <= data[15:4];
        address_in <= 8'h13;            
    end        
end      

end
endmodule
