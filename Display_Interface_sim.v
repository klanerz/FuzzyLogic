`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/03/2017 06:35:50 PM
// Design Name: 
// Module Name: Display_Interface_sim
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


module Display_Interface_sim();
reg clk,W;
reg[2:0]WADD;
reg [5:0]DIN;
wire [7:0]E;
wire [7:1]segOut;
wire DP;
//Outputs of RAM

initial begin
clk = 1;
W = 0;
WADD <= 7;
DIN <= {1'b1, 4'b0000,1'b1};
end
always@(posedge clk)
begin
#50 W = 1;
WADD <= WADD -1;
DIN <= {1'b1, 4'b0001, 1'b1};
/*
#50 WADD <= WADD -1;
DIN <= {1'b1, 4'b0011, 1'b0};

#50 WADD <= WADD -1;
DIN <= {1'b1, 4'b0100, 1'b1};

#50 WADD <= WADD -1;
DIN <= {1'b1, 4'b0101, 1'b1};

#50 WADD <= WADD -1;
DIN <= {1'b1, 4'b0110, 1'b0};

#50 WADD <= WADD -1;
DIN <= {1'b1, 4'b0111, 1'b1};

#50 WADD <= WADD -1;
DIN <= {1'b1, 4'b1111, 1'b1};

#50 W = 0;
WADD <= 7;
DIN <= {1'b1, 4'b0000,1'b1};*/
end
always begin
#1 clk = ~clk;
end

Display_Interface uut(clk,W,WADD,DIN,E,segOut,DP);
endmodule
