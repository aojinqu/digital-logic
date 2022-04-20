`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/10/08 15:13:23
// Design Name: 
// Module Name: selector41_tb
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

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/10/08 14:32:49
// Design Name: 
// Module Name: selector14_tb
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


module selector41_tb;
    reg [3:0] iC0;
    reg [3:0] iC1;
    reg [3:0] iC2;
    reg [3:0] iC3;
    reg iS1;
    reg iS0;
    wire [3:0] oZ;
    selector41 uut(
    .iC0(iC0),
    .iC1(iC1),
    .iC2(iC2),
    .iC3(iC3),
    .iS1(iS1),
    .iS0(iS0),
    .oZ(oZ)
    );
    initial
    begin
    iC0=4'b0000;
    #40 iC0=4'b0001;
    #40 iC0=4'b0000;
    #40 iC0=4'b0001;   
    end
    initial
    begin
    iC1=4'b0001;
    #40 iC1=4'b0001;
    #40 iC1=4'b0000;
    #40 iC1=4'b0001;
    end
    initial
    begin
    iC2=4'b0000;
    #40 iC2=4'b0001;
    #40 iC2=4'b0001;
    #40 iC2=4'b0000;
    end    
    initial
    begin
    iC3=4'b0001;
    #40 iC3=4'b0000;
    #40 iC3=4'b0001;
    #40 iC3=4'b0000;
    end         
    initial
    begin
    iS1=1;
    #40 iS1=0;
    #40 iS1=1;
    #40 iS1=0;
    end  
    initial
    begin
    iS0=1;
    #40 iS1=0;
    #40 iS1=0;
    #40 iS1=1;
    end  
endmodule
