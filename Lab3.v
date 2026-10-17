module full_adder(c_in, A, B, S, c_out);

	input A, B, c_in;
	output S, c_out;
	
	assign S = (c_in&~A&~B)|(~c_in&~A&B)|(c_in&A&B)|(~c_in&A&~B);
	
	assign c_out = (c_in&B)|(c_in&A)|(A&B);

endmodule

module seven_segment(A,B,C,D,LED0, LED1, LED2, LED3, LED4, LED5, LED6);

	input A, B, C, D;
	output LED0, LED1, LED2, LED3, LED4, LED5, LED6;
	
	assign LED0 = (~A&~B&~C&D)|(~A&B&~C&~D)|(A&~B&C&D)|(A&B&~C&D);
	
	assign LED1 = (~A&B&~C&D)|(~A&B&C&~D)|(A&~B&C&D)|(A&B&~C&~D)|(A&B&C&~D)|(A&B&C&D);
	
	assign LED2 = (~A&~B&C&~D)|(A&B&~C&~D)|(A&B&C&~D)|(A&B&C&D);
	
	assign LED3 = (~A&~B&~C&D)|(~A&B&~C&~D)|(~A&B&C&D)|(A&~B&C&~D)|(A&B&C&D);
	
	assign LED4 = (~A&~B&~C&D)|(~A&~B&C&D)|(~A&B&~C&~D)|(~A&B&~C&D)|(~A&B&C&D)|(A&~B&~C&D);
	
	assign LED5 = (~A&~B&~C&D)|(~A&~B&C&~D)|(~A&~B&C&D)|(~A&B&C&D)|(A&B&~C&D);
	
	assign LED6 = (~A&~B&~C&~D)|(~A&~B&~C&D)|(~A&B&C&D)|(A&B&~C&~D);
	
endmodule

module Lab3(
	A1, A2, A3, A4, B1, B2, B3, B4, s,
	O1, O2, O3, O4, c_out,
	HEX0_0, HEX0_1, HEX0_2, HEX0_3, HEX0_4, HEX0_5, HEX0_6,
	HEX3_0, HEX3_1, HEX3_2, HEX3_3, HEX3_4, HEX3_5, HEX3_6,
	HEX5_0, HEX5_1, HEX5_2, HEX5_3, HEX5_4, HEX5_5, HEX5_6,
	HEX1_0, HEX1_1, HEX1_2, HEX1_3, HEX1_4, HEX1_5, HEX1_6
);

	input A1, A2, A3, A4, B1, B2, B3, B4, s;
	
	output HEX3_0, HEX3_1, HEX3_2, HEX3_3, HEX3_4, HEX3_5, HEX3_6;

	seven_segment HEX3(.A(A4), .B(A3), .C(A2), .D(A1), .LED0(HEX3_0), .LED1(HEX3_1), .LED2(HEX3_2), .LED3(HEX3_3), .LED4(HEX3_4), .LED5(HEX3_5), .LED6(HEX3_6));
	
	output HEX5_0, HEX5_1, HEX5_2, HEX5_3, HEX5_4, HEX5_5, HEX5_6;
	
	seven_segment HEX5(.A(B4), .B(B3), .C(B2), .D(B1), .LED0(HEX5_0), .LED1(HEX5_1), .LED2(HEX5_2), .LED3(HEX5_3), .LED4(HEX5_4), .LED5(HEX5_5), .LED6(HEX5_6));
	
	output O1, O2, O3, O4, c_out;
	output HEX0_0, HEX0_1, HEX0_2, HEX0_3, HEX0_4, HEX0_5, HEX0_6;
	
	seven_segment HEX0(.A(O4), .B(O3), .C(O2), .D(O1), .LED0(HEX0_0), .LED1(HEX0_1), .LED2(HEX0_2), .LED3(HEX0_3), .LED4(HEX0_4), .LED5(HEX0_5), .LED6(HEX0_6));
	
	wire carry1, carry2, carry3;
	
	full_adder fa0 (.A((~A1&s)|(A1&~s)), .B(B1), .c_in(s), .c_out(carry1), .S(O1));
	
	full_adder fa1 (.A((~A2&s)|(A2&~s)), .B(B2), .c_in(carry1), .c_out(carry2), .S(O2));
	
	full_adder fa2 (.A((~A3&s)|(A3&~s)), .B(B3), .c_in(carry2), .c_out(carry3), .S(O3));
	
	full_adder fa3 (.A((~A4&s)|(A4&~s)), .B(B4), .c_in(carry3), .c_out(c_out), .S(O4));
	
	output HEX1_0, HEX1_1, HEX1_2, HEX1_3, HEX1_4, HEX1_5, HEX1_6;
	
	assign HEX1_1 = ~c_out | s;
	assign HEX1_2 = ~c_out | s;
	assign HEX1_6 = c_out | ~s;
	assign HEX1_0 = 1'b1;
	assign HEX1_3 = 1'b1;
	assign HEX1_4 = 1'b1;
	assign HEX1_5 = 1'b1;

endmodule