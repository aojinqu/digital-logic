`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/09/23 21:28:38
// Design Name: 
// Module Name: logic_gates_2
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


module logic_gates_2(iA,iB,oAnd,oOr,oNot);    //�ṹ����
    input iA,iB;
    output oAnd,oOr,oNot;      
    assign oAnd =iA&iB;
    assign oOr =iA|iB;
    assign oNot=~iA;
endmodule
