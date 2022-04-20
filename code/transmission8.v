`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/10/08 16:21:29
// Design Name: 
// Module Name: transmission8
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


module transmission8(
    input [7:0] iData,
    input A,B,C,
    output [7:0] oData
    );
    wire mid;
    assign mid=(~A&~B&~C&iData[0])|(~A&~B&C&iData[1])|(~A&B&~C&iData[2])|(~A&B&C&iData[3])|(A&~B&~C&iData[4])|(A&~B&C&iData[5])|(A&B&~C&iData[6])|(A&B&C&iData[7]);
    assign oData[0]=(A==0&B==0&C==0)?mid:1;
    assign oData[1]=(A==0&B==0&C==1)?mid:1;
    assign oData[2]=(A==0&B==1&C==0)?mid:1;
    assign oData[3]=(A==0&B==1&C==1)?mid:1;
    assign oData[4]=(A==1&B==0&C==0)?mid:1;
    assign oData[5]=(A==1&B==0&C==1)?mid:1;
    assign oData[6]=(A==1&B==1&C==0)?mid:1;
    assign oData[7]=(A==1&B==1&C==1)?mid:1;




endmodule
