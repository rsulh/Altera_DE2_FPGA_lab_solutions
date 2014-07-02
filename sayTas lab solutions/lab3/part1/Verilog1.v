`timescale 1ns /1ns
module Testbench();

reg R1,S1,Clk1;
wire Q1;

part1 CompToTest(R1,S1,Clk1,Q1);

initial begin

R1<=0;S1<=0;Clk1<=0;
#20
R1<=0;S1<=0;Clk1<=1;
#20
R1<=0;S1<=1;Clk1<=0;
#20
R1<=0;S1<=1;Clk1<=1;
#20
R1<=1;S1<=0;Clk1<=0;
#20
R1<=1;S1<=0;Clk1<=1;
#20
R1<=1;S1<=1;Clk1<=0;
#20
R1<=1;S1<=1;Clk1<=1;

end
endmodule
