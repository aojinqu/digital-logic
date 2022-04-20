`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/10/21 21:01:55
// Design Name: 
// Module Name: DataCompare8
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



module DataCompare8(
    input [7:0] iData_a,
    input [7:0] iData_b,
    output [2:0] oData      //比较结果输出A>B A<B A=B
 );
 wire [2:0] iData;
 wire [2:0] temp;
    assign iData=3'b001;
DataCompare4 x(
    iData_a[3:0],
    iData_b[3:0],
    iData [2:0],
    temp [2:0]
           );
DataCompare4 y(
               iData_a[7:4],
               iData_b[7:4],
               temp [2:0],
               oData [2:0]
                      );
 
endmodule
