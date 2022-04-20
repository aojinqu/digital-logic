`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/10/12 16:19:39
// Design Name: 
// Module Name: encoder83_Pri
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


module encoder83_Pri(iData,iEI,oData,oEO);
    input [7:0] iData;//四位输入 D3~D0
    input iEI;          //输入信号EI，低电平有效
    output [2:0] oData; //七位译码输出 g~a
    output oEO;          //扩展输入信号Eo，高电平有效
   // );
    reg [2:0]oData;
    reg oEO;
    always @(iData,iEI)
    begin
    if(iEI==1)
    begin
    oData<= 3'b111;
    oEO<=1'b0;
    end
    else
    begin
    if(iData[7]==1'b0)
    begin
    oData <= 3'b000;
    end
    else if(iData[6]==1'b0)
    begin
    oData <= 3'b001;
    end
    else if(iData[5]==1'b0)
    begin
    oData <= 3'b010;
    end
    else if(iData[4]==1'b0)
    begin
    oData <= 3'b011;
    end
    else if(iData[3]==1'b0)
    begin
    oData <= 3'b100;
    end
    else if(iData[2]==1'b0)
    begin
    oData <= 3'b101;
    end
    else if(iData[1]==1'b0)
    begin
    oData <= 3'b110;
    end
    else if(iData[0]==1'b0)
    begin
    oData <= 3'b111;
    end 
    oEO<=1'b1;  
    end
    end
endmodule
