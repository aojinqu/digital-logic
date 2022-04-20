`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/10/21 21:21:57
// Design Name: 
// Module Name: DataCompare8_tb
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


module DataCompare8_tb;
    reg [7:0] iData_a;
    reg [7:0] iData_b;
    wire [2:0] oData;

DataCompare8 uut(
    .iData_a(iData_a),
    .iData_b(iData_b),
    .oData(oData)
    );
    initial
        begin
        iData_a=8'b01100000;
        #40 iData_a=8'b00000001;
        #40 iData_a=8'b00100000;
        end
        
        initial
        begin
        iData_b=8'b01100000;
        #40 iData_b=8'b01000000;
        #40 iData_b=8'b00000010;
        end

endmodule
