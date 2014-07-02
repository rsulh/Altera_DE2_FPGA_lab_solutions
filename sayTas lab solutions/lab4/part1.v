module part1(SW,KEY,HEX0,HEX1);
input[1:0] SW;
input [0:0] KEY;
output [6:0] HEX0,HEX1;

wire [7:0] q;

Tffa t0(SW[1],KEY[0],SW[0],q[0]);
Tffa t1((SW[1] & q[0]),KEY[0],SW[0],q[1]);
Tffa t2((SW[1] & q[0] & q[1]),KEY[0],SW[0],q[2]);
Tffa t3((SW[1] & q[0] & q[1] & q[2]),KEY[0],SW[0],q[3]);
Tffa t4((SW[1] & q[0] & q[1] & q[2] & q[3]),KEY[0],SW[0],q[4]);
Tffa t5((SW[1] & q[0] & q[1] & q[2] & q[3] & q[4]),KEY[0],SW[0],q[5]);
Tffa t6((SW[1] & q[0] & q[1] & q[2] & q[3] & q[4] & q[5]),KEY[0],SW[0],q[6]);
Tffa t7((SW[1] & q[0] & q[1] & q[2] & q[3] & q[4] & q[5] & q[6]),KEY[0],SW[0],q[7]);

disp D0(q[3:0],HEX0);
disp D1(q[7:4],HEX1);
endmodule

module Tffa(Enbl,Clk,Clr,q);

input Enbl, Clk, Clr ; 
output q;

reg q;

always @ ( posedge Clk)
if (Clr) begin
  q <= 1'b0;
end 
else if (Enbl) begin
  q <= ~q;
end

endmodule 

module disp(x,y);

input [3:0] x;
output [6:0] y;

assign y[0]= (~(x[3]|x[1])&(x[2]^x[0]))|(x[3]&(~x[2])&(x[1])&x[0])|(x[3]&(x[2])&(~x[1])&x[0]);
assign y[1]= (~x[3]&x[2]&(x[1]^x[0]))|(x[3]&(~x[2])&(x[1])&x[0])|(x[3]&(x[2])&(~x[1])&(~x[0]))|(x[3]&(x[2])&(x[1])&(~x[0]))|(x[3]&(x[2])&(x[1])&x[0]);
assign y[2]= (~x[3]&~x[2]&x[1]&~x[0])|(x[3]&(x[2])&(~x[1])&(~x[0]))|(x[3]&(x[2])&(x[1])&(~x[0]))|(x[3]&(x[2])&(x[1])&x[0]);
assign y[3]= (~x[3]&~x[2]&~x[1]&x[0])|(~x[3]&x[2]&(~x[1])&(~x[0]))|(~x[3]&x[2]&x[1]&x[0])|(x[3]&(~x[2])&x[1]&(~(x[0])))|(x[3]&x[2]&x[1]&x[0]);
assign y[4]= (~x[3]&(~x[2])&~x[1]&(x[0])|(~x[3]&(~x[2])&x[1]&(x[0]))|(~x[3]&x[2]&~x[1]&(~x[0]))|(~x[3]&(x[2])&(~x[1])&(x[0]))|(~x[3]&(x[2])&(x[1])&(x[0]))|(x[3]&(~x[2])&(~x[1])&(x[0])));
assign y[5]= (~x[3]&~x[2]&~x[1]&x[0])|(~x[3]&(~x[2])&x[1]&(~x[0]))|(~x[3]&(~x[2])&x[1]&x[0])|(~x[3]&x[2]&x[1]&x[0])|(x[3]&x[2]&(~x[1])&x[0]);
assign y[6]= (~x[3]&~x[2]&~x[1]&~x[0])|(~x[3]&(~x[2])&(~x[1])&x[0])|(~x[3]&x[2]&x[1]&x[0])|(x[3]&x[2]&(~x[1])&(~x[0]));

endmodule

