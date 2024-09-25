module tb_s_box;

    // Definir parámetros
    parameter DEPTH = 32;
    parameter BITS = 32;

    // Señales de prueba
    reg [7:0] address1, address2, address3, address4;
    wire [BITS-1:0] readData;

    // Instanciar el módulo s_box
    s_box #(DEPTH, BITS) uut (
        .address1(address1),
        .address2(address2),
        .address3(address3),
        .address4(address4),
        .readData(readData)
    );

    // Inicialización
    initial begin
        // Cargar los datos desde el archivo .dat
        $display("Cargando los registros desde el archivo .dat...");

        // Pruebas con diferentes combinaciones de direcciones
        address1 = 8'd0;
        address2 = 8'd1;
        address3 = 8'd2;
        address4 = 8'd3;
        #10;
        $display("Direcciones: %0d %0d %0d %0d, Datos leidos: %h", address1, address2, address3, address4, readData);

        address1 = 8'd4;
        address2 = 8'd5;
        address3 = 8'd6;
        address4 = 8'd7;
        #10;
        $display("Direcciones: %0d %0d %0d %0d, Datos leidos: %h", address1, address2, address3, address4, readData);

        address1 = 8'd16;
        address2 = 8'd20;
        address3 = 8'd24;
        address4 = 8'd28;
        #10;
        $display("Direcciones: %0d %0d %0d %0d, Datos leidos: %h", address1, address2, address3, address4, readData);

        // Terminar simulación
        $finish;
    end

endmodule
