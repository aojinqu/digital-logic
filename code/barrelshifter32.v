`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/10/14 21:31:00
// Design Name: 
// Module Name: barrelshifter32
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


module barrelshifter32(a,b,aluc,c);
    input [31:0] a;
    input [4:0] b;
    input [1:0]aluc;
    output wire [31:0] c;
    reg [31:0] temp;
    
    always @(a or b or aluc)
    begin
    
    if(~aluc[1]&~aluc[0])        //算术右移
    begin  
    if(b[0]==1)
        temp={a[31],a[31:1]};
    else
        temp=a;     //是否要箭头？
    if(b[1]==1)
         temp={{2{temp[31]}},temp[31:2]};
     if(b[2]==1)
          temp={{4{temp[31]}},temp[31:4]}; 
     if(b[3]==1)
          temp={{8{temp[31]}},temp[31:8]};  
     if(b[4]==1)
          temp={{16{temp[31]}},temp[31:16]};  
    end
    
    else if (aluc[1]&~aluc[0])    //逻辑右移
    begin
     if(b[0]==1)
         temp={1'b0,a[31:1]};
     else
         temp=a;     //是否要箭头？
     if(b[1]==1)
          temp={{2{1'b0}},temp[31:2]};
      if(b[2]==1)
           temp={{4{1'b0}},temp[31:4]}; 
      if(b[3]==1)
           temp={{8{1'b0}},temp[31:8]};  
      if(b[4]==1)
           temp={{16{1'b0}},temp[31:16]};  
    end
    
    else                    //算术左移或逻辑左移
    begin
         if(b[0]==1)
             temp={a[30:0],1'b0};
         else
             temp=a;        //是否要箭头？
          if(b[1]==1)
              temp={temp[29:0],{2{1'b0}}};
          if(b[2]==1)
               temp={temp[27:0],{4{1'b0}}}; 
          if(b[3]==1)
               temp={temp[23:0],{8{1'b0}}};  
          if(b[4]==1)
               temp={temp[15:0],{16{1'b0}}};
    end
    
    end  
    assign c=temp;
    
endmodule
