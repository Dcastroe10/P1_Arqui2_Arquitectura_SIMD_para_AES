module RegistroVec_tb;

    // Señales para la instancia del módulo
    logic [3:0] fila1;                   // Selector de fila 1
    logic [3:0] fila2;                   // Selector de fila 2
    logic [1:0] columna;                 // Selector de columna
    logic [31:0] data_in1;               // Entrada de datos 1 (32 bits)
    logic wr_en;                         // Habilitar escritura
    logic col_read;                      // Habilitar lectura por columna
    logic col_write;                     // Habilitar escritura por columna
    logic clk;                           // Reloj
    logic [31:0] data_out1;              // Salida de datos 1 (32 bits)
    logic [31:0] data_out2;              // Salida de datos 2 (32 bits)

    // Instancia del módulo RegistroVec
    RegistroVec uut (
        .fila1(fila1),
        .fila2(fila2),
        .columna(columna),
        .data_in1(data_in1),
        .wr_en(wr_en),
        .col_read(col_read),
        .col_write(col_write),
        .clk(clk),
        .data_out1(data_out1),
        .data_out2(data_out2)
    );

    // Generador de reloj
    initial begin
        clk = 0;
        forever #5 clk = ~clk;  // Cambia el estado del reloj cada 5 unidades de tiempo
    end

    // Procedimiento de prueba
    initial begin
        // Inicializar señales
        fila1 = 4'b0000;
        fila2 = 4'b0001;         // Inicializar fila2
        columna = 2'b00;
        data_in1 = 32'b0;
        wr_en = 0;
        col_read = 0;
        col_write = 0;          // Inicializar col_write en 0

        // Esperar a que comience el reloj
        #10;

        // --- Escritura de datos en el registro ---
     
        fila1 = 4'b0000;
        data_in1 = 32'h01020304;
        wr_en = 1;
        #10;  // Esperar un ciclo de reloj

       
        fila1 = 4'b0001;
        data_in1 = 32'h05060708;
        #10;  // Esperar un ciclo de reloj
		  
		  
        fila1 = 4'b0010;
        data_in1 = 32'h090A0B0C;
        #10;  // Esperar un ciclo de reloj
		  

        fila1 = 4'b0011;
        data_in1 = 32'h0D0E0F10;
        #10;  // Esperar un ciclo de reloj

		  
        // Desactivar escritura
        wr_en = 0;

        // --- Lectura de fila ---
        // Leer fila 0 y fila 1
        fila1 = 4'b0000;
        fila2 = 4'b0001;
        #10;
        $display("Lectura Fila 0: %h", data_out1);
		  $display("Lectura Fila 1: %h", data_out2);
		  
		  fila1 = 4'b0010;
        fila2 = 4'b0011;
        #10;
        $display("Lectura Fila 2: %h", data_out1);
		  $display("Lectura Fila 3: %h", data_out2);

		  
        // --- Lectura por columna ---
        col_read = 1;  // Habilitar lectura por columna

        // Leer columna 0
		  fila1 = 4'b0000;
        columna = 2'b00;  // Seleccionar columna 0
        #10;
        $display("Lectura Columna 0: %h", data_out1);

        // Leer columna 1
        columna = 2'b01;  // Seleccionar columna 1
        #10;
        $display("Lectura Columna 1: %h", data_out1); 
		  
        columna = 2'b10; 
        #10;
        $display("Lectura Columna 2: %h", data_out1); 
		  
		  columna = 2'b11; 
        #10;
        $display("Lectura Columna 3: %h", data_out1); 
		  
		  //Escribir en una columna
		  wr_en = 1;
		  col_write = 1;
		  col_read = 0;
		  fila1 = 4'b0000;
		  columna = 2'b00;
        data_in1 = 32'hF1F2F3F4;
        #10;  // Esperar un ciclo de reloj
		  
		  wr_en = 0;
		  col_write = 0;
		  
		  
		  fila1 = 4'b0000;
        fila2 = 4'b0001;
        #10;
        $display("Lectura Fila 0: %h", data_out1);
		  $display("Lectura Fila 1: %h", data_out2);
		  
		  fila1 = 4'b0010;
        fila2 = 4'b0011;
        #10;
        $display("Lectura Fila 2: %h", data_out1);
		  $display("Lectura Fila 3: %h", data_out2);

        // Terminar la simulación
        #20;
        
    end

endmodule
