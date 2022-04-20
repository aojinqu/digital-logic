`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/10/28 21:03:16
// Design Name: 
// Module Name: Synchronous_D_FF
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

module Synchronous_D_FF(
    input CLK,					//时钟信号，上升沿有效
    input D,                    //输入信号
    input RST_n,                //复位信号，低电平有效
    output reg Q1,                //输出信号Q
    output reg Q2                //输出信号~Q
    );
        always @ (posedge CLK)
        begin
        if(RST_n==0||D==0)
        begin
        Q1<=0;
        Q2<=1;
        end
         else       //(D==1)
         begin
         Q1<=1;
         Q2<=0;
         end
         end
endmodule