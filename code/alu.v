`timescale 1ns / 1ps

module alu(
    input [31:0] a,		
    input  [31:0] b,
    input [3:0] aluc,		    //4λ���룬����alu�Ĳ���
    output reg [31:0] r,		//�����������ѡ��������
    output reg zero,			//0��־λ
    output reg carry,			//��λ
    output reg negative,		//����
    output reg overflow		    //���
    );
    reg mid;
    initial     //��ʼ��
    begin
    r=0;
    negative=0;
    overflow=0;
    zero=0;
    carry=0;
    end
     
    always @(*)
    begin
    overflow=0;            //ÿ�ν��в�ͬ�������ʱ�򣬱�־λ��Ҫ��0
    carry=0;
    case (aluc)
    4'b0000: {carry,r}=$unsigned(a)+$unsigned(b);        //�޷��ż�
    4'b0010:                                                //�з��ż�
    begin
    r=$signed(a)+$signed(b);                              //$signed��ǿ��ת�������޷�����תΪ�з�����
    overflow=a[31]&b[31]^a[30]&b[30];                     //�з���
    negative=r[31];
//���������ͨ��overflow���ж�����Ϊ:���λ��λ״̬^�θ�λ��λ״̬=1���������
    end    
    4'b0001:{carry,r}=$unsigned(a)-$unsigned(b);     //�޷��ż�
    4'b0011:                                                 //�з��ż�
    begin
    r=$signed(a)-$signed(b);
   // overflow=a[31]&b[31]^a[30]&b[30];
   overflow=((a[31]==0&&b[31]==1&&r[31]==1)|| (a[31]==1&&b[31]==0&&r[31]==0))?1:0;

    negative=r[31];
    end
    4'b0100:r=a&b;        	//��
    4'b0101:r=a|b;        	//��
    4'b0110:r=a^b;           //��λ���
    4'b0111:r=~(a|b);        //NOR���
    //LUI��ָ���е�16bit���������浽��ַΪr��ͨ�üĴ����ĸ�16λ�����⣬��ַΪrt��ͨ�üĴ����ĵ�16λʹ��0���
    4'b1001:r={b[15:0],16'b0};
    4'b1000:r={b[15:0],16'b0};
    4'b1011:
    begin
    r=( $signed(a)<$signed(b) )? 1:0;            //SLT�з��űȽ�
    //if(a==b)
//zero=1;
zero=(a-b==0)?1:0;
    negative=r;
    end
    4'b1010:
    begin
    r=(a<b)? 1:0;        //SLTU�޷��űȽ�
zero=(a-b==0)?1:0;	
    carry=r[0];
    end
   4'b1100:
        begin
        r=$signed(b)>>>a;                  //SRA �������ƣ���
        carry=b[a];        //���һ�α��Ƴ�����ֵ
        end
        4'b1110:
        begin
        r=b<<a;             //�߼�����
        if(a>0)             //��ֹԽ��
        carry=b[32-a];        //���һ�α��Ƴ�����ֵ
        end
        4'b1111:
        begin
        r=b<<a;             //�߼�����
        if(a>0)             //��ֹԽ��
        carry=b[32-a];        //���һ�α��Ƴ�����ֵ
        end
        4'b1101:
        begin
        r=b>>a;       //�߼�����
        carry=b[a];        //���һ�α��Ƴ�����ֵ
        end
    endcase
    if(aluc!=4'b1011&&aluc!=4'b1010)
    zero=(r==0)?1:0;            //zeroͨ��ֱ���ж�out�Ƿ�Ϊ0
    if(aluc!=4'b1011&&aluc!=4'b0010&&aluc!=4'b0011)
    negative=r[31];
    end
endmodule
