`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/10/28 20:58:51
// Design Name: 
// Module Name: Asynchronous_D_FF_tb
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


module Asynchronous_D_FF_tb;
    reg CLK;					//ʱ���źţ���������Ч
    reg D;                //�����ź�
    reg RST_n;                //��λ�źţ��͵�ƽ��Ч
    wire Q1;                //����ź�Q
    wire Q2;                //����ź�~Q
    initial
    begin
        CLK = 1;
        RST_n= 0;
        D=1;
    end  
      
      Asynchronous_D_FF uut(
        .CLK(CLK),
        .D(D),
        .RST_n(RST_n),
        .Q1(Q1),
        .Q2(Q2)
        );
   always #50 CLK <= ~CLK;
   always #75 RST_n<= ~RST_n;
   initial
   begin
   #60 D <= 1;
   #30 D <= 0;
   #40  D <= 1;
   #80  D <= 0;
   #60  D <= 0;
    #40  D <= 1;
   end
endmodule
