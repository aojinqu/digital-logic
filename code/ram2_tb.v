`timescale 1ns / 1ps


module ram2_tb;
    reg clk;   //上升沿向ram内部写入
    reg ena;     //高电平存储器才运行，否则输出z
    reg wena;     //读写有效信号，高电平为写有效，低电平为读有效，与  
        //读信号不依赖于时钟！！！写信号依赖于时钟
    reg [4:0]addr;         //输入地址，指定数据读写的地址
    wire[31:0]data;     //存储??? 写入的数据，在clk上升沿时被写???
    reg [31:0]middata;
    //wire [31:0]_data;
    ram2 uut(
        .clk(clk),  
        .ena(ena),    
        .wena(wena),      
        .addr(addr),         
        .data(data)   
    );

    initial begin
        clk=0;
        ena=1;      //使能端为1
        wena=0;
        addr=5'b00001; 
        #200 addr=5'b00010;        
    end
    assign data=middata;
    ram2 r(clk,ena,wena,addr,data);

    initial begin
        middata=32'h00000010;
        #100 middata=32'h00000001;
        #200 middata=32'h00000111;
    end

         always # 50 clk=~clk;
         always #100 wena=~wena;
          always #700 ena=~ena;
    // assign data=_data;
    //assign data=((~wena)&&ena)?middata:'bz;     //读有效且ena有效才输出，否则都是z
endmodule
