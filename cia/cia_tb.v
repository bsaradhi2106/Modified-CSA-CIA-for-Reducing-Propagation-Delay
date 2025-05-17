`timescale 1 ns/1 ns
`include "cia.v"


//tb
module cia_tb;
reg [7:0] a,b;
reg cin;
wire [8:0]s;
cia dut(a,b,cin,s[7:0],s[8]);
initial
repeat(10)
begin
a=$random;
b=$random;
cin=$random;
#10;
$display($time," %d + %d + %d --> %d ",a,b,cin,s);
end
endmodule
