module vga_ram_block(
			  input logic clk,
			  output logic vga_clk,
			  output logic hsync, vsync,
			  output logic sync_b, blank_b,
			  output logic unsigned [7:0] r_out, g_out, b_out,
			  output reg [15:0] readAddress = 0, posoffset = 1,
			  output reg rst,
			  output logic hold,
			  input reg switch,
			  output logic reset = 0,
			  output logic [15:0] count,
			  output logic [7:0] pixelValue, newData
			  );
			  

	always_ff@(posedge vga_clk or posedge reset) begin
		if (reset) begin
			count <= 15'b0;
			newData <= 8'b0;
		end else begin
			count <= count + 1;
			newData <= newData + 1;
		end
	end
	
	DataMem ram (.address_a(count), .address_b(readAddress), .inclock(vga_clk),.outclock(~vga_clk), .data_a(newData), .data_b(8'b0),
	.wren_a(1'b0), .wren_b(1'b0), .rden_a(1'b0), .rden_b(1'b1), .q_b(pixelValue));
	
	vga v (clk, vga_clk, hsync, vsync, sync_b, blank_b, r_out, g_out, b_out, readAddress,
	posoffset, rst, hold, switch, pixelValue);
	
endmodule
