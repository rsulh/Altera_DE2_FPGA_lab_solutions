module part4(SW,LEDR,LEDG,HEX6,HEX4,HEX1,HEX0);

input [8:0] SW;
output [6:0] HEX0,HEX1,HEX4,HEX6;
output [8:0] LEDR;
output [1:0] LEDG;

wire [3:0] m,n,o;
wire c;

assign LEDG[1] = (SW[7]&(SW[6]|SW[5]))|(SW[3]&(SW[2]|SW[1]));

yediseg seg0(SW[7:4],HEX6);
yediseg seg1(SW[3:0],HEX4);

dortbitfa dort(SW[7:4],SW[3:0],SW[8],m,c);
ayirici ay(m,c,n,o);

assign LEDG[0]=(m[3]&(m[2]|m[1]))|(c&(~m[3]));

yediseg seg2(n,HEX0);
yediseg seg3(o,HEX1);

endmodule

module dortbitfa(a,b,cin,s,co);
input [3:0] a,b;
input cin;
output [3:0] s;
output co;
wire k,l,m;

fulladder f0(a[0],b[0],cin,s[0],k);
fulladder f1(a[1],b[1],k,s[1],l);
fulladder f2(a[2],b[2],l,s[2],m);
fulladder f3(a[3],b[3],m,s[3],co);

endmodule

module fulladder(a,b,cin,s,co);

input a,b,cin;
output s,co;

assign s=a^b^cin;
assign co=(a&b)|(a&cin)|(b&cin);

endmodule

module ayirici(a,c,b,o);
input [3:0] a;
input c;
output [3:0] b,o;

assign b[0]=a[0];
assign b[1]=(a[1])^(a[3]&((a[2]|a[1]))|(c&~a[3]));
assign b[2]=((~((a[2])^a[1]))&((a[3]&(a[2]|a[1]))|(c&~a[3]))) | (a[2]&(~((a[3]&(a[2]|a[1]))|(c&~a[3]))));
assign b[3]=(a[3]&(~((a[3]&(a[2]|a[1]))|(c&~a[3]))))|(~a[3]&a[1]&(((a[3]&(a[2]|a[1]))|(c&~a[3]))));

assign o[0]=(a[3]&((a[2]|a[1]))|(c&~a[3]));
assign o[1]=1'b0;
assign o[2]=1'b0;
assign o[3]=1'b0;

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
