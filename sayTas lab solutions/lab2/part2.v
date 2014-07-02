module part2(SW,LEDR,LEDG,HEX0,HEX1);

input [3:0] SW;
output [3:0] LEDR;
output [6:0] HEX0,HEX1;
output [1:0] LEDG;

wire k;
wire [2:0] l;
wire [3:0] m;

assign LEDR[3:0]= SW[3:0];

comp c(SW[3:0],k);
assign LEDG[0]= k;

circuita cira(SW[2:0], l[2:0]);

mux m3(SW[3],1'b0,k,m[3]);
mux m2(SW[2],l[2],k,m[2]);
mux m1(SW[1],l[1],k,m[1]);
mux m0(SW[0],l[0],k,m[0]);

yediseg seg1(m[3:0],HEX0);

circuitb cirb(k,HEX1);

endmodule

module comp(w,z);

input [3:0] w;
output z;

assign z= w[3]&(w[2]|w[1]);
endmodule

module circuita(a,b);

input [2:0] a;
output [2:0] b;

assign b[2]=a[2]&a[1];
assign b[1]=a[2]&(~a[1]);
assign b[0]=a[0];

endmodule

module mux(c,d,e,f);

input c,d,e;
output f;

assign f=(c&(~e))|(d&e);

endmodule

module yediseg(a,b);

input [3:0] a;
output [6:0] b;

assign b[0]= ~(a[3]|a[1])&(a[2]^a[0]);
assign b[1]= ~a[3]&a[2]&(a[1]^a[0]);
assign b[2]= ~a[3]&~a[2]&a[1]&~a[0];
assign b[3]= (~a[3]&~a[2]&~a[1]&a[0])|(~a[3]&a[2]&(~a[1])&(~a[0]))|(~a[3]&a[2]&a[1]&a[0]);
assign b[4]= ~(~(a[3]|a[2]|a[1]|a[0])|(~a[3]&(~a[2])&a[1]&(~a[0]))|(~a[3]&a[2]&a[1]&(~a[0]))|(a[3]&(~a[2])&(~a[1])&(~a[0])));
assign b[5]= (~a[3]&~a[2]&~a[1]&a[0])|(~a[3]&(~a[2])&a[1]&(~a[0]))|(~a[3]&(~a[2])&a[1]&a[0])|(~a[3]&a[2]&a[1]&a[0]);
assign b[6]= (~a[3]&~a[2]&~a[1]&~a[0])|(~a[3]&(~a[2])&(~a[1])&a[0])|(~a[3]&a[2]&a[1]&a[0]);

endmodule

module circuitb(g,h);

input g;
output [6:0] h;

wire [3:0] j;

assign j[3]=~g&g;
assign j[2]=~g&g;
assign j[1]=~g&g;
assign j[0]=g;

yediseg seg2(j[3:0],h[6:0]);
endmodule
