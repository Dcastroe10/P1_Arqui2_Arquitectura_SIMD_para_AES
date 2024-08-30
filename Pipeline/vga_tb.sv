`timescale 1 ps / 1 ps

module vga_tb();

	logic clk = 0;
	logic vga_clk;
	logic Hsync;
	logic Vsync;
	logic VGA_Sync;
	logic VGA_Blank;
	logic [7:0] Red;
	logic [7:0] Green;
	logic [7:0] Blue;
	logic [15:0] readAddress, posoffset;
	logic rst;
	logic hold;
	logic switch = 1;
	
	vga v (clk, vga_clk, Hsync, Vsync, VGA_Sync, VGA_Blank, Red, Green, Blue, readAddress, posoffset, rst, hold, switch);
	
	always #5 clk = ~clk;
	
endmodule
	