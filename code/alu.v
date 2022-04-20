`timescale 1ns / 1ps

module alu(
    input [31:0] a,		
    input  [31:0] b,
    input [3:0] aluc,		    //4位输入，控制alu的操作
    output reg [31:0] r,		//输出，由数据选择器控制
    output reg zero,			//0标志位
    output reg carry,			//进位
    output reg negative,		//符号
    output reg overflow		    //溢出
    );
    reg mid;
    initial     //初始化
    begin
    r=0;
    negative=0;
    overflow=0;
    zero=0;
    carry=0;
    end
     
    always @(*)
    begin
    overflow=0;            //每次进行不同的运算的时候，标志位需要置0
    carry=0;
    case (aluc)
    4'b0000: {carry,r}=$unsigned(a)+$unsigned(b);        //无符号加
    4'b0010:                                                //有符号加
    begin
    r=$signed(a)+$signed(b);                              //$signed是强制转换，把无符号数转为有符号数
    overflow=a[31]&b[31]^a[30]&b[30];                     //有符号
    negative=r[31];
//数的溢出是通过overflow，判断条件为:最高位进位状态^次高位进位状态=1，则溢出。
    end    
    4'b0001:{carry,r}=$unsigned(a)-$unsigned(b);     //无符号减
    4'b0011:                                                 //有符号减
    begin
    r=$signed(a)-$signed(b);
   // overflow=a[31]&b[31]^a[30]&b[30];
   overflow=((a[31]==0&&b[31]==1&&r[31]==1)|| (a[31]==1&&b[31]==0&&r[31]==0))?1:0;

    negative=r[31];
    end
    4'b0100:r=a&b;        	//与
    4'b0101:r=a|b;        	//或
    4'b0110:r=a^b;           //按位异或
    4'b0111:r=~(a|b);        //NOR或非
    //LUI将指令中的16bit立即数保存到地址为r的通用寄存器的高16位。另外，地址为rt的通用寄存器的低16位使用0填充
    4'b1001:r={b[15:0],16'b0};
    4'b1000:r={b[15:0],16'b0};
    4'b1011:
    begin
    r=( $signed(a)<$signed(b) )? 1:0;            //SLT有符号比较
    //if(a==b)
//zero=1;
zero=(a-b==0)?1:0;
    negative=r;
    end
    4'b1010:
    begin
    r=(a<b)? 1:0;        //SLTU无符号比较
zero=(a-b==0)?1:0;	
    carry=r[0];
    end
   4'b1100:
        begin
        r=$signed(b)>>>a;                  //SRA 算术右移，？
        carry=b[a];        //最后一次被移除的数值
        end
        4'b1110:
        begin
        r=b<<a;             //逻辑左移
        if(a>0)             //防止越界
        carry=b[32-a];        //最后一次被移除的数值
        end
        4'b1111:
        begin
        r=b<<a;             //逻辑左移
        if(a>0)             //防止越界
        carry=b[32-a];        //最后一次被移除的数值
        end
        4'b1101:
        begin
        r=b>>a;       //逻辑右移
        carry=b[a];        //最后一次被移除的数值
        end
    endcase
    if(aluc!=4'b1011&&aluc!=4'b1010)
    zero=(r==0)?1:0;            //zero通过直接判断out是否为0
    if(aluc!=4'b1011&&aluc!=4'b0010&&aluc!=4'b0011)
    negative=r[31];
    end
endmodule
