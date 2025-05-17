`timescale 1 ns/1 ns
`include "hybr.v"

//tb
module hybrid_tb;
reg [7:0] a,b,c;reg clk;
wire [8:0]s;
hybrid dut(a,b,c,s[7:0],s[8],clk);
initial
repeat(10)
begin
a=$random;
b=$random;
c=$random;
#10;
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

