`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/10/09 20:44:49
// Design Name: 
// Module Name: decoder
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


module decoder(iData,iEna,oData);
    input [2:0] iData;      //D2,D1.D0
    input [1:0] iEna;       //G1,G2
    output [7:0] oData;      //Y7-Y0
     assign oData[0]=(iEna==2'b10&iData[0]==0&iData[1]==0&iData[2]==0)?0:1;
     assign oData[1]=(iEna==2'b10&iData[0]==1&iData[1]==0&iData[2]==0)?0:1;
     assign oData[2]=(iEna==2'b10&iData[0]==0&iData[1]==1&iData[2]==0)?0:1;
     assign oData[3]=(iEna==2'b10&iData[0]==1&iData[1]==1&iData[2]==0)?0:1;
     assign oData[4]=(iEna==2'b10&iData[0]==0&iData[1]==0&iData[2]==1)?0:1;
     assign oData[5]=(iEna==2'b10&iData[0]==1&iData[1]==0&iData[2]==1)?0:1;
     assign oData[6]=(iEna==2'b10&iData[0]==0&iData[1]==1&iData[2]==1)?0:1;
     assign oData[7]=(iEna==2'b10&iData[0]==1&iData[1]==1&iData[2]==1)?0:1;
endmodule
