`timescale 1ns / 1ps

module tb_Multi_Alu;

    // Definir señales
    reg [31:0] a;
    reg [31:0] b;
    reg [2:0] select;
    wire [31:0] result_alu;

    // Instanciar el módulo Multi_Alu
    Multi_Alu uut (
        .a(a),
        .b(b),
        .select(select),
        .result_alu(result_alu)
    );

    // Inicializar señales
    initial begin
        // Inicializar entradas
        a = 32'h00000000;
        b = 32'h00000000;
        select = 3'b000;

        // Test case 1: Suma
        a = 32'h00000001;
        b = 32'h00000001;
        select = 3'b000; // Cambiar a la operación correspondiente
        #10; // Esperar un tiempo para ver el resultado
        $display("Test 1: a = %h, b = %h, select = %b, result = %h", a, b, select, result_alu);

        // Test case 2: Resta
        a = 32'h00000005;
        b = 32'h00000003;
        select = 3'b001; // Cambiar a la operación correspondiente
        #10;
        $display("Test 2: a = %h, b = %h, select = %b, result = %h", a, b, select, result_alu);

        // Test case 3: Multiplicación
        a = 32'h00000002;
        b = 32'h00000003;
        select = 3'b010; // Cambiar a la operación correspondiente
        #10;
        $display("Test 3: a = %h, b = %h, select = %b, result = %h", a, b, select, result_alu);

        // Test case 4: Operación de GF
        a = 32'h632FAFA2;
        b = 32'h00000001;
        select = 3'b101; // Cambiar a la operación de multiplicación GF
        #10;
        $display("Test 4: a = %h, b = %h, select = %b, result = %h", a, b, select, result_alu);

        // Finalizar simulación
        $finish;
    end

endmodule
