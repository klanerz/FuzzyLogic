`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/06/2017 05:55:40 PM
// Design Name: 
// Module Name: FuzzyLogicController
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


module FuzzyLogicController(clk,vauxp3,vauxn3,vauxp11,vauxn11,E,segOut,DP);
input clk,vauxp3,vauxn3,vauxp11,vauxn11;
output [7:0]E;
output [6:0]segOut;
output DP;

//XADC & ADC Controller
wire enable,ready; //vauxp3,vauxn3,vauxp11,vauxn11
wire [6:0]Address_in;
wire [15:0]data;

//Display Controller & Display Interface
wire W;
wire [2:0]WADD;
wire [5:0]DIN;

//ADC Contoller & B2BCD & Display Controller
wire [11:0]v1,v2;
wire [3:0]DV23,DV22,DV21,DV20,DV13,DV12,DV11,DV10;


ADC_Controller ADC(clk,ready,Address_in,data,v1,v2);
B2BCD b2bcd(clk,v1,v2,DV23,DV22,DV21,DV20,DV13,DV12,DV11,DV10);
DisplayController DispCon(clk,DV23,DV22,DV21,DV20,DV13,DV12,DV11,DV10,W,WADD,DIN); 
Display_Interface DispInt(clk,W,WADD,DIN,E,segOut,DP);

xadc_wiz_0 MyADC(
      .daddr_in(Address_in), 	//Address bus for the dynamic reconfiguration port
      .den_in(enable),    	//Enable Signal for the dynamic reconfiguration port
      .di_in(0),         	//Input data bus for the dynamic reconfiguration port
      .dwe_in(0),        	//Write Enable for the dynamic reconfiguration port
      .busy_out(),   	//Output data bus for dynamic reconfiguration port  
      .drdy_out(ready),    	//Data ready signal for the dynamic reconfiguration port 
      .dclk_in(clk),      	// Clock input for the dynamic reconfiguration port  
      .alarm_out(),        	//Reset signal for the System Monitor control logic
      .vauxp3(vauxp3),   	//Auxiliary Channel 3  
      .vauxn3(vauxn3),  	// 
      .vauxp11(vauxp11) ,  	//Auxiliary Channel 11 
      .vauxn11(vauxn11) ,   	// 
      .do_out(data),           	//ADC Busy signal
      .reset_in(0),          	//Channel Selection Outputs
      .eoc_out(enable),    	//End of Conversion Signal    
      .vn_in(),         	//End of Sequence Signal
      .vp_in(),       	//OR'ed output of all the Alarms  
      .channel_out(),       	//Dedicated Analog Input Pair      
      .eos_out()        	//        
       );
endmodule

