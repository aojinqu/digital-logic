`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/11/04 19:29:14
// Design Name: 
// Module Name: Counter8
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

//JK触发器
module JK_FF(
    input CLK,              //上升沿有效
    input J,
    input K,
    input RST_n,
    output reg Q1
    );
    
    always@(posedge CLK or negedge RST_n)
    begin    
    if(RST_n==0)
    begin
    Q1<=0;
    end
    else
    begin
    if(~J&K)
    begin
    Q1<=0;
    end
    else if(J&~K)
    begin
    Q1<=1;
    end  
    else if(J&K)
    begin
    Q1<=~Q1;
    end    
    end
    end  
endmodule

//七段译码管
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


module Counter8(
    input CLK,              //上升有效
    input rst_n,            //异步复位
    output wire [2:0]oQ,         //二进制计数器输出
    output wire [6:0]oDisplay    //七段输出
    );
    wire [3:0]temp;
  
    JK_FF JK1(CLK,1,1,rst_n,oQ[0]);
    JK_FF JK2(CLK,oQ[0],oQ[0],rst_n,oQ[1]);   
    JK_FF JK3(CLK,oQ[0]&oQ[1],oQ[0]&oQ[1],rst_n,oQ[2]);
    //进入七段译码管
    assign temp[3]=0;
    assign temp[2]=oQ[2];
    assign temp[1]=oQ[1];
    assign temp[0]=oQ[0];
    display7 a(temp,oDisplay);
    
endmodule
