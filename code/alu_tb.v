module alu_tb;
  reg [31:0]a;
  reg [31:0]b;
  reg [3:0]aluc;
  wire [31:0]r;
  wire zero;
  wire carry;
  wire negative;
  wire overflow;
  initial
  begin
  //a=32'h00000008;;
  a=0;
  b=0;
  //b=32'hffffffff;
  aluc=0;
  end
  initial
  begin
  #10 aluc=4'b1110;
//  #10 aluc=4'b1011;
 // #10 aluc=4'b1010;
 // #10 aluc=4'b1100;
  //#10 aluc=4'b1111;
 // #10 aluc=4'b1101;
  end
  initial
  begin
  a=32'h00000010 ;
  //#10 a=32'hffffffff;
  end
  
  initial
  begin
  b=32'h80000000;      //80000000;//ffffffff;
  // #10 b=32'hffffffff;
  end
  alu uut(.a(a),.b(b),.aluc(aluc),.r(r),.zero(zero),.carry(carry),.negative(negative),.overflow(overflow));
endmodule