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
    reg CLK;					//时钟信号，上升沿有效
    reg D;                //输入信号
    reg RST_n;                //复位信号，低电平有效
    wire Q1;                //输出信号Q
    wire Q2;                //输出信号~Q

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


