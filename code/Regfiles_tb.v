`timescale 1ns / 1ps
module Regfiles_tb(
    );
    reg clk, rst, we;
    reg [4:0] raddr1;
    reg [4:0] raddr2;
    reg [4:0] waddr;
    reg [31:0] wdata;
    wire [31:0] rdata1;
    wire [31:0] rdata2;
    
    
    initial begin 
        clk = 0; rst = 0; we = 1;
        raddr1 = 0; raddr2 = 0;
        waddr = 5'b00000;
    end
    
    Regfiles uul(clk, rst, we, raddr1, raddr2, waddr, wdata, rdata1, rdata2);
    
    initial begin 
        wdata = 32'h0000_0001;
        #15 waddr = 10;
        #50 wdata = 32'h0000_0101;
        #20 waddr = 7;
        #100 wdata = 32'hffff_ffff;
        #20 waddr = 1;
        #150 wdata = 32'h0000_0000;
        #20 raddr1 = 1; raddr2 = 7;
       // #20 raddr1 = 10; raddr2 = 0;
        //#5 rst = 0;
        //#20 raddr1 = 5; raddr2 = 4;
        //#5 rst = 0;
        //#20 raddr1 = 5; raddr2 = 4;        
    end
    
        always 
        #20 clk = ~clk;
        always #200 we = ~we;
endmodule