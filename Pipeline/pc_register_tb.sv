module pc_register_tb;

    // Parámetros
    localparam CLK_PERIOD = 10; // Período del reloj en unidades de tiempo

    // Declaración de señales
    logic clock = 0;
    logic [10:0] pc_in;
    logic [10:0] pc_out;

    // Instancia del módulo bajo prueba
    pc_register dut (
        .clock(clock),
        .pc_in(pc_in),
        .pc_out(pc_out)
    );

    // Generación de la señal de reloj
    always #((CLK_PERIOD / 2)) clock = ~clock;

    // Proceso de estimulación
    initial begin
        $display("Inicio de la simulación");

        // Configuración inicial
        pc_in = 0;

        // Establecer la dirección del PC
        #20 pc_in = 1024;

        // Esperar un ciclo de reloj
        #CLK_PERIOD;

        // Mostrar la salida del PC
        $display("pc_out = %d", pc_out);

        // Finalizar la simulación
        $display("Fin de la simulación");
    end

endmodule
