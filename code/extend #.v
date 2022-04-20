`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/09/27 21:19:18
// Design Name: 
// Module Name: extend #
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


module extend #(parameter WIDTH=16)(
    input [WIDTH -1:0] a,
    input sext,
    output[31:0]b
);
    assign b=sext?{{(32-WIDTH){a[WIDTH-1]}},a}:{16'b0,a};
endmodule
