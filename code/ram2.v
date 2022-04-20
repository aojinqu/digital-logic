`timescale 1ns / 1ps

module ram2(
    input clk,      
    input ena,      //有效则运作，无效dataout为z
    input wena,    //高电平写有效，低电平读有效        
    input [4:0]addr,         
    inout [31:0]data     //上升沿被写入
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

assign data=(ena&&~wena)?tmp[addr]:32'bz;       //赋值为z时不会堵塞io端口
//assign data=(ena)?data:32'bz;

endmodule
