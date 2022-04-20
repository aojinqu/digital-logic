`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/10/28 21:13:38
// Design Name: 
// Module Name: Synchronous_D_FF_tb
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

module Synchronous_D_FF_tb;
    reg CLK;					//ʱ���źţ���������Ч
    reg D;                //�����ź�
    reg RST_n;                //��λ�źţ��͵�ƽ��Ч
    wire Q1;                //����ź�Q
    wire Q2;                //����ź�~Q

      Synchronous_D_FF uut(
        .CLK(CLK),
        .D(D),
        .RST_n(RST_n),
        .Q1(Q1),
        .Q2(Q2)
        );
        initial
        begin
        CLK = 1;
        end     
        initial
        begin
        RST_n=0;
        end  
        initial
        begin
        D<=1;
        end
   always #50 CLK <= ~CLK;
   always #25 RST_n<= ~RST_n;
   always #30 D<= ~D;
endmodule


