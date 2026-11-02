// previously submitted in lab 2 but adapted to allow digits
module SevenSegment(input [3:0] digit, output reg [6:0] segments);

	always @(*) begin // whenever digits change, update
		case (digit)
			4'd0: segments = 7'b1000000;
			4'd1: segments = 7'b1111001;
			4'd2: segments = 7'b0100100;
			4'd3: segments = 7'b0110000;
			4'd4: segments = 7'b0011001;
			4'd5: segments = 7'b0010010;
			4'd6: segments = 7'b0000010;
			4'd7: segments = 7'b1111000;
			4'd8: segments = 7'b0000000;
			4'd9: segments = 7'b0010000;
			default: segments = 7'b1111111;
		endcase
	end
	
endmodule

module clock_divider (input clk, input reset, output reg tick);

	reg [25:0] count; // 26 slots to fit up to ~66 million values
	
	initial begin
		count = 0;
		tick = 0;
	
	end
	
	// runs only when clk is on the positive edge
	always @(posedge clk) begin
		if (reset) begin
			count <= 0;
			tick <= 0; // tick tells it when a second has been counted in clock cycles
		end
		else if (count == 49999999) begin
			count <= 0;
			tick <= 1; // end reached, telling the computer to tick
		end
		else begin
			count <= count + 1; // counting clock cycles
			tick <= 0;
		end
	end

endmodule

module Lab4 (
	input MAX10_CLK1_50,
	input [1:0] KEY,
	input [9:0] SW,
	output [7:0] HEX0,
	output [7:0] HEX1,
	output [7:0] HEX2,
	output [7:0] HEX3,
	output [7:0] HEX4,
	output [7:0] HEX5
);

	wire reset;
	wire one_sec_tick;
	reg [4:0] seconds;
	wire [3:0] tens;
	wire [3:0] ones;

	assign reset = ~KEY[0];
	
	clock_divider div (
		.clk (MAX10_CLK1_50),
		.reset(reset),
		.tick(one_sec_tick)
	);
	
	initial seconds = 24;
	reg paused = 0;
	reg key1_prev = 1;
	reg lessThanTen = 0;
	
	always @(posedge MAX10_CLK1_50) begin
		key1_prev <= KEY[1];
	
		if (reset) begin
			if (SW[0] == 1)
				seconds <= 30;
			else
				seconds <= 24;
			paused <= 0;
		end
		else begin
		
			if (key1_prev == 1 && KEY[1] == 0)
				paused <= ~paused;
				
			if (one_sec_tick == 1 && seconds != 0 && paused == 0) begin
				seconds <= seconds - 1;
			end
		end
	end
	
	
	assign tens = seconds/10;
	assign ones = seconds%10;
	
	SevenSegment seg_ones(.digit(ones), .segments(HEX0[6:0]));
	
	SevenSegment seg_tens(.digit(tens == 0 ? 4'd15 : tens), .segments(HEX1[6:0]));
	
	assign HEX0[7] = 1'b1;
	assign HEX1[7] = 1'b1;
	
	assign HEX2 = 8'b11111111;
	assign HEX3 = 8'b11111111;
	assign HEX4 = 8'b11111111;
	assign HEX5 = 8'b11111111;
	
endmodule
