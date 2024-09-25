 module Multi_Alu (a, b, select, result_alu);

	input wire [31:0] a;     // Entrada de 128 bits (a)
	input wire [31:0] b;     // Entrada de 128 bits (b)
	input wire [1:0] select;  // Selector común para las 4 ALUs
	output reg [31:0] result_alu; // Resultado de 128 bits
	//output reg [3:0] nop_flags;
	
	// Dividir las entradas de 128 bits en 4 de 32 bits
	reg [7:0] a0;
	reg [7:0] a1;
	reg [7:0] a2;
	reg [7:0] a3;
	
	reg [7:0] b0;
	reg [7:0] b1;
	reg [7:0] b2;
	reg [7:0] b3;
	

	// Separar cada cuarto de a y b
	assign a0 = a[7:0];
	assign a1 = a[15:8];
	assign a2 = a[23:16];
	assign a3 = a[31:24];

	assign b0 = b[7:0];
	assign b1 = b[15:8];
	assign b2 = b[23:16];
	assign b3 = b[31:24];

	// Instanciar las 4 ALUs
	
	Alu #(8) alu0(.SrcA(a0), .SrcB(b0), .ALUControl(select), .ALUResult(result_alu[7:0]));
	Alu #(8) alu1(.SrcA(a1), .SrcB(b1), .ALUControl(select), .ALUResult(result_alu[15:8]));
	Alu #(8) alu2(.SrcA(a2), .SrcB(b2), .ALUControl(select), .ALUResult(result_alu[23:16]));
	Alu #(8) alu3(.SrcA(a3), .SrcB(b3), .ALUControl(select), .ALUResult(result_alu[31:24]));
	
	/*Single_ALU alu0 (
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
	);*/

	// Concatenar los resultados de las 4 ALUs
endmodule
