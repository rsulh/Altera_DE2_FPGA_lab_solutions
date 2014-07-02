module part5 (SW, HEX0);
	input [17:0] SW;		// toggle switches
	output [6:0] HEX0;	// 7-seg displays

	wire [2:0] M;

	// module mux_3bit_5to1 (S, U, V, W, X, Y, M);
   mux_3bit_5to1 N4 (SW[17:15], SW[14:12], SW[11:9],SW[8:6], SW[5:3], SW[2:0], M0);
   mux_3bit_5to1 N3 (SW[17:15], SW[11:9], SW[8:6], SW[5:3], SW[2:0], SW[14:12], M1);
   mux_3bit_5to1 N2 (SW[17:15], SW[8:6], SW[5:3], SW[2:0], SW[14:12], SW[11:9], M2);
   mux_3bit_5to1 N1 (SW[17:15], SW[5:3], SW[2:0],  SW[14:12], SW[11:9],  SW[8:6], M3);
   mux_3bit_5to1 N0 (SW[17:15], SW[2:0], SW[14:12], SW[11:9], SW[8:6], SW[5:3], M4);
	// module char_7seg (C, Display);
	char_7seg H0(M0,HEX0);
    char_7seg H1(M1,HEX1);
    char_7seg H2(M2,HEX2);
    char_7seg H3(M3,HEX3);
    char_7seg H4(M4,HEX4);
   
endmodule

// implements a 3-bit wide 5-to-1 multiplexer
module  part3(SW,LEDG,LEDR);
	input [17:0] SW;
	output [2:0] LEDG;
	output [17:0] LEDR;
	wire [1:3] m_0, m_1, m_2;
	
	assign LEDR= SW;
	assign m_0[1] = (!SW[15] & SW[0]) | (SW[15] & SW[3]);
	assign m_0[1] = (!SW[15] & SW[0]) | (SW[15] & SW[3]);
	assign m_0[2] = (!SW[15] & SW[6]) | (SW[15] & SW[9]);
	assign m_0[3] = (!SW[16] & m_0[1]) | (SW[16] & m_0[2]);
	assign LEDG[0] = (!SW[17] & m_0[3]) | (SW[17] & SW[12]); 

	assign m_1[1] = (!SW[15] & SW[1]) | (SW[15] & SW[4]);
	assign m_1[1] = (!SW[15] & SW[1]) | (SW[15] & SW[4]);
	assign m_1[2] = (!SW[15] & SW[7]) | (SW[15] & SW[10]);
	assign m_1[3] = (!SW[16] & m_1[1]) | (SW[16] & m_1[2]);
	assign LEDG[1] = (!SW[17] & m_1[3]) | (SW[17] & SW[13]);
	
	assign m_2[1] = (!SW[15] & SW[2]) | (SW[15] & SW[5]);
	assign m_2[1] = (!SW[15] & SW[2]) | (SW[15] & SW[5]);
	assign m_2[2] = (!SW[15] & SW[8]) | (SW[15] & SW[11]);
	assign m_2[3] = (!SW[16] & m_2[1]) | (SW[16] & m_2[2]);
	assign LEDG[2] = (!SW[17] & m_2[3]) | (SW[17] & SW[14]);	

endmodule

module char_7seg (C, Display);
	input [2:0] C;				
	output [6:0] Display;	


	assign Display[0] = !((!C[2] & !C[1] & C[0]) | (!C[2] & C[1] & C[0])); 
	assign Display[1] = !((!C[2] & !C[1] & !C[0]) | (!C[2] & C[1] & C[0])); 
	assign Display[2] = !((!C[2] & !C[1] & !C[0]) | (!C[2] & C[1] & C[0])); 
	assign Display[3] = !((!C[2] & !C[1] & C[0]) | (!C[2] & C[1] & !C[0]) |
		(!C[2] & C[1] & C[0])); 
	assign Display[4] = !((!C[2] & !C[1] & !C[0]) | (!C[2] & !C[1] & C[0]) | 
		(!C[2] & C[1] & !C[0]) | (!C[2] & C[1] & C[0]));
	assign Display[5] = !((!C[2] & !C[1] & !C[0]) | (!C[2] & !C[1] & C[0]) | 
		(!C[2] & C[1] & !C[0]) | (!C[2] & C[1] & C[0])); 
	assign Display[6] = !((!C[2] & !C[1] & !C[0]) | (!C[2] & !C[1] & C[0]));
endmodule

