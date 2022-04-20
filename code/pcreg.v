`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/11/02 22:05:39
// Design Name: 
// Module Name: pcreg
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

module pcreg(
    input clk,
    input rst,
    input ena,
    input[31:0]data_in,
    output [31:0]data_out
    );
    reg RST_n;
    reg [31:0]data=32'b0;
    
   always @(posedge clk or posedge rst )
   begin
  if(rst)//ÖØÖÃ¼Ä´æÆ÷
  begin
  data<=32'b0;
  end
  
  else if(ena==1)
  begin
  RST_n<=0;
  if(ena)
  data<=data_in;
  end   
   end
   
   assign data_out=data;
endmodule
