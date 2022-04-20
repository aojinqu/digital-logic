`timescale 1ns / 1ps

module ram(
    input clk,      //��������ram�ڲ�д��
    input ena,      //�ߵ�ƽ�洢�������У��������z
    input wena,     //��д��Ч�źţ��ߵ�ƽΪд��Ч���͵�ƽΪ����Ч����  
        //���źŲ�������ʱ�ӣ�����д�ź�������ʱ��
    input [4:0]addr,         //�����ַ��ָ�����ݶ�д�ĵ��?
    input [31:0]data_in,     //�洢?? д������ݣ���clk������ʱ��д??
    output reg [31:0]data_out    //�洢������������
    );


reg [31:0] tmp[31:0];       //锟芥储锟斤拷锟斤�?
integer i;
reg [31:0]       data;
//readmemh("input.txt",reg);  锟斤拷锟皆诧拷锟斤拷
always @(posedge clk  ) 
begin
    if(ena&wena) //reset
    begin
        tmp[addr]=data_in;  
    end
    else if(~ena)      //ena=0
        data_out='bz;
end
always @(~wena) begin
    if(ena)
    data_out=tmp[addr];  
end
endmodule
