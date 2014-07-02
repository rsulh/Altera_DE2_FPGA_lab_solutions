
module part5(SW,KEY,HEX0,HEX1,HEX2,HEX3,HEX4,HEX5,HEX6,HEX7);

input [15:0] SW;
input [1:0] KEY;
output [6:0] HEX0,HEX1,HEX2,HEX3,HEX4,HEX5,HEX6,HEX7;
wire [3:0] w1,w2,w3,w4;

flipflop f0(SW[15:12],KEY[1],KEY[0],w1);
flipflop f1(SW[11:8],KEY[1],KEY[0],w2);
flipflop f2(SW[7:4],KEY[1],KEY[0],w3);
flipflop f3(SW[3:0],KEY[1],KEY[0],w4);

disp d8(w1,HEX7);
disp d7(w2,HEX6);
disp d6(w3,HEX5);
disp d5(w4,HEX4);
disp d4(SW[15:12],HEX3);
disp d3(SW[11:8],HEX2);
disp d2(SW[7:4],HEX1);
disp d1(SW[3:0],HEX0);
endmodule

module flipflop(D,Clk,K,Q);

input [3:0] D;
input Clk,K;
output [3:0] Q;

reg [3:0] Q_m,Q_n;

always@(negedge Clk)
begin
    if(K)
	Q_m<=D;
end
always@(posedge Clk)
begin
	Q_n<=Q_m;
end
assign Q=Q_n;

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
