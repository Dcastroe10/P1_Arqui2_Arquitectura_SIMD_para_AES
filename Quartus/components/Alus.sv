 module Alus
(
	input logic [127:0] a,     // Entrada de 128 bits (a)
	input logic [127:0] b,     // Entrada de 128 bits (b)
	input logic [3:0] select,  // Selector común para las 4 ALUs
	output logic [127:0] result, // Resultado de 128 bits
	output logic [3:0] nop_flags // Señales nop_flag de las 4 ALUs
);

	// Dividir las entradas de 128 bits en 4 de 32 bits
	logic [31:0] a_alu [3:0];
	logic [31:0] b_alu [3:0];
	logic [31:0] result_alu [3:0];

	// Separar cada cuarto de a y b
	assign a_alu[0] = a[31:0];
	assign a_alu[1] = a[63:32];
	assign a_alu[2] = a[95:64];
	assign a_alu[3] = a[127:96];

	assign b_alu[0] = b[31:0];
	assign b_alu[1] = b[63:32];
	assign b_alu[2] = b[95:64];
	assign b_alu[3] = b[127:96];

	// Instanciar las 4 ALUs
	Single_ALU alu0 (
		.a(a_alu[0]),
		.b(b_alu[0]),
		.select(select),
		.result(result_alu[0]),
		.nop_flag(nop_flags[0])
	);

	Single_ALU alu1 (
		.a(a_alu[1]),
		.b(b_alu[1]),
		.select(select),
		.result(result_alu[1]),
		.nop_flag(nop_flags[1])
	);

	Single_ALU alu2 (
		.a(a_alu[2]),
		.b(b_alu[2]),
		.select(select),
		.result(result_alu[2]),
		.nop_flag(nop_flags[2])
	);

	Single_ALU alu3 (
		.a(a_alu[3]),
		.b(b_alu[3]),
		.select(select),
		.result(result_alu[3]),
		.nop_flag(nop_flags[3])
	);

	// Concatenar los resultados de las 4 ALUs
	assign result = {result_alu[3], result_alu[2], result_alu[1], result_alu[0]};
endmodule
