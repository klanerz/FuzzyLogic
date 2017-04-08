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


module counter_20bit(clk,count);
input clk;
output reg [2:0]count;
//reg [2:0]count;
//reg [19:0]counter;
reg [4:0]counter;
initial 
begin
count = 0;
counter = 0;
end
always @(posedge clk) 
begin
    //if(counter == 1048575) 
      if(counter == 31)
        begin
        //counter <= 20'b0;
        //count <= counter[19:17];
        counter <= 5'b0;
        count <= counter[4:2];
        end
    else
        begin
        count <= counter[4:2];
        counter <= counter+1;
        //count <= counter[19:17];
        end
end
endmodule
