
module cia(a,b,cin,s,cout);
input [7:0] a,b;
input cin;
output [7:0]s;
output cout;
wire [15:0]w;
//rca1
fa x1(a[0],b[0],cin,s[0],w[0]);
fa x2(a[1],b[1],w[0],s[1],w[1]);
fa x3(a[2],b[2],w[1],s[2],w[2]);
fa x4(a[3],b[3],w[2],s[3],w[3]);
//rca2
fa x5(a[4],b[4],1'b0,w[4],w[5]);
fa x6(a[5],b[5],w[5],w[6],w[7]);
fa x7(a[6],b[6],w[7],w[8],w[9]);
fa x8(a[7],b[7],w[9],w[10],w[11]);
//ic
xor x9(s[4],w[4],w[3]);
and x10(w[12],w[4],w[3]);
xor x11(s[5],w[6],w[12]);
and x12(w[13],w[6],w[12]);
xor x13(s[6],w[8],w[13]);
and x14(w[14],w[8],w[13]);
xor x15(s[7],w[10],w[14]);
and x16(w[15],w[10],w[14]);
or x17(cout,w[11],w[15]);
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

