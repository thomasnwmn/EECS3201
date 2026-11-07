`timescale 1 ns/1 ps

module tb();

reg a;
reg b;
reg c;

wire x, y;

test1 dut(.a(a), .b(b), .c(c), .x(x), .y(y));

initial
begin

	a = 0;
	b = 0;
	c = 0;
	#20;
	
	a = 0;
	b = 0;
	c = 1;
	#20;
	
	a = 0;
	b = 1;
	c = 0;
	#20;
	
	a = 0;
	b = 1;
	c = 1;
	#20;
	
	a = 1;
	b = 0;
	c = 0;
	#20;
	
	a = 1;
	b = 0;
	c = 1;
	#20;
	
	a = 1;
	b = 1;
	c = 0;
	#20;
	
	a = 1;
	b = 1;
	c = 1;
	#20;

end

always
begin
	#1;
	if (x == 0 && y == 0)
		$display("All outputs are zero");
	#19;
end

endmodule