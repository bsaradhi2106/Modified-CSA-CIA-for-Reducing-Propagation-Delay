
//csa
module csa(a,b,c,S,clk);
input [3:0] a,b,c;
input clk;
output reg [4:0]S;
wire [10:0]w;wire [4:0]s;
fa y1(a[0],b[0],c[0],s[0],w[0]);
fa y2(a[1],b[1],c[1],w[1],w[2]);
fa y3(a[2],b[2],c[2],w[3],w[4]);
fa y4(a[3],b[3],c[3],w[5],w[6]);
fa y5(w[0],w[1],1'b0,s[1],w[7]);
fa y6(w[2],w[3],w[7],s[2],w[8]);
fa y7(w[4],w[5],w[8],s[3],w[9]);
fa y8(w[6],w[9],1'b0,s[4],w[10]);

always@(posedge clk)
S<=s;


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


