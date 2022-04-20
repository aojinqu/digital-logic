`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/10/26 21:24:34
// Design Name: 
// Module Name: Adder_tb
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


module Adder_tb;    
    reg [7:0]iData_a;
    reg [7:0]iData_b;
    reg iC;
    wire [7:0]oData;
    wire oData_C;
    Adder uut(
    .iData_a(iData_a),
    .iData_b(iData_b),
    .iC(iC),
    .oData(oData),
    .oData_C(oData_C)
    );
    
    initial
    begin
    iData_a=8'b00000001;
   #80 iData_a=8'b00000001;
   #80 iData_a=8'b01111000;
   #80 iData_a=8'b01000001;
   #80 iData_a=8'b11111111;
    end
    
    initial
    begin
   iData_b=8'b00000001;
    #80 iData_b=8'b00000001;
    #80 iData_b=8'b01111000;
    #80 iData_b=8'b11000001;
    #80 iData_b=8'b11111111;
    end
    
    initial
    begin
   iC=1;
    #80 iC=0;
    #80 iC=1;
    #80 iC=0;
    #80 iC=1;
    end
endmodule
