 module Multi_Alu (a, b, select, result_alu);

	input wire [31:0] a;     // Entrada de 128 bits (a)
	input wire [31:0] b;     // Entrada de 128 bits (b)
	input wire [2:0] select;  // Selector común para las 4 ALUs
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
	
	reg [31:0] result_alu1;
	reg [31:0] result_alu2;
	

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
	
	Alu #(8) alu0(.SrcA(a0), .SrcB(b0), .ALUControl(select[1:0]), .ALUResult(result_alu1[7:0]));
	Alu #(8) alu1(.SrcA(a1), .SrcB(b1), .ALUControl(select[1:0]), .ALUResult(result_alu1[15:8]));
	Alu #(8) alu2(.SrcA(a2), .SrcB(b2), .ALUControl(select[1:0]), .ALUResult(result_alu1[23:16]));
	Alu #(8) alu3(.SrcA(a3), .SrcB(b3), .ALUControl(select[1:0]), .ALUResult(result_alu1[31:24]));
	
	gf_mul gf0(.index0(a3), .index1(a2), .index2(a1),.index3(a0),.row(2'b00),.result(result_alu2[7:0]));
	gf_mul gf1(.index0(a3), .index1(a2), .index2(a1),.index3(a0),.row(2'b01),.result(result_alu2[15:8]));
	gf_mul gf2(.index0(a3), .index1(a2), .index2(a1),.index3(a0),.row(2'b10),.result(result_alu2[23:16]));
	gf_mul gf3(.index0(a3), .index1(a2), .index2(a1),.index3(a0),.row(2'b11),.result(result_alu2[31:24]));
	
	assign result_alu = (select == 3'b101) ? result_alu2 : result_alu1;
	
endmodule
