module vgaController #(parameter HACTIVE = 10'd640,
HFP = 10'd16,
HSYN = 10'd96,
HBP = 10'd48,
HMAX = HACTIVE + HFP + HSYN + HBP,
VBP = 10'd33,
VACTIVE = 10'd480,
VFP = 10'd10,
VSYN = 10'd2,
VMAX = VACTIVE + VFP + VSYN + VBP)
(input logic vgaclk,
output logic hsync, vsync, sync_b, blank_b,
output reg rst = 0,
output logic hold,
output reg [9:0] x, y);

initial begin
    x = 0;
    y = 0;
end


// counters for horizontal and vertical positions
always @(posedge vgaclk) begin
	x++;
	if (rst == 1) begin
		rst <= 0;
	end
	if (x == HMAX) begin
		x = 0;
		y++;
	end
	if (y == VMAX) begin
		y = 0;
		rst <= 1;
	end
	
end

// Compute sync signals (active low)
assign hsync = ~(x >= HACTIVE + HFP & x < HACTIVE + HFP + HSYN); // Cambio de hcnt a x
assign vsync = ~(y >= VACTIVE + VFP & y < VACTIVE + VFP + VSYN); // Cambio de vcnt a y
assign sync_b = hsync && vsync;
// Force outputs to black when outside the legal display area
assign blank_b = (x < HACTIVE) & (y < VACTIVE); // Cambio de hcnt y vcnt a x y y
assign hold = ~((x > 195 & x < 449) && (y > 115 & y < 365));

endmodule
