`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/10/09 21:04:29
// Design Name: 
// Module Name: decoder_tb
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


module decoder_tb;
    reg [2:0] iData;      //D2,D1.D0
    reg [1:0] iEna;       //G1,G2
    wire [7:0] oData;      //Y7-Y0
    decoder uut(
    .iData(iData),
    .iEna(iEna),
    .oData(oData)
    );
   // initial
  //  begin
    
   // end
    initial
    begin
    iData=3'b011;
    #40 iData=3'b001;
    #40 iData=3'b010;
    #40 iData=3'b011;
    #40 iData=3'b100;
    #40 iData=3'b101;
    #40 iData=3'b110;
    #40 iData=3'b111;
    end
    initial
    begin
    iEna=2'b10;
    #40 iEna=2'b10;
    #40 iEna=2'b11;
    #40 iEna=2'b01;
    #40 iEna=2'b00;
    #40 iEna=2'b01;
    #40 iEna=2'b10;
    #40 iEna=2'b11;
    end
endmodule
