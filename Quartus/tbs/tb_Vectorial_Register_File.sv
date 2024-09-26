module tb_Vectorial_Register_File;

    // Parámetros del archivo de registros
    parameter DEPTH = 16;
    parameter BITS = 32;

    // Señales de prueba
    reg clk;
    reg writeEn;
    reg [BITS-1:0] writeData;
    reg [($clog2(DEPTH)-1):0] address1, address2, addressw;
    wire [BITS-1:0] read1, read2;

    // Instanciar el archivo de registros vectoriales
    Vectorial_Register_File #(DEPTH, BITS) uut (
        .clk(clk),
        .address1(address1),
        .address2(address2),
        .addressw(addressw),
        .writeData(writeData),
        .writeEn(writeEn),
        .read1(read1),
        .read2(read2)
    );

    // Generar el reloj
    always #5 clk = ~clk;

    initial begin
        // Inicialización de señales
        clk = 0;
        writeEn = 0;
        writeData = 0;
        address1 = 0;
        address2 = 0;
        addressw = 0;

        // Esperar unos ciclos
        #10;
        
        // Escribir en el registro 0
        writeEn = 1;
        addressw = 10;
        writeData = 128'hAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA;
        #10;

        // Escribir en el registro 1
        addressw = 1;
        writeData = 128'hBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB;
        #10;

        // Escribir en el registro 5
        addressw = 5;
        writeData = 128'hCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC;
        #10;

        // Escribir en el registro 6
        addressw = 6;
        writeData = 128'hDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD;
        #10;

        // Escribir en el registro 12
        addressw = 12;
        writeData = 128'hEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE;
        #10;

        // Desactivar la escritura
        writeEn = 0;

        // Leer el registro 1 como read1 y el registro 10 como read2
        address1 = 1;
        address2 = 10;
        #10;

        // Leer el registro 5 como read1 y el registro 12 como read2
        address1 = 5;
        address2 = 12;
        #10;

        // Finalizar simulación
        $finish;
    end

    // Monitorear los cambios en las señales
    initial begin
        $monitor("At time %t: address1 = %d, address2 = %d, read1 = %h, read2 = %h", 
                  $time, address1, address2, read1, read2);
    end

endmodule
