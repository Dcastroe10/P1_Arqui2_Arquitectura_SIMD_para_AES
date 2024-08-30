module read_ROM(input logic [12:0] address,
					input logic clock,
					output [15:0] data
					);
 
// Instancia de la ROM
	inst_mem rom_inst (
    .address(address),
    .clock(clock),    
    .q(data)          
	);
endmodule 