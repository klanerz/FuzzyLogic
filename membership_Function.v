`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/08/2017 02:20:41 PM
// Design Name: 
// Module Name: membership_Function
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


module membership_Function(clk,v1,v2,PW);
input [7:0]v1;
input [7:0]v2;
input clk;
output reg[11:0]PW;

//registers
reg [3:0]state; 
reg [7:0]R,C;
reg [8:0]E;
reg [9:0]dE;
reg [8:0]OE;
reg [8:0]SC;
reg [7:0] NL,NS,Z,PS,PL; 
reg [7:0] DMNL,DMN,DMNS,DMP,DMZZ,DMZ,sampling_time,DMPS,DMPL,
          NR,NLR,NSR,ZR,ZZR,PR,N_NLR,N_NL,N_NSR,N_NS,N_ZR,N_Z,N_PSR,N_PS,N_PLR,N_PL,
          ZZ_NLR,ZZ_NL,ZZ_NSR,ZZ_NS,ZZ_ZR,ZZ_Z,ZZ_PSR,ZZ_PS,ZZ_PLR,ZZ_PL,
          PLS,PSR,P_NLR,P_NL,P_NSR,P_NS,P_ZR,P_Z,P_PSR,P_PS,P_PLR,P_PL,PLR,
          ZOR,ZOD,PSOR,PSOD,NSOR,NSOD,PLOR,PLOD,NLOR,NLOD;
reg [7:0]Den,Num,pwt;

initial begin
E<=v1;
dE<=v2;
DMN <= 0;DMZZ <= 0;DMP <= 0;DMNL <= 0;DMNS <= 0;DMZ <= 0;DMPS <= 0;DMPL <= 0;
NR <= 0;NLR <= 0;NSR <= 0;ZR <= 0;ZZR <= 0;PR <= 0;N_NLR <= 0; N_NL <= 0; N_NSR <= 0;N_NS <= 0;
N_ZR <= 0; N_Z <= 0; N_PSR <= 0; N_PS <= 0; N_PLR <= 0; N_PL <= 0;
ZZ_NLR <= 0; ZZ_NL <= 0; ZZ_NSR <= 0; ZZ_NS <= 0; ZZ_ZR <= 0; ZZ_Z <= 0; ZZ_PSR <= 0;
ZZ_PS <= 0; ZZ_PLR <=0; ZZ_PL <=0;
PLS <= 0;PSR <= 0; P_NLR <= 0; P_NL <= 0; P_NSR <= 0; P_NS <= 0;
P_ZR <= 0;P_Z <= 0; P_PSR <= 0; P_PS <= 0; P_PLR <= 0; P_PL <= 0; PLR <= 0;
ZOR <= 0; ZOD <= 0; PSOR <= 0; PSOD <= 0; NSOR <= 0; NSOD <= 0; PLOR <=0; PLOD <= 0; NLOR <= 0; NLOD <= 0;
end
always@(*)begin
 if(E <= 125)
    begin
        DMNL <= 255;
        DMNS <= 0;
        DMZ <= 0;
        DMPS <= 0;
        DMPL <= 0;
    end

    if(E > 125 && E < 157)
    begin
       DMNL <= (157-E) << 3;
       DMNS <= (E-125) << 3;
       DMZ <= 0;
       DMPS <= 0;
       DMPL <= 0;
    end

    if (E > 157 && E < 223)
    begin
       DMNL <= 0;
       DMNS <= 255;
       DMZ <= 0;
       DMPS <= 0;
       DMPL <= 0;
     end

    if(E > 223 && E < 255)
    begin
       DMNL <= 0;
       DMNS <= (255-E) << 3;
       DMZ <= (E - 223) << 3;
       DMPS <= 0;
       DMPL <= 0; 
    end

    if(E > 255 && E < 287)
    begin
       DMNL <= 0;
       DMNS <= 0;
       DMZ <= (E-255) << 3;
       DMPS <= (287-E) << 3;
       DMPL <= 0; 
    end

    if(E > 287 && E < 353)
    begin
       DMNL <= 0;
       DMNS <= 0;
       DMZ <= 0;
       DMPS <= 255;
       DMPL <= 0; 
    end

    if(E > 353 && E < 385)
    begin
       DMNL <= 0;
       DMNS <= 0;
       DMZ <= 0;
       DMPS <= (385-E) << 3;
       DMPL <= (E-353) << 3; 
    end

    if(E > 385)
    begin
       DMNL <= 0;
       DMNS <= 0;
       DMZ <= 0;
       DMPS <= 0;
       DMPL <= 255; 
    end
if(dE <= 436)begin
	DMN <= 255;
	DMZZ <= 0;
	DMP <= 0;
end
else if(dE > 436 && dE < 500)begin
	DMN <= 255 - ((dE-436)>> 2);
	DMZZ <= (dE - 436) << 2;
	DMP <= 0;
end
else if(dE >= 500 && dE <= 524)begin
	DMN <= 0;
	DMZZ <= 255;
	DMP <= 0;
end
else if(dE > 524 && dE < 588)begin
	DMN <= 0;
	DMZZ <= 255 - ((dE-524)>>2);
	DMP <= (dE-524) << 2;
end
else if(dE > 588)begin
	DMN <= 0;
	DMZZ <= 0;
	DMP <= 255;	
end
end

always @(*)
begin
//NLO
    if(NR<NLR)
    N_NL = NR;
    else
    N_NL = NLR;
    if(NR<NSR)
    N_NS = NR;
    else
    N_NS = NSR;
    if(ZZR<NLR)
    ZZ_NL = ZZR;
    else
    ZZ_NL = NLR;
    if(PR<NLR)
    P_NL = PR;
    else
    P_NL = NLR;
//NSO
    if(NR<ZR)
    N_Z = NR;
    else
    N_Z = ZR;
    if(ZZR<NSR)
    ZZ_NS = ZZR;
    else
    ZZ_NS = NSR;
    if(PR<NSR)
    P_NS = PR;
    else
    P_NS = NSR;
//ZO
    if(ZZR<ZR)
    ZZ_Z = ZZR;
    else
    ZZ_Z = ZR;
//PSO
    if(NR<PSR)
    N_PS = NR;
    else
    N_PS = PSR;
    if(ZZR<PSR)
    ZZ_PS = ZZR;
    else
    ZZ_PS = PSR;
    if(PR<ZR)
    P_Z=PR;
    else
    P_Z=ZR;
//PLO
    if(NR<PLR)
    N_PL = NR;
    else
    N_PL = PLR;
    if(ZZR<PLR)
    ZZ_PL = ZZR;
    else
    ZZ_PL = PLR;
    if(PR<PSR)
    P_PS = PR;
    else
    P_PS = PSR;
    if(PR<PLR)
    P_PL = PR;
    else
    P_PL = PLR;
end

always @(*)
begin ZOD = ZZ_Z;
    if(N_PSR>ZZ_PSR)
    PSOD = N_PSR;
    else
    PSOD = ZZ_PSR;
    
    if(N_NLR>ZZ_NLR)
    NLOD = N_NLR;
    else
    NLOD = ZZ_NLR;
    
    if(NLOD>P_NLR)
    NLOD = NLOD;
    else
    NLOD = P_NLR;
    
    if(NLOD>N_NSR)
    NLOD = NLOD;
    else NLOD = N_NSR;
    
    //////////////////
    
    if(ZZ_NSR>P_NSR)
    NSOD = ZZ_NSR;
    else
    NSOD = P_NSR;
    
    if(P_PSR>N_PLR)
    PLOD = P_PSR;
    else
    PLOD = N_PLR;
    
    if(NLOD>ZZ_PLR)
    PLOD = PLOD;
    else
    PLOD = ZZ_PLR;
    
    if(NLOD>P_PLR)
    PLOD = PLOD;
    else
    PLOD = P_PLR;
end
always @(posedge clk)
begin 
    case(state)
        0: begin state <= 1; R <= v1; C <= v2; SC <= sampling_time; end
        1: begin state <= 2; E <= 255-C+E; dE <= (511-OE)+E; SC <= SC - 1; end
        2: begin state <= 3; OE <= E; SC <= SC - 1; end
        3: begin state <= 4; NLR <= DMNL; NSR <= DMNS; ZR <= DMZ;
                PSR <= DMPS; PLS <= DMPL; NR <= DMN; ZZR <= DMZZ; PR <= DMP; SC <= SC-1; end
        4: begin state <= 5; 
                N_NLR <= N_NL; N_NSR <= N_NS; N_ZR <= N_Z;
                N_PSR <= N_PS; N_PLR <= N_PL; ZZ_NLR <= ZZ_NL; ZZ_NSR <= ZZ_NS;
                ZZ_ZR <= ZZ_Z; ZZ_PSR <= ZZ_PS; ZZ_PLR <= ZZ_PL; P_NLR <= P_NL;
                P_NSR <= P_NS; P_ZR <= P_Z; P_PSR <= P_PS; P_PLR <= P_PL; SC <= SC-1;end
        5: begin state <= 6; ZOR <= ZOD; PSOR <= PSOD; NSOR <= NSOD; PLOR <= PLOD;
                NLOR <= NLOD; SC <= SC-1; end
        6: begin state <= 7; Den <= NLOR+NSOR+ZOR+PSOR+PLOR;
                Num <= (NLOR<<5-NLOR<<2)+(NSOR<<5-NSOR)+(ZOR<<5)+(PSOR<<5+PSOR)+(PLOR<<5+PLOR<<2);
                pwt <= 0; end
        7: begin SC <= SC-1;
                if (Num < Den)
                    begin
                        pwt <= pwt<<7;
                        state <= 8;
                    end
                else
                    begin
                        pwt <= pwt+1;
                        Num <= Num - Den;
                        state <= 7;
                    end
           end
        8: begin SC <= SC-1;
                if(pwt < 4095)
                    begin
                        pwt <=(4095-pwt);
                        state <= 9;
                    end
                else
                    begin
                        pwt <= pwt -4095;
                        state <= 10;
                    end
            end
        9: begin SC <= SC-1;
                if(PW > pwt)
                    begin
                        PW <= PW - pwt;
                        state <= 11;
                    end
                else
                    begin 
                        PW <= 0;
                        state <= 11;
                    end
           end
        10: begin SC <= SC-1;
                if((4095-PW)> pwt)
                    begin
                        PW <= PW + pwt;
                        state <= 11;
                    end
                else
                    begin 
                        PW <= 4095;
                        state <= 11;
                    end
            end
        11: begin SC <= SC-1;
                if(SC ==0)
                state <= 0;
                else
                    begin
                        SC<=SC-1;
                        state <= 11;
                    end
            end
       default: state <= 0;
endcase
end
endmodule
