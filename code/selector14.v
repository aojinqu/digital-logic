`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/10/08 14:06:56
// Design Name: 
// Module Name: selector14
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


module de_selector14(
    input iC,
    input iS1,
    input iS0,
    output oZ0,
    output oZ1,
    output oZ2,
    output oZ3
    );
   assign oZ0=(iS1==0&iS0==0)?iC:1;
   assign oZ1=(iS1==0&iS0==1)?iC:1;
   assign oZ2=(iS1==1&iS0==0)?iC:1;
   assign oZ3=(iS1==1&iS0==1)?iC:1;
endmodule