`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/10/2017 11:06:58 AM
// Design Name: 
// Module Name: PWM
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


module PWM(clk,PW,PWM);
input clk;
input [11:0]PW;
output reg PWM;
reg [11:0] PC;
reg [1:0]IC;
initial begin
PC <= 0;
IC <= 2;
end
always @(posedge clk)
begin 
    if(PW==0)
        PWM <= 0;
    else if(PW == 4095)
        PWM <= 1;
    else if (IC == 0)
    begin
        if(PC < PW)
        begin
            PC <= PC + 1;
            IC <= 2;
            PWM <= 1;
        end
        else
        begin
            PC <= PC + 1;
            IC <= 2;
            PWM <= 0;
        end
    end
else
    IC <= IC -1;  
end
endmodule
