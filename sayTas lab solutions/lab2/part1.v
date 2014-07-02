module part1(SW,LEDR,HEX0,HEX1,HEX2,HEX3);

input [15:0] SW;
output [6:0]HEX0;
output [6:0]HEX1;
output [6:0]HEX2;
output [6:0]HEX3;

output [15:0] LEDR;

assign LEDR[15:0]=SW[15:0];

decoder h3(SW[15:12],HEX3);
decoder h2(SW[11:8],HEX2);
decoder h1(SW[7:4],HEX1);
decoder h0(SW[3:0],HEX0);

endmodule
    module decoder(S,H);
    input [3:0]S;
    output [6:0]H;
    
    assign H[0]=(~S[3]&~S[2]&~S[1]&S[0])|(~S[3]&S[2]&~S[1]&~S[0]);
    assign H[1]=(~S[3]&S[2]&~S[1]&S[0])|(~S[3]&S[2]&S[1]&~S[0]);
    assign H[2]=(~S[3]&~S[2]&S[1]&~S[0]);
    assign H[3]=(~S[3]&~S[2]&~S[1]&S[0])|(~S[3]&S[2]&~S[1]&~S[0])|(~S[3]&S[2]&S[1]&S[0])|(S[3]&~S[2]&~S[1]&S[0]);
    assign H[4]=(~S[3]&~S[2]&~S[1]&S[0])|(~S[3]&~S[2]&S[1]&S[0])|(~S[3]&S[2]&~S[1]&~S[0])|(~S[3]&S[2]&~S[1]&S[0])|
                            (~S[3]&S[2]&S[1]&S[0])|(S[3]&~S[2]&~S[1]&S[0]); 
   assign H[5]=(~S[3]&~S[2]&~S[1]&S[0])|(~S[3]&~S[2]&S[1]&~S[0])|(~S[3]&~S[2]&S[1]&S[0])|(~S[3]&S[2]&S[1]&S[0]);
    assign H[6]=(~S[3]&~S[2]&~S[1]&~S[0])|(~S[3]&~S[2]&~S[1]&S[0])|(~S[3]&S[2]&S[1]&S[0]);
    endmodule
    