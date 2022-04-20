`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/10/28 21:49:43
// Design Name: 
// Module Name: JK_FF_tb
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


module JK_FF_tb;
    reg CLK;             //…œ…˝—ÿ”––ß
    reg J;
    reg K;
    reg RST_n;
    wire Q1;
    wire Q2;
    JK_FF uut(
    .CLK(CLK),
    .J(J),
    .K(K),
    .RST_n(RST_n),
    .Q1(Q1),
    .Q2(Q2)
    );
    
    initial
    begin
        CLK <= 1;
        RST_n<= 0;
        J<=1;
        K<=0;
    end  
      
   always #50 CLK <= ~CLK;
   always #25 RST_n<= ~RST_n;
   initial
   begin
    #60  J <= 1;
    #30  J <= 0;
    #40  J <= 1;
    #80  J <= 0;
    #60  J <= 1;
   end
   
   initial
    begin
   #60  K <= 1;
   #30  K <= 1;
   #40  K <= 0;
   #80  K <= 0;
   #60  K <= 1;
   end
endmodule
