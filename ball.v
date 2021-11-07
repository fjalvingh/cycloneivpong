/**
 * Handles the ball, primarily its moves.
 */
module ballcontroller
#(
	parameter WIDTH = 20,
	parameter HEIGHT = 20
)
(
	output wire[2:0] color,
	input wire[9:0] x,
	input wire[9:0] y,
	input wire clk, vsync, rst, paddlehit,
	output wire ballhit, 
	output reg collision
);

	reg[9:0] xpos;
	reg[9:0] ypos;
	reg[15:0] clkdiv;
	reg xdir;
	reg ydir;
	reg vsyncdone;
	wire atx, aty;
//	reg collision;
	
	assign atx = x >= xpos && x < xpos + WIDTH;
	assign aty = y >= ypos && y < ypos + HEIGHT;
	assign ballhit = atx && aty;
	assign color = atx && aty ? 3'b110 : 3'b000;
	
	always@(posedge clk, negedge rst) begin
		if(! rst) begin
			xpos = 320;
			ypos = 40;
			xdir = 1;
			ydir = 0;
			collision = 0;
			vsyncdone = 0;
		end else begin
			if(ballhit && paddlehit) begin
				collision = 1;							// Set marker that we collided
			end
			
			//-- As soon as we enter vsync...
			if(vsync) begin
				vsyncdone = 0;							// As soon as we exit vsync -> set done to no
			end else if(! vsyncdone) begin
				vsyncdone = 1;							// Mark action as done
				if(ypos == 0) begin
					ydir = ! ydir;
				end
				if(ypos >= 480-HEIGHT) begin
					ydir = ! ydir;
				end
				
				if(collision) begin
					xdir = ! xdir;
					collision = 0;
				end
				
				if(xpos >= 640) begin
					xpos = 1;
					xdir = 1;
				end else if(xpos == 0) begin
					xpos = 639;
					xdir = 0;
				end else if(xdir) begin
					xpos = xpos + 8;
				end else begin
					xpos = xpos - 8;
				end
				if(ydir) begin
					ypos = ypos + 8;
				end else begin
					ypos = ypos - 8;
				end
			end
		end
	end

endmodule
