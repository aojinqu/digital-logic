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
    reg [7:0] iData;  //四位输入 D3~D0
    reg iEI;          //输入信号EI，低电平有效m,l
    wire [2:0] oData; //七位译码输出 g~a
    wire oEO;          //扩展输入信号Eo，高电平有效
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
