
module hybr(a,b,c,sum,carry,clk);
input [7:0] a,b,c;
input clk;
output [7:0]sum;
output carry;
wire [28:0]w;
wire [7:0]s;
wire cout;
reg [7:0]sum;
reg carry;
//stage_1
fa x1(a[0],b[0],c[0],s[0],w[0]);
fa x2(a[1],b[1],c[1],w[1],w[2]);
fa x3(a[2],b[2],c[2],w[3],w[4]);
fa x4(a[3],b[3],c[3],w[5],w[6]);
fa x5(a[4],b[4],c[4],w[7],w[8]);
fa x6(a[5],b[5],c[5],w[9],w[10]);
fa x7(a[6],b[6],c[6],w[11],w[12]);
fa x8(a[7],b[7],c[7],w[13],w[14]);
//stage_2
ha y1(w[0],w[1],s[1],w[15]);
fa y2(w[2],w[3],w[15],s[2],w[16]);
fa y3(w[4],w[5],w[16],s[3],w[17]);
//xor y4(w[18],w[17],w[6]);
ha y5(w[8],w[9],w[19],w[20]);
fa y6(w[10],w[11],w[20],w[21],w[22]);
fa y7(w[12],w[13],w[22],w[23],w[24]);
//stage_3
//ha y8(w[18],w[7],s[4],w[25]);
fa y8(w[17],w[6],w[7],s[4],w[25]);
ha y9(w[25],w[19],s[5],w[26]);
ha y10(w[26],w[21],s[6],w[27]);
ha y11(w[27],w[23],s[7],w[28]);
xor y12(cout,w[14],w[28],w[24]);
always @(posedge clk)
begin 
sum<=s;
carry<=cout;
end
endmodule
//ha
module ha(a,b,s,c);
input a,b;
output s,c;
xor z1(s,a,b);
and z2(c,a,b);
endmodule
//fa
module fa(a,b,c,s,co);
input a,b,c;
output  s,co;
wire w1,w2,w3;
xor x1(s,a,b,c);
and x2(w1,a,b);
and x3(w2,b,c);
and x4(w3,c,a);
or x5(co,w1,w2,w3);
endmodule
