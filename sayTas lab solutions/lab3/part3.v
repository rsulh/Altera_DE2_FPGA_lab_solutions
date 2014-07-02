module part3(SW,LEDR);

input [1:0] SW;
output [0:0]LEDR;

wire Q_m;

d_latch s0(SW[0],~(SW[0]),~(SW[1]),Q_m);
d_latch s1(Q_m,~(Q_m),SW[1],LEDR[0]);

endmodule

module d_latch(D,D_d,Clk,Q);

input D,D_d,Clk;
output Q;

wire r_g,s_g,Qa,Qb/* synthesis keep */;

assign r_g = ~(D&Clk);
assign s_g = ~(D_d&Clk);
assign Qa = ~(r_g&Qb);
assign Qb = ~(s_g&Qa);

assign Q = Qa;

endmodule
