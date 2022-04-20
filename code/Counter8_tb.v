`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/11/04 20:09:49
// Design Name: 
// Module Name: Counter8_tb
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


module Counter8_tb;
    reg CLK;              //������Ч
    reg rst_n;            //�첽��λ
    wire[2:0]oQ;         //�����Ƽ��������
    wire [6:0]oDisplay;    //�߶����
    Counter8 uut(
    .CLK(CLK),
    .rst_n(rst_n),
    .oQ(oQ),
    .oDisplay(oDisplay)
    );
   
    initial
    begin
    rst_n=0;
    end
    initial
    begin
    CLK=0;
    end
    always
    begin
     #50 CLK=~CLK;
     end
    always 
    begin
    #200 rst_n=~rst_n;
    end
    
endmodule
