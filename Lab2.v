module Lab2(A,B,C,D,LED0, LED1, LED2, LED3, LED4, LED5, LED6);

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