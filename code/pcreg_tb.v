`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/11/03 10:25:49
// Design Name: 
// Module Name: pcreg_tb
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


module pcreg_tb;
    reg clk;
    reg rst;
    reg ena;
    reg[31:0]data_in;
    wire [31:0]data_out;
    pcreg uut(
    .clk(clk),
    .rst(rst),
    .ena(ena),
    .data_in(data_in),
    .data_out(data_out)
    );
    initial
    begin
    clk<=1;
    end
    initial
    begin
    ena<=1;
    end
    initial
    begin
    data_in<=32'b00000000000001000000000011000001;
    end
    initial
    begin
    rst=0;
    end
    always #50 clk<=~clk;
    always #75 ena<=~ena;
    always #200 rst<=~rst;

    
endmodule
