module part5(CLOCK_50,HEX0,HEX1,HEX2,HEX3,HEX4,HEX5,HEX6,HEX7);
input CLOCK_50;
output [6:0] HEX0,HEX1,HEX2,HEX3,HEX4,HEX5,HEX6,HEX7;

wire sn;

wire [3:0] count;

wire  [2:0] a,b,c,d,e,f,g,h;

timerr t0(CLOCK_50,sn);
counter c0(sn,CLOCK_50,count);

decoder d0(count,a,b,c,d,e,f,g,h);


disp dis0(h,HEX0);
disp dis1(g,HEX1);
disp dis2(f,HEX2);
disp dis3(e,HEX3);

disp dis4(d,HEX4); 
disp dis5(c,HEX5); 
disp dis6(b,HEX6); 
disp dis7(a,HEX7);

endmodule


module disp(a,q);

input [2:0]a;
 
output [6:0]q;
    
 
assign q[0]=~((~a[2]&a[1]&a[0])|(~a[2]&~a[1]&a[0]));
 
assign q[1]=~((~a[2]&a[1]&a[0])|(~a[2]&~a[1]&~a[0]));
 
assign q[2]=~((~a[2]&a[1]&a[0])|(~a[2]&~a[1]&~a[0]));
 
assign q[3]=(~a[2]&~a[1]&~a[0])|a[2];
 assign q[4]=a[2];
 
assign q[5]=a[2];
 assign q[6]=~((~a[2]&~a[1]&a[0])|(~a[2]&~a[1]&~a[0]));
    

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
if(qa==7)
qa<=0;
end
end
assign q=qa;
endmodule
module decoder(count,a,b,c,d,e,f,g,h);
input [3:0] count;
reg [2:0] wa,wb,wc,wd,we,wf,wg,wh;

output [2:0] a,b,c,d,e,f,g,h;

always @(wa,wb,wc,wd,we,wf,wg,wh)
begin
case(count)
	0: begin wh<=3'b011; wg<=3'b010; wf<=3'b010; we<=3'b001; wd<=3'b000; wc<=3'b100; wb<=3'b100; wa<=3'b100;end
	1: begin wg<=3'b011; wf<=3'b010; we<=3'b010; wd<=3'b001; wc<=3'b000; wb<=3'b100; wa<=3'b100; wh<=3'b100;end
	2: begin wf<=3'b011; we<=3'b010; wd<=3'b010; wc<=3'b001; wb<=3'b000; wa<=3'b100; wh<=3'b100; wg<=3'b100;end
	3: begin we<=3'b011; wd<=3'b010; wc<=3'b010; wb<=3'b001; wa<=3'b000; wh<=3'b100; wg<=3'b100; wf<=3'b100;end
	4: begin wd<=3'b011; wc<=3'b010; wb<=3'b010; wa<=3'b001; wh<=3'b000; wg<=3'b100; wf<=3'b100; we<=3'b100;end
	5: begin wc<=3'b011; wb<=3'b010; wa<=3'b010; wh<=3'b001; wg<=3'b000; wf<=3'b100; we<=3'b100; wd<=3'b100;end
	6: begin wb<=3'b011; wa<=3'b010; wh<=3'b010; wg<=3'b001; wf<=3'b000; we<=3'b100; wd<=3'b100; wc<=3'b100;end
	7: begin wa<=3'b011; wh<=3'b010; wg<=3'b010; wf<=3'b001; we<=3'b000; wd<=3'b100; wc<=3'b100; wb<=3'b100;end
endcase
end

assign a=wa; 
assign b=wb; 
assign c=wc; 
assign d=wd; 
assign e=we; 
assign f=wf; 
assign g=wg; 
assign h=wh;
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
