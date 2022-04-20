`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/10/26 14:23:30
// Design Name: 
// Module Name: FA
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
