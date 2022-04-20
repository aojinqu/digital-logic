`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/10/08 17:03:04
// Design Name: 
// Module Name: transmission8_tb
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


module transmission8_tb;
    reg [7:0] iData;
    reg A;
    reg B;
    reg C;
    wire mid;
    wire [7:0] oData;
    transmission8 uut(
    .iData(iData),
    .A(A),
    .B(B),
    .C(C),
    .oData(oData)
    );
       initial
       begin
       iData=8'b00000000;
       #40 iData=8'b00000001;
       #40 iData=8'b00000010;
       #40 iData=8'b00000011;   
       #40 iData=8'b00000100;
       #40 iData=8'b00000101;
       #40 iData=8'b00000110;   
       #40 iData=8'b00000111;   
       end
       initial
       begin
       A=1;
       #40 A=1;
       #40 A=1;
       #40 A=1;
       #40 A=0;
       #40 A=0;
       #40 A=0;
       #40 A=0;
       end
       initial
       begin
       B=0;
       #40 B=0;
       #40 B=1;
       #40 B=1;
       #40 B=0;
       #40 B=0;
       #40 B=1;
       #40 B=1;
       end
       initial
       begin
       C=0;
       #40 C=1;
       #40 C=0;
       #40 C=1;
       #40 C=0;
       #40 C=1;
       #40 C=0;
       #40 C=1;
       end
endmodule
