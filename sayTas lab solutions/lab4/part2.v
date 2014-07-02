module part2(SW,KEY,HEX0,HEX1,HEX2,HEX3);
input[1:0] SW;
input [0:0] KEY;
output [6:0] HEX0,HEX1,HEX2,HEX3;
wire [15:0] q;

counter_16bit C0(SW[1],KEY[0],SW[0],q);
disp D0(q[3:0],HEX0);
disp D1(q[7:4],HEX1);
disp D2(q[11:8],HEX2);
disp D3(q[15:12],HEX3);
endmodule

module counter_16bit(enable,Clk,Clr,out);

input enable, Clk, Clr;
output [15:0] out;

reg [15:0] out;
always @(posedge Clk)
if (Clr) begin
  
out <= 16'b0 ;
end 
else if (enable) begin 
out <= out + 1;
end
endmodule 


module disp(x,y);

input [3:0] x;
output [6:0] y;

assign y[0]= (~(x[3]|x[1])&(x[2]^x[0]))|(x[3]&(~x[2])&(x[1])&x[0])|(x[3]&(x[2])&(~x[1])&x[0]);
assign y[1]= (~x[3]&x[2]&(x[1]^x[0]))|(x[3]&(~x[2])&(x[1])&x[0])|(x[3]&(x[2])&(~x[1])&(~x[0]))|(x[3]&(x[2])&(x[1])&(~x[0]))|(x[3]&(x[2])&(x[1])&x[0]);
assign y[2]= (~x[3]&~x[2]&x[1]&~x[0])|(x[3]&(x[2])&(~x[1])&(~x[0]))|(x[3]&(x[2])&(x[1])&(~x[0]))|(x[3]&(x[2])&(x[1])&x[0]);
assign y[3]= (~x[3]&~x[2]&~x[1]&x[0])|(~x[3]&x[2]&(~x[1])&(~x[0]))|(~x[3]&x[2]&x[1]&x[0])|(x[3]&(~x[2])&x[1]&(~(x[0])))|(x[3]&x[2]&x[1]&x[0]);
assign y[4]= ((~x[3])&(~x[2])&(~x[1])&x[0])|(~x[3]&(~x[2])&x[1]&(x[0]))|(~x[3]&x[2]&~x[1]&(~x[0]))|(~x[3]&(x[2])&(~x[1])&(x[0]))|(~x[3]&(x[2])&(x[1])&(x[0]))|(x[3]&(~x[2])&(~x[1])&(x[0]));
assign y[5]= (~x[3]&~x[2]&~x[1]&x[0])|(~x[3]&(~x[2])&x[1]&(~x[0]))|(~x[3]&(~x[2])&x[1]&x[0])|(~x[3]&x[2]&x[1]&x[0])|(x[3]&x[2]&(~x[1])&x[0]);
assign y[6]= (~x[3]&~x[2]&~x[1]&~x[0])|(~x[3]&(~x[2])&(~x[1])&x[0])|(~x[3]&x[2]&x[1]&x[0])|(x[3]&x[2]&(~x[1])&(~x[0]));

endmodule


