`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/10/12 17:01:59
// Design Name: 
// Module Name: encoder83_Pri_tb
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


module encoder83_Pri_tb;
    reg [7:0] iData;  //��λ���� D3~D0
    reg iEI;          //�����ź�EI���͵�ƽ��Чm,l
    wire [2:0] oData; //��λ������� g~a
    wire oEO;          //��չ�����ź�Eo���ߵ�ƽ��Ч
    encoder83_Pri uut(
    .iData(iData),
    .iEI(iEI),
    .oData(oData),
    .oEO(oEO)
    );
    initial
    begin
    iEI=1;
    #40 iEI=0;
    end
    initial
    begin
    iData=8'b01111111;
    #40 iData=8'b11111001;
    #40 iData=8'b11111101;
    end
endmodule
