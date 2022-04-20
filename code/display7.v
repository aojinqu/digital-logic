`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/10/11 20:00:02
// Design Name: 
// Module Name: display7
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


module display7(
    input [3:0] iData,//四位输入 D3~D0
    output [6:0] oData //七位译码输出 g~a
);
      assign oData[0]=((iData[3]===0&iData[2]===0&iData[1]===0&iData[0]===1)
        |(iData[3]===0&iData[2]===1&iData[1]===0&iData[0]===0))?1:0;
     assign oData[1]=((iData[3]===0&iData[2]===1&iData[1]===0&iData[0]===1)
        |(iData[3]===0&iData[2]===1&iData[1]===1&iData[0]===0))?1:0;
     assign oData[2]=(iData[3]===0&iData[2]===0&iData[1]===1&iData[0]===0)?1:0;
     assign oData[3]=((iData[3]===0&iData[2]===0&iData[1]===0&iData[0]===1)
        |(iData[3]===0&iData[2]===1&iData[1]===0&iData[0]===0)   
        |(iData[3]===0&iData[2]===1&iData[1]===1&iData[0]===1))?1:0;
    assign oData[4]=((iData[3]===0&iData[2]===0&iData[1]===0&iData[0]===1)
        |(iData[3]===0&iData[2]===0&iData[1]===1&iData[0]===1)
        |(iData[3]===0&iData[2]===1&iData[1]===0&iData[0]===0)   
        |(iData[3]===0&iData[2]===1&iData[1]===0&iData[0]===1)
        |(iData[3]===0&iData[2]===1&iData[1]===1&iData[0]===1)
        |(iData[3]===1&iData[2]===0&iData[1]===0&iData[0]===1))?1:0;
    assign oData[5]=((iData[3]===0&iData[2]===0&iData[1]===0&iData[0]===1)
        |(iData[3]===0&iData[2]===0&iData[1]===1&iData[0]===0)
        |(iData[3]===0&iData[2]===0&iData[1]===1&iData[0]===1)   
        |(iData[3]===0&iData[2]===1&iData[1]===1&iData[0]===1))?1:0;
    assign oData[6]=((iData[3]===0&iData[2]===0&iData[1]===0&iData[0]===1)
        |(iData[3]===0&iData[2]===0&iData[1]===0&iData[0]===0)
        |(iData[3]===0&iData[2]===1&iData[1]===1&iData[0]===1))?1:0;
endmodule
