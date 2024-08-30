`timescale 1ps / 1ps
module read_ROM_tb;

    // Declaración de señales
    reg [12:0] address;
    reg clock = 0;
    wire [15:0] data;

    // Instancia del módulo bajo prueba
    read_ROM dut (
        .address(address),
        .clock(clock),
        .data(data)
    );

   

    // Proceso para estimular la entrada address
    initial begin
		clock = ~clock;#100;
		clock = ~clock;#100;
		
		clock = ~clock;#100;
		clock = ~clock;#100;
	
	
      address = 0; // Inicializamos la dirección en 0
		
		clock = ~clock;#100;
		clock = ~clock;#100;
      
		clock = ~clock;#100;
		clock = ~clock;#100;
      
		clock = ~clock;#100;
		clock = ~clock;#100;
      

       
    end

endmodule
