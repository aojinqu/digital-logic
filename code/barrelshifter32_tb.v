`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/10/19 00:01:17
// Design Name: 
// Module Name: barrelshifter32_tb
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


module barrelshifter32_tb;
    reg [31:0] a;
    reg [4:0] b;
    reg [1:0]aluc;
    wire [31:0] c;
barrelshifter32 uut(
    .a(a),
    .b(b),
    .aluc(aluc),
    .c(c)
    );
    initial
    begin
      a=32'b11111111111111111111111111111111;
     //a=32'b01010101010101010101010101010101;
    end
    initial
    begin
    aluc=2'b01;
   // #40 aluc=2'b11;
   //  #40 aluc=2'b00;
    end
    initial
    begin
    b=4'b0011;
   // #80 b=4'b0101;
    end
endmodule
