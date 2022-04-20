`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/10/26 14:29:32
// Design Name: 
// Module Name: FA_tb
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


module FA_tb;
        reg iA;
        reg iB;
        reg iC;               //低位进位符号
        wire oS;             //一位和数
        wire oC;            //向高位的进位符号
        
        FA uut(
        .iA(iA),
        .iB(iB),
        .iC(iC),
        .oS(oS),
        .oC(oC)
        );
    initial
    begin
    iA=0;
    #40 iA=0;
    #40 iA=1;
    #40 iA=1;
    #40 iA=1;
    end      
    initial
    begin
    iB=1;
    #40 iB=0;
    #40 iB=1;
    #40 iB=0;
    #40 iB=1;
    end     
    initial
    begin
    iC=0;
    #40 iC=0;
    #40 iC=0;
    #40 iC=1;
    #40 iC=1;
    end      
endmodule
