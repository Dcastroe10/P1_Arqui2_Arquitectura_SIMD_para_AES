module vgaMatrix #(parameter displayH)
						(
						input logic clk,
						input reg rst,
						input logic hold,
						input [7:0] pixelValue,
						output reg [15:0] readAddress = 0,
						output logic [7:0] r = 0, g = 0, b = 0
						);

						always_ff @(posedge clk) begin
						
							if (hold != 1) begin
							
								r <= pixelValue;
								g <= pixelValue;
								b <= pixelValue;
								
								readAddress <= readAddress + 1;
							end else if (rst == 1) begin
							
								r <= 0;
								g <= 0;
								b <= 0;
								
								readAddress <= 0;
							end else begin
								
								r <= 0;
								g <= 0;
								b <= 0;
								
							end

						end
						 
endmodule
			