
module part3(SW,LEDR,LEDG);

input [8:0] SW;
output [8:0] LEDR;
output [5:0] LEDG;

wire a,b,c;

assign LEDR[8:0]=SW[8:0];

fulladder f0(SW[8],SW[0],SW[4],LEDG[0],a);
fulladder f1(a,SW[1],SW[5],LEDG[1],b);
fulladder f2(b,SW[2],SW[6],LEDG[2],c);
fulladder f3(c,SW[3],SW[7],LEDG[3],LEDG[4]);

endmodule

module fulladder(a,b,ci,s,co);

input a,b,ci;
output s,co;

assign s=a^b^ci;
assign co=(a&b) | (a&ci) | (b&ci);

endmodule
