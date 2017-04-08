`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/06/2017 11:03:33 PM
// Design Name: 
// Module Name: decoder_sim
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


module decoder_sim(); //module decoder3_to_8(w,out,en);
reg [2:0]w;
reg en;
wire [7:0]out;

decoder3_to_8 uut(w,out,en);

initial begin
en = 1;
#5 w = 3'b000;
#5 w = 3'b001;
#5 w = 3'b010;
#5 w = 3'b011;
#5 w = 3'b100;
#5 w = 3'b101;
#5 w = 3'b110;
#5 w = 3'b111;

end
endmodule
