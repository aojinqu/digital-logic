`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/10/21 19:35:01
// Design Name: 
// Module Name: DataCompare4
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


module DataCompare4(
    input [3:0] iData_a,
    input [3:0] iData_b,
    input [2:0] iData,      //级联输入a>b a=b a<b
    output [2:0] oData      //比较结果输出A>B A<B A=B
    );
    assign oData[2]=(iData_a[3]>iData_b[3]|
    iData_a[3]==iData_b[3]&iData_a[2]>iData_b[2]|
    iData_a[3]==iData_b[3]&iData_a[2]==iData_b[2]&iData_a[1]>iData_b[1]|
    iData_a[3]==iData_b[3]&iData_a[2]==iData_b[2]&iData_a[1]==iData_b[1]&iData_a[0]>iData_b[0]
    |((iData_a[3]==iData_b[3]&iData_a[2]==iData_b[2]&iData_a[1]==iData_b[1]&iData_a[0]==iData_b[0])
    &iData[2]&~ iData[1]&~ iData[0]))?1:0; //可能会错！排查！
  
     assign oData[1]=(iData_a[3]<iData_b[3]|
        iData_a[3]==iData_b[3]&iData_a[2]<iData_b[2]|
        iData_a[3]==iData_b[3]&iData_a[2]==iData_b[2]&iData_a[1]<iData_b[1]|
        iData_a[3]==iData_b[3]&iData_a[2]==iData_b[2]&iData_a[1]==iData_b[1]&iData_a[0]<iData_b[0]
     |(( iData_a[3]==iData_b[3]&iData_a[2]==iData_b[2]&iData_a[1]==iData_b[1]&iData_a[0]==iData_b[0])
         &~iData[2]& iData[1]&~ iData[0]))?1:0;    
         
     assign oData[0]=(iData_a[3]==iData_b[3]&iData_a[2]==iData_b[2]&iData_a[1]==iData_b[1]&iData_a[0]==iData_b[0]
      &~iData[2]& ~iData[1]& iData[0])?1:0;
endmodule
