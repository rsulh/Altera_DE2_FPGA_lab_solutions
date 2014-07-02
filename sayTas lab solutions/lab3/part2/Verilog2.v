
module part2 (SW,LEDR);

input [1:0] SW;

output [0:0]LEDR;

wire R_g, S_g, Qa, Qb;

assign S_g = ~(SW[0] & SW[1]);
assign R_g = ~(~SW[0] & SW[1]);

assign Qa = ~(S_g & Qb);

assign Qb = ~(R_g & Qa);

assign Q = Qa;
assign LEDR[0]=Q;

endmodule
