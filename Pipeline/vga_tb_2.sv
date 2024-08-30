`timescale 1 ps / 1 ps

module vga_tb_2();

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
	logic switch = 0;
	logic [15:0] count;
	logic [7:0] pixelValue, newData;
	logic reset = 0;
	
	vga_ram_block block (.clk(clk), .vga_clk(vga_clk), .hsync(Hsync), .vsync(Vsync), .switch(switch),
	.pixelValue(pixelValue), .newData(newData), .sync_b(VGA_Sync), .blank_b(VGA_Blank),
	.readAddress(readAddress));
	
	always #5 clk = ~clk;
	
endmodule
	