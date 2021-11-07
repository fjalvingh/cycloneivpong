module paddle
 #(
	parameter XPOS = 50,
	parameter width = 20,
	parameter height = 100,
	parameter hold = 50000
)	
(
	output wire[2:0] color,
	output wire onpaddle,			// when 1 the x,y is at the paddle
	input wire[9:0] x,
	input wire[9:0] y,
	input wire swup,
	input wire swdn,
	input clk,
	input rst
);
	
	reg[9:0] ypos;					// Paddle position
	reg[16:0] presstime;
	reg direction;
	wire atx, aty;
	wire maxy, miny;

	assign atx = x >= XPOS && x < XPOS+width;
	assign aty = y >= ypos && y < ypos + height;
	assign color = atx && aty ? 3'b011 : 3'b000;
	assign maxy = ypos > 480-height;
	assign miny = ypos == 0;
	assign onpaddle = atx && aty;
	
//	always@(negedge rst) begin
//	end
	
	always@(posedge clk) begin
		if(! rst) begin
			ypos <= 10'd100;
			presstime = 0;
//			onpaddle <= 0;
		end else if(! swup) begin
			direction <= 1;
			presstime = presstime + 9'b1;
			if(presstime > hold) begin
				presstime = 0;
				if(direction && ! maxy) begin
					ypos <= ypos + 1;
				end else if(! miny) begin
					ypos <= ypos - 1;
				end
			end
		end else if(! swdn) begin
			direction <= 0;
			presstime = presstime + 9'b1;
			if(presstime > hold) begin
				presstime = 0;
				if(direction && ! maxy) begin
					ypos <= ypos + 1;
				end else if(! miny) begin
					ypos <= ypos - 1;
				end
			end
		end else begin
			presstime = 0;
		end
//		onpaddle <= atx && aty;
	end
endmodule
