`timescale 1ns / 1ps
module vga(hsync,vsync,vga_r,vga_g,vga_b,clk,rst,swa,swb,swc,swd,hsync_dbg,vsync_dbg,ballhit,paddlehit, xdir);
	output wire hsync, hsync_dbg;
	output wire vsync, vsync_dbg;
	output reg vga_r;
	output reg vga_g;
	output reg vga_b;
   input clk,rst,swa,swb,swc,swd;
	output wire paddlehit;
	output wire ballhit;
	output wire xdir;

	wire valid;
	reg newframe;
	reg newline;
	
	reg clk25;						// 50MHz clock / 2
	
	reg [9:0] x;					// Line pixel counter
	reg [9:0] y;					// Horizontal line counter
	
	wire[2:0] lcolor;				// Paddle outputs
	wire[2:0] rcolor;
	wire[2:0] bcolor;				// Ball color
	wire[2:0] ldcolor;			// Left digit
	wire[2:0] rdcolor;
	
	wire onleft;					// Current position hits left paddle
	wire onright;					// "" right paddle
	wire one;
	
	configloader flashloader(one);
	
	paddle left(lcolor, onleft, x, y, swa, swb, clk, rst);
	paddle #(.XPOS(500)) right(rcolor, onright, x, y, swc, swd, clk, rst);
	ballcontroller ball(bcolor, x, y, clk, vsync, rst, paddlehit, ballhit, xdir);
	
	digit leftd(ldcolor, x, y, 0, rst, clk, rst);
	digit #(.CXPOS(13)) rightd(rdcolor, x, y, 0, rst, clk, rst);

	
	assign one = 1;
	assign hsync = x < (640 + 16) || x >= (640 + 16 + 96);
	assign vsync = y < (480 + 10) || y >= (480 + 10 + 2);		// Low between 480+10 and 480+10+2
	assign hsync_dbg = hsync;
	assign vsync_dbg = vsync;
	assign valid = (x < 640) && (y < 480);	
	assign paddlehit = onleft || onright;

   always@(posedge clk)
   begin
		clk25 <= ~clk25;
	end
	
	always@(posedge clk25)
	begin
		newline <= 0;
		newframe <= 0;
		if(x < 10'd799) begin
			x <= x + 10'b1;
		end else begin
			x <= 10'b0;
			newline <= 1;

			if(y < 10'd524) begin
				y <= y + 10'b1;
			end else begin
				y <= 10'b0;
				newframe <= 1;
			end
		end

		if(valid) begin
			vga_r = lcolor[2] || rcolor[2] || bcolor[2] || ldcolor[2] || rdcolor[2];
			vga_g = lcolor[1] || rcolor[1] || bcolor[1] || ldcolor[1] || rdcolor[1];
			vga_b = lcolor[0] || rcolor[0] || bcolor[0] || ldcolor[0] || rdcolor[0];
		end else begin
			vga_r <= 0;
			vga_g <= 0;
			vga_b <= 0;
		end
	end
endmodule
