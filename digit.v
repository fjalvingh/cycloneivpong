module digit
#(
	CXPOS = 5,			
	CYPOS = 1,
	PXW = 5,
	PXH = 5
) (
	output reg[2:0] color,
	input wire[9:0] x,
	input wire[9:0] y,
	input wire increment,
	input wire reset,
	input wire clk, rst
);
	wire pixel;
	
	reg[3:0] counter;
	
	number number(pixel, x[4:3], y[4:2], counter, clk);
	
	always@(posedge clk) begin
		if(x[9:5] == CXPOS && y[9:5] == CYPOS) begin
			color = pixel ? 3'b010 : 3'b000;
		end else begin
			color = 3'b000;
		end
	end
	
	always@(posedge increment, negedge rst) begin
		if(! rst) begin
			counter = 4'h0;
		end else begin
			counter = counter + 4'h1;
		end
	end
endmodule
