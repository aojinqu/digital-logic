`timescale 1ns / 1ps

module ram2(
    input clk,      
    input ena,      //��Ч����������ЧdataoutΪz
    input wena,    //�ߵ�ƽд��Ч���͵�ƽ����Ч        
    input [4:0]addr,         
    inout [31:0]data     //�����ر�д��
    );
reg [31:0] tmp[31:0];       
reg [31:0]    middata;



always @(posedge clk )
begin
    if(ena&&wena) //reset
    begin
    tmp[addr]<=data;
    end
    else if(~ena)
    tmp[addr]<=32'bz;
end

assign data=(ena&&~wena)?tmp[addr]:32'bz;       //��ֵΪzʱ�������io�˿�
//assign data=(ena)?data:32'bz;

endmodule
