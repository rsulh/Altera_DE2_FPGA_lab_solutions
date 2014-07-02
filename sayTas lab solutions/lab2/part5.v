module part5(SW,LEDR,HEX7,HEX6,HEX5,HEX4,HEX2,HEX1,HEX0);

input [15:0] SW;
output [15:0] LEDR;
output [6:0] HEX0,HEX1,HEX2,HEX4,HEX5,HEX6,HEX7;
wire [3:0] k,l,m,n,q;
wire o,p,r,s;

assign LEDR[15:0]=SW[15:0];

yediseg seg0(SW[15:12],HEX7);
yediseg seg1(SW[11:8],HEX6);
yediseg seg2(SW[7:4],HEX5);
yediseg seg3(SW[3:0],HEX4);

dortbitfa fa1(SW[11:8],SW[3:0],1'b0,k,o);
ayirici ay1(k,o,l,p);
dortbitfa fa2(SW[15:12],SW[7:4],p,m,r);
ayirici ay2(m,r,n,s);

assign q[3]=1'b0;
assign q[2]=1'b0;
assign q[1]=1'b0;
assign q[0]=s;

yediseg seg4(l,HEX0);
yediseg seg5(n,HEX1);
yediseg seg6(q,HEX2);

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
output [3:0] b;
output o;

assign b[0]=a[0];
assign b[1]=(a[1])^(a[3]&((a[2]|a[1]))|(c&~a[3]));
assign b[2]=((~((a[2])^a[1]))&((a[3]&(a[2]|a[1]))|(c&~a[3]))) | (a[2]&(~((a[3]&(a[2]|a[1]))|(c&~a[3]))));
assign b[3]=(a[3]&(~((a[3]&(a[2]|a[1]))|(c&~a[3]))))|(~a[3]&a[1]&(((a[3]&(a[2]|a[1]))|(c&~a[3]))));

assign o=(a[3]&((a[2]|a[1]))|(c&~a[3]));


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
