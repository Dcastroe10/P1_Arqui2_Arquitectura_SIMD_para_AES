module IF_ID_register_tb;

// Definir los puertos
    logic clock = 0;
    logic [15:0] if_id_inst_in;
    logic [15:0] if_id_out;
    
    // Instanciar el módulo bajo prueba
    IF_ID_register dut (
        .clock(clock),
        .if_id_inst_in(if_id_inst_in),
        .if_id_out(if_id_out)
    );
    
   
    initial begin
		clock = ~clock;#100;
		clock = ~clock;#100;
		clock = ~clock;#100;
		clock = ~clock;#100;
		if_id_inst_in = 16'b1010101010101010; // Ejemplo de instrucción
        
		clock = ~clock;#100;
		clock = ~clock;#100;
		clock = ~clock;#100;
		clock = ~clock;#100;
		
		if_id_inst_in = 16'b1; // Ejemplo de instrucción
		clock = ~clock;#100;
		clock = ~clock;#100; 
		
        
     
    end

endmodule