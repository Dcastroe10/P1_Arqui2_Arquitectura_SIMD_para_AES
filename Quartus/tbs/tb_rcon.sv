`timescale 1ns / 1ps

module tb_rcon;

    // Parámetros
    parameter DEPTH = 64;
    parameter BITS = 32;

    // Señales
    reg [7:0] address1;
    wire [BITS-1:0] readData;

    // Instanciar el módulo rcon
    rcon #(DEPTH, BITS) uut (
        .address1(address1),
        .readData(readData)
    );

    // Inicializar señales y pruebas
    initial begin
        // Inicialización de la dirección
        address1 = 8'h00;

        // Test 1: Leer en la dirección 0
        #10;
        $display("Test 1: address1 = %h, readData = %h", address1, readData);

        // Test 2: Leer en la dirección 1
        address1 = 8'h01;
        #10;
        $display("Test 2: address1 = %h, readData = %h", address1, readData);

        // Test 3: Leer en la dirección 2
        address1 = 8'h02;
        #10;
        $display("Test 3: address1 = %h, readData = %h", address1, readData);

        // Test 4: Leer en la dirección 3
        address1 = 8'h03;
        #10;
        $display("Test 4: address1 = %h, readData = %h", address1, readData);

        // Finalizar simulación
        $finish;
    end

endmodule
