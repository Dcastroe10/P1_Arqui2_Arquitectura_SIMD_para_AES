module RW_registers (
	input	logic [15:0]  address_a,
	input logic [15:0]  address_b,
	
	input logic [11:0]  data_a,
	input logic [11:0]  data_b,
	
	input logic inclock,
	input logic outclock,
	
	
	input logic wren_a,
	input logic wren_b,
	input logic rden_a,
	input logic rden_b,
	
	
	output logic [11:0]  output_a, //Salida A
	output logic [11:0]  output_b //Salida B
);


 DataMem datamem_inst (
    .address_a(address_a),
    .address_b(address_b),
    .data_a(data_a),
    .data_b(data_b),
    .inclock(inclock),
    .outclock(outclock),
	 .rden_a(rden_a),
	 .rden_b(rden_b),
    .wren_a(wren_a),
    .wren_b(wren_b),
    .q_a(output_a),
    .q_b(output_b)
);


endmodule