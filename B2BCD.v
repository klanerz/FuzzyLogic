`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/03/2017 10:45:57 AM
// Design Name: 
// Module Name: B2BCD
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


module B2BCD(clk,v1,v2,DV10,DV11,DV12,DV13,DV20,DV21,DV22,DV23);
input clk;
input [11:0]v1;
input [11:0]v2;
output reg [3:0] DV10,DV11,DV12,DV13,DV20,DV21,DV22,DV23;
reg [1:0]state = 0;
reg [11:0]R;
reg D3t,D2t,D1t;
always @(posedge clk)
begin
    case(state)
        0: begin state <= 1; R <= v1; end
        1: begin 
            if(R>999)
            begin
                D3t <= D3t + 1;
                R <= R-1000;
            end
            else if(R>99)
            begin
                D2t <= D2t + 1;
                R <= R-100;
            end
            else if(R>9)
            begin
                D1t <= D1t+1;
                R <= R-10;
            end
            else
            begin
                state <= 2;
                DV10 <= R[3:0]; DV11 <= D1t; DV12 <= D2t;
                DV13 <=D3t; R <= v2; D3t <= 0; D2t <= 0; D1t <= 0;
            end
           end
         2: begin 
            if(R > 999)
            begin
                D3t <= D3t+1;
                R <= R-1000;
            end
            else if(R > 99)
            begin
                D2t <= D2t+1;
                R <= R-100;
            end
            else if(R > 9)
            begin
                D1t <= D1t+1;
                R <= R-10;
            end
            else
            begin
                state <= 0;
                DV20 <= R[3:0]; DV21 <= D1t; DV22 <= D2t;
                DV23 <= D3t; R <= v1; D3t <= 0; D2t <= 0; D1t <= 0;
            end
            end
endcase
end
endmodule
