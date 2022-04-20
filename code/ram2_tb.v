`timescale 1ns / 1ps


module ram2_tb;
    reg clk;   //��������ram�ڲ�д��
    reg ena;     //�ߵ�ƽ�洢�������У��������z
    reg wena;     //��д��Ч�źţ��ߵ�ƽΪд��Ч���͵�ƽΪ����Ч����  
        //���źŲ�������ʱ�ӣ�����д�ź�������ʱ��
    reg [4:0]addr;         //�����ַ��ָ�����ݶ�д�ĵ�ַ
    wire[31:0]data;     //�洢??? д������ݣ���clk������ʱ��д???
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
        ena=1;      //ʹ�ܶ�Ϊ1
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
    //assign data=((~wena)&&ena)?middata:'bz;     //����Ч��ena��Ч�������������z
endmodule
