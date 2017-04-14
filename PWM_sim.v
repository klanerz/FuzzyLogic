`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/10/2017 03:25:06 PM
// Design Name: 
// Module Name: PWM_sim
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


module PWM_sim();
reg [11:0] PW;
reg clk;
wire PWM;

PWM uut(.clk(clk),.PW(PW),.PWM(PWM));


initial begin
clk=0;
forever #1 clk = ~clk;
end

initial begin
#10 PW <= 25;
end


endmodule
