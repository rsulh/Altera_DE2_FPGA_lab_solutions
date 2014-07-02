
module part2 (SW,LEDR,Q);

input [1:0] SW;
output Q;
output LEDR;

wire R_g, S_g, Qa, Qb;

assign S_g = ~(SW[0] & SW[1]);
assign R_g = ~(~SW[0] & SW[1]);

assign Qa = ~(S_g & Qb);

assign Qb = ~(R_g & Qa);

assign Q = Qa;
assign LEDR=Q;

endmodule
