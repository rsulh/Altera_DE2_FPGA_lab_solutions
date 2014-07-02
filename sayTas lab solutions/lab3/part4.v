module part4(D,Clk,Qa,Qb,Qc);

input D,Clk;
output Qa,Qb,Qc;

Dlatc D0(D,Clk,Qa);
Dflipflop D1(D,Clk,Qb);
Dflipflop1 D2(D,Clk,Qc);

endmodule

module Dlatc(D,Clk,Q);

input D,Clk;
output reg Q;

always @(D,Clk)
begin
	if(Clk)
	Q<=D;
	end

endmodule

module Dflipflop(D,Clk,Q_b);

input D,Clk;
output Q_b;
reg Q_m;

always @(posedge Clk)
begin
	Q_m<=D;
end

assign Q_b=Q_m;
endmodule
module Dflipflop1(D,Clk,Q_c);

input D,Clk;
output Q_c;
reg Q_n;
always @(negedge Clk)
begin
	Q_n<=D;
end
assign Q_c=Q_n;
endmodule
