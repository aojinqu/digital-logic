`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/10/28 21:37:44
// Design Name: 
// Module Name: JK_FF
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


module JK_FF(
    input CLK,              //��������Ч
    input J,
    input K,
    input RST_n,
    output reg Q1,
    output reg Q2
    );
    
    always@(posedge CLK or negedge RST_n)
    begin
    
    if(RST_n==0)
    begin
    Q1<=0;
    Q2<=1;
    end
    else
    begin
    if(~J&K)
    begin
    Q1<=0;
    Q2<=1;
    end
    else if(J&~K)
    begin
    Q1<=1;
    Q2<=0;
    end  
    else if(J&K)
    begin
    Q1<=~Q1;
    Q2<=~Q2;
    end    
    end
    end
    
endmodule
