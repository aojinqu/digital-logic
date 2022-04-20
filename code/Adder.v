`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/10/26 15:00:20
// Design Name: 
// Module Name: Adder
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

module FA(
        input iA,
        input iB,
        input iC,               //低位进位符号
        output oS,             //一位和数
        output oC              //向高位的进位符号
    );
    wire temp;
    wire temp1;
    wire temp2;
    xor xor1(temp,iA,iB);
    xor xor2(oS,temp,iC);
    and and1(temp1,iC,temp);
    and and2(temp2,iA,iB);
    or or1(oC,temp1,temp2);
endmodule


module Adder(
    input[7:0]iData_a,
    input[7:0]iData_b,
    input iC,
    output [7:0]oData,
    output oData_C
    );
    wire C1,C2,C3,C4,C5,C6,C7;     //C0即为iC
       FA FA1(iData_a[0],iData_b[0],iC,oData[0],C1);
       FA FA2(iData_a[1],iData_b[1],C1,oData[1],C2);
       FA FA3(iData_a[2],iData_b[2],C2,oData[2],C3);
       FA FA4(iData_a[3],iData_b[3],C3,oData[3],C4);
       FA FA5(iData_a[4],iData_b[4],C4,oData[4],C5);
       FA FA6(iData_a[5],iData_b[5],C5,oData[5],C6);
       FA FA7(iData_a[6],iData_b[6],C6,oData[6],C7);
   FA FA8(iData_a[7],iData_b[7],C7,oData[7],oData_C);
endmodule
