module vga(
			  input logic clk,
			  output logic vgaclk,
			  output logic hsync, vsync,
			  output logic sync_b, blank_b,
			  output logic unsigned [7:0] r_out, g_out, b_out,
			  output reg [15:0] readAddress, posoffset = 1,
			  output reg rst,
			  output logic hold,
			  input reg switch,
			  input logic [7:0] pixelValue
			  );
	
	pll vgapll(clk, vgaclk);

	reg [9:0] x, y;

	always_ff @(posedge vgaclk) begin

		if (switch == 0) begin
			posoffset <= readAddress;
		end else begin
			posoffset <= readAddress + 10001;
		end

	end
	
	vgaController vgaCont(vgaclk, hsync, vsync, sync_b, blank_b, rst, hold, x, y);
	
	vgaMatrix #(200) vgaMx(vgaclk, rst, hold, pixelValue, readAddress, r_out, g_out, b_out);
	
endmodule
