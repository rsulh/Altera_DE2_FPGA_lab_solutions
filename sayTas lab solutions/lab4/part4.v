module part4(CLOCK_50,HEX0);
input CLOCK_50;
output [6:0] HEX0;
wire w0;
wire [3:0]w1;

timerr t0(CLOCK_50,w0);
counter c0(w0,CLOCK_50,w1);

disp d0(w1,HEX0);

endmodule

module timerr(clk,q);
input clk;
output q;
reg [25:0] a;
reg qa;
always @(posedge clk)
begin
if(a==50000000)
begin
qa<=1;
a<=0;
end
else
begin
qa<=0;
a<=a+1;
end
end
assign q=qa;
endmodule

module disp(S,H);
 input [3:0]S;
 output [6:0]H;
    
 assign H[0]=(~S[3]&~S[2]&~S[1]&S[0])|(~S[3]&S[2]&~S[1]&~S[0]);
 assign H[1]=(~S[3]&S[2]&~S[1]&S[0])|(~S[3]&S[2]&S[1]&~S[0]);
 assign H[2]=(~S[3]&~S[2]&S[1]&~S[0]);
 assign H[3]=(~S[3]&~S[2]&~S[1]&S[0])|(~S[3]&S[2]&~S[1]&~S[0])|(~S[3]&S[2]&S[1]&S[0]);
 assign H[4]=(~S[3]&~S[2]&~S[1]&S[0])|(~S[3]&~S[2]&S[1]&S[0])|(~S[3]&S[2]&~S[1]&~S[0])|(~S[3]&S[2]&~S[1]&S[0])|
                            (~S[3]&S[2]&S[1]&S[0])|(S[3]&~S[2]&~S[1]&S[0]);
 assign H[5]=(~S[3]&~S[2]&~S[1]&S[0])|(~S[3]&~S[2]&S[1]&~S[0])|(~S[3]&~S[2]&S[1]&S[0])|(~S[3]&S[2]&S[1]&S[0]);
 assign H[6]=(~S[3]&~S[2]&~S[1]&~S[0])|(~S[3]&~S[2]&~S[1]&S[0])|(~S[3]&S[2]&S[1]&S[0]);
    
endmodule

module counter(d,Clk,q);
input d,Clk;
output [3:0] q;
reg [3:0] qa;

always @(posedge Clk)
begin
if(d)
begin
qa<=qa+1;
if(qa==9)
qa<=0;
end
end
assign q=qa;
endmodule
