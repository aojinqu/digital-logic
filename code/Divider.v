`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/11/04 20:40:23
// Design Name: 
// Module Name: Divider
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


module Divider(
     I_CLK,		//输入时钟信号，上升沿有效
     rst,			//同步复位信号，高电平有效
     O_CLK	//输出时钟
    );
    input I_CLK;		//输入时钟信号，上升沿有效
    input rst;            //同步复位信号，高电平有效
    output reg O_CLK;   //输出时钟
    parameter MAX_DIV=20;
    reg [5:0] cnt;      //0-32
    initial
    begin
      O_CLK<=0;
      cnt<=0;
    end
        always@(posedge I_CLK )
        begin
        if(rst)
        begin
        cnt<=0;
         O_CLK<=0;
        end   
        else if(cnt<MAX_DIV/2-1)
        begin
        cnt<=cnt+1;
        O_CLK<=O_CLK;         //保持
        end
        else
        begin
        cnt<=0;
         O_CLK<=~O_CLK;       //翻转
         end
        end
endmodule
