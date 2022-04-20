`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/11/04 21:16:34
// Design Name: 
// Module Name: Divider_tb
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


module Divider_tb;
    reg I_CLK;		//����ʱ���źţ���������Ч
    reg rst;            //ͬ����λ�źţ��ߵ�ƽ��Ч
    wire O_CLK;   //���ʱ��
    Divider uut(
    .I_CLK(I_CLK),
    .rst(rst),
    .O_CLK(O_CLK)  
    );
    initial
    begin
    I_CLK<=1;
    end
    initial
    begin
    rst<=1;
    #10 rst<=0;
    end
    always #30 I_CLK<=~I_CLK;
   // always #200 rst<=~rst;
endmodule
