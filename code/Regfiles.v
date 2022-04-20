`timescale 1ns / 1ps

//4位16选1数据选择器
module selector16To1(
    input [31:0] iC0,
    input [31:0] iC1,
    input [31:0] iC2,
    input [31:0] iC3,
    input [31:0] iC4,
    input [31:0] iC5,
    input [31:0] iC6,
    input [31:0] iC7,
    input [31:0] iC8,
    input [31:0] iC9,
    input [31:0] iC10,
    input [31:0] iC11,
    input [31:0] iC12,
    input [31:0] iC13,
    input [31:0] iC14,
    input [31:0] iC15,
    input [31:0] iC16,
    input [31:0] iC17,
    input [31:0] iC18,
    input [31:0] iC19,
    input [31:0] iC20,
    input [31:0] iC21,
    input [31:0] iC22,
    input [31:0] iC23,
    input [31:0] iC24,
    input [31:0] iC25,
    input [31:0] iC26,
    input [31:0] iC27,
    input [31:0] iC28,
    input [31:0] iC29,
    input [31:0] iC30,
    input [31:0] iC31,
    input [4:0] raddr,
    input rena,
    output reg [31:0] rdata
    );
    
    always @ (*) begin
        if (rena == 1) begin
        case(raddr)
            5'b00000: rdata = iC0;
            5'b00001: rdata = iC1;
            5'b00010: rdata = iC2;
            5'b00011: rdata = iC3;
            5'b00100: rdata = iC4;
            5'b00101: rdata = iC5;
            5'b00110: rdata = iC6;
            5'b00111: rdata = iC7;
            5'b01000: rdata = iC8;
            5'b01001: rdata = iC9;
            5'b01010: rdata = iC10;
            5'b01011: rdata = iC11;
            5'b01100: rdata = iC12;
            5'b01101: rdata = iC13;
            5'b01110: rdata = iC14;
            5'b01111: rdata = iC15;
            5'b10000: rdata = iC16;
            5'b10001: rdata = iC17;
            5'b10010: rdata = iC18;
            5'b10011: rdata = iC19;
            5'b10100: rdata = iC20;
            5'b10101: rdata = iC21;
            5'b10110: rdata = iC22;
            5'b10111: rdata = iC23;
            5'b11000: rdata = iC24;
            5'b11001: rdata = iC25;
            5'b11010: rdata = iC26;
            5'b11011: rdata = iC27;
            5'b11100: rdata = iC28;
            5'b11101: rdata = iC29;
            5'b11110: rdata = iC30;
            5'b11111: rdata = iC31;
            default: rdata = 0;
        endcase
        end
        else ;
    end
    
endmodule

//模块功能：4-16译码器  6.7

module decoder5To32(
    input [4:0] iData,
    input iEna,
    output reg [31:0] oData
    );
    
    always @ (iEna or iData)
    begin
        oData = 32'h0000_0000;
        if (iEna == 1)
            oData[iData[0] + 2*iData[1] + 4*iData[2] + 8*iData[3] + 16*iData[4]] = 1'b1;
        
            
    end
endmodule


//寄存器，组成寄存器堆
// module reg32(
//     input clk,
//     input rst,
//     input ena,
//     input[31:0]data_in,
//     output reg[31:0]data_out
//     );
    
//    always @(posedge clk or posedge rst )
//    begin
//   if(rst)//重置寄存器
//   begin
//   data_out<=32'b0;
//   end
  
//   else if(ena)
//   data_out<=data_in;
//   // else
//    //data_out<=32'bz;
//    end
   module reg32(
    input clk,
    input rst,
    input wena,
    input [31:0] wdata,
    output reg [31:0] data_out
    );
    reg [31:0] register;
    
    localparam regWidth = 32;
    integer index;
    

    initial begin
        register<=32'bz;
    end
    always @ (posedge clk or posedge rst) begin
    // reset
        index = 0;
        if (rst) 
            data_out = 8'h0000_0000;
    // work
        else
            // write data in register
            if (wena == 1) begin 
                index = 0;
                for (index = 0; index < regWidth; index = index + 1)
                    register[index] = wdata[index];
            end
            // read from register
            else if (wena == 0) begin
                index = 0;
                for (index = 0; index < regWidth; index = index + 1)
                    data_out[index] = register[index];
            end
            else ;
    end
        
endmodule
   
   //assign data_out=(ena==1)?data:32'bz;


module Regfiles(
    input clk,
    input rst,
    input we,
    input [4:0] raddr1,
    input [4:0] raddr2,
    input [4:0] waddr,
    input [31:0] wdata,
    output reg [31:0] rdata1,
    output reg [31:0] rdata2
    );
    wire [31:0] wrdata1;
    wire [31:0] wrdata2;
    wire [31:0] out_decoder;
    decoder5To32 decoder(waddr, we, out_decoder);       //译码器，选择地址
    
    initial
    begin
    rdata1<=32'bz;
    rdata2<=32'bz;
    end
    wire [31:0] out_reg0;
    wire [31:0] out_reg1; 
    wire [31:0] out_reg2; 
    wire [31:0] out_reg3; 
    wire [31:0] out_reg4; 
    wire [31:0] out_reg5; 
    wire [31:0] out_reg6;
    wire [31:0] out_reg7;
    wire [31:0] out_reg8;
    wire [31:0] out_reg9; 
    wire [31:0] out_reg10; 
    wire [31:0] out_reg11;
    wire [31:0] out_reg12; 
    wire [31:0] out_reg13; 
    wire [31:0] out_reg14; 
    wire [31:0] out_reg15; 
    wire [31:0] out_reg16; 
    wire [31:0] out_reg17; 
    wire [31:0] out_reg18; 
    wire [31:0] out_reg19; 
    wire [31:0] out_reg20; 
    wire [31:0] out_reg21; 
    wire [31:0] out_reg22;
    wire [31:0] out_reg23; 
    wire [31:0] out_reg24; 
    wire [31:0] out_reg25; 
    wire [31:0] out_reg26; 
    wire [31:0] out_reg27; 
    wire [31:0] out_reg28; 
    wire [31:0] out_reg29; 
    wire [31:0] out_reg30; 
    wire [31:0] out_reg31;
    
    reg32 r0(clk, rst, out_decoder[0], wdata, out_reg0);
    reg32 r1(clk, rst, out_decoder[1], wdata, out_reg1);   
    reg32 r2(clk, rst, out_decoder[2], wdata, out_reg2);    
    reg32 r6(clk, rst, out_decoder[3], wdata, out_reg3);    
    reg32 r3(clk, rst, out_decoder[4], wdata, out_reg4);    
    reg32 r4(clk, rst, out_decoder[5], wdata, out_reg5);    
    reg32 r5(clk, rst, out_decoder[6], wdata, out_reg6);    
    reg32 r7(clk, rst, out_decoder[7], wdata, out_reg7);    
    reg32 r8(clk, rst, out_decoder[8], wdata, out_reg8);    
    reg32 r9(clk, rst, out_decoder[9], wdata, out_reg9);    
    reg32 r10(clk, rst, out_decoder[10], wdata, out_reg10);  
    reg32 r11(clk, rst, out_decoder[11], wdata, out_reg11);    
    reg32 r12(clk, rst, out_decoder[12], wdata, out_reg12);    
    reg32 r13(clk, rst, out_decoder[13], wdata, out_reg13);    
    reg32 r14(clk, rst, out_decoder[14], wdata, out_reg14);    
    reg32 r15(clk, rst, out_decoder[15], wdata, out_reg15);    
    reg32 r16(clk, rst, out_decoder[16], wdata, out_reg16);    
    reg32 r17(clk, rst, out_decoder[17], wdata, out_reg17);    
    reg32 r18(clk, rst, out_decoder[18], wdata, out_reg18);    
    reg32 r19(clk, rst, out_decoder[19], wdata, out_reg19);    
    reg32 r20(clk, rst, out_decoder[20], wdata, out_reg20);    
    reg32 r21(clk, rst, out_decoder[21], wdata, out_reg21);    
    reg32 r22(clk, rst, out_decoder[22], wdata, out_reg22);    
    reg32 r23(clk, rst, out_decoder[23], wdata, out_reg23);    
    reg32 r24(clk, rst, out_decoder[24], wdata, out_reg24);    
    reg32 r25(clk, rst, out_decoder[25], wdata, out_reg25);    
    reg32 r26(clk, rst, out_decoder[26], wdata, out_reg26);    
    reg32 r27(clk, rst, out_decoder[27], wdata, out_reg27);    
    reg32 r28(clk, rst, out_decoder[28], wdata, out_reg28);    
    reg32 r29(clk, rst, out_decoder[29], wdata, out_reg29);   
    reg32 r30(clk, rst, out_decoder[30], wdata, out_reg30);    
    reg32 r31(clk, rst, out_decoder[31], wdata, out_reg31);  
    
    selector16To1 s1(out_reg0, out_reg1, out_reg2, out_reg3, out_reg4, out_reg5, out_reg6, out_reg7, out_reg8, out_reg9, out_reg10, out_reg11,
          out_reg12, out_reg13, out_reg14, out_reg15, out_reg16, out_reg17, out_reg18, out_reg19, out_reg20, out_reg21, out_reg22,
          out_reg23, out_reg24, out_reg25, out_reg26, out_reg27, out_reg28, out_reg29, out_reg30, out_reg31,
          raddr1, ~we, wrdata1);        //读有效才传出数据
    selector16To1 s2(out_reg0, out_reg1, out_reg2, out_reg3, out_reg4, out_reg5, out_reg6, out_reg7, out_reg8, out_reg9, out_reg10, out_reg11,
          out_reg12, out_reg13, out_reg14, out_reg15, out_reg16, out_reg17, out_reg18, out_reg19, out_reg20, out_reg21, out_reg22,
          out_reg23, out_reg24, out_reg25, out_reg26, out_reg27, out_reg28, out_reg29, out_reg30, out_reg31,
          raddr2, ~we, wrdata2);
          
    always @ (*) begin
        rdata1 <= wrdata1;
        rdata2 <= wrdata2;
    end
    
endmodule