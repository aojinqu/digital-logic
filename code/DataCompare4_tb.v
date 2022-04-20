`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/10/21 19:59:45
// Design Name: 
// Module Name: DataCompare4_tb
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


module DataCompare4_tb;
    reg [3:0] iData_a;
    reg [3:0] iData_b;
    reg [2:0] iData;      //级联输入a>b a=b a<b
    wire [2:0] oData;      //比较结果输出A>B A<B A=B
    DataCompare4 uut(
    .iData_a(iData_a),
    .iData_b(iData_b),
    .iData( iData),
    .oData(oData)
    );
    initial
    begin
    iData_a=4'b1000;
    #40 iData_a=4'b0000;
    #40 iData_a=4'b0010;
    end
    initial
    begin
    iData_b=4'b0001;
    #40 iData_b=4'b0100;
    end
    initial 
    begin
    iData=3'b000;
    #40 iData=3'b100;
    #40 iData=3'b100;
    end

endmodule
