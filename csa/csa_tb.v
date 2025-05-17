`timescale 1 ns/1 ns
`include "csa.v"



//csa_tb
module csa_tb;
reg [3:0] a,b,c;
wire [4:0]s;
reg clk;
csa dut(a,b,c,s,clk);
initial
repeat(10)
begin
a=$random;
b=$random;
c=$random;
#10;
//$display($time," clk-%b - %d + %d + %d --> %d ",clk,a,b,c,s);
end

initial
begin
$monitor($time," clk-%b - %d + %d + %d --> %d ",clk,a,b,c,s);
clk=1'b0;
end

always #5 clk=~clk;

initial
#100 $finish;

endmodule
