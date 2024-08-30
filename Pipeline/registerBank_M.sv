module registerBank_M (
    input logic [3:0] address_a,
    input logic [3:0] address_b,
    input logic [3:0] address_in,
    input logic [15:0] data_in,
    input logic clock, // Reloj de entrada
	 input logic wren,
    output logic [15:0] q_a, // Salida del registro A
    output logic [15:0] q_b // Salida del registro B
);

    // Definición de registros
    logic [15:0] registers [0:15];

    // Proceso para la escritura en el posedge del reloj
    always_ff @(posedge clock) begin
		if (wren) begin
		  $display("Se escribio el dato: %0d", data_in);
        registers[address_in] <= data_in;
		
		end
		  
    end
	 
    // Proceso para la salida en el negedge del reloj
    always_comb begin
        q_a <= registers[address_a];
        q_b <= registers[address_b];
	
	end
	
endmodule

