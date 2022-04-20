`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/09/23 19:40:52
// Design Name: 
// Module Name: logic_gates_1
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


module logic_gates_3(iA,iB,oAnd,oOr,oNot);    //Ω·ππ√Ë ˆ
    input iA,iB;
    output  reg oAnd,oOr,oNot;      
    always @ (*)
    begin
        oAnd =iA&iB;
        oOr =iA|iB;
        oNot=~iA;
    end
endmodule
