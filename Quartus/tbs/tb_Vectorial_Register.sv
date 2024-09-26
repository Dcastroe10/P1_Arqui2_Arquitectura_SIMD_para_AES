module tb_Vectorial_Register;

  // Definir señales de prueba
  reg clk;
  reg writeEn;
  reg [127:0] writeData;
  wire [127:0] read;

  // Instanciar el módulo Register
  Register #(128) uut (
    .clk(clk),
    .writeData(writeData),
    .writeEn(writeEn),
    .read(read)
  );

  // Generar el reloj
  always #5 clk = ~clk;  // Período del reloj de 10 unidades de tiempo

  initial begin
    // Inicializar señales
    clk = 0;
    writeEn = 0;
    writeData = 128'h0;

    // Esperar unos ciclos
    #10;
    
    // Primera escritura en el registro
    writeEn = 1;
    writeData = 128'h1234567890ABCDEF1122334455667788;
    #10;
    
    // Desactivar la escritura y verificar lectura
    writeEn = 0;
    #10;

    // Segunda escritura en el registro
    writeEn = 1;
    writeData = 128'hFFFFFFFF00000000FFFFFFFF00000000;
    #10;

    // Desactivar la escritura y verificar lectura
    writeEn = 0;
    #10;

    // Finalizar simulación
    $finish;
  end

  // Monitorear las señales relevantes
  initial begin
    $monitor("At time %t: writeData = %h, read = %h", $time, writeData, read);
  end

endmodule
