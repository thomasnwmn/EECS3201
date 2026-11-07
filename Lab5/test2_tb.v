`timescale 1 ns/1 ps

module tb();

reg clk;
reg a;

wire [3:0] r;

test2 dut(.clk(clk), .a(a), .r(r));

always
begin

	clk = 1'b1;
	#10;
	
	clk = 1'b0;
	if (r == 4'd0)
		$display("All outputs are zero");
	#10;

end

initial
begin
	a = 1'b0;
	#100;
	
	a = 1'b1;
	#200;
	
	a = 1'b0;

end

endmodule