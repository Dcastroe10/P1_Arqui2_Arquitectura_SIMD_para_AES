module registerBank_M_tb;

    logic clock = 0; // Señal de reloj

    // Señales de entrada
    logic [3:0] address_a;
    logic [3:0] address_b;
	 logic [3:0] address_in;
    logic [15:0] data_in;
    logic wren;

    // Señales de salida
    logic [15:0] q_a;
    logic [15:0] q_b;

    // Instanciación del módulo bajo test
    registerBank_M dut (
        .address_a(address_a),
        .address_b(address_b),
        .address_in(address_in),
        .data_in(data_in),
        .clock(clock),
        .wren(wren),
        .q_a(q_a),
        .q_b(q_b)
		  );
		  
		  
		  
		  // Inicialización de las señales de entrada
    initial begin
		clock = ~clock;#100;
		clock = ~clock;#100;
		address_a = 4'b0000;
		address_b = 4'b0001;
		address_in = 4'b0001;
		data_in = 5;
		wren = 1'b1;

		clock = ~clock;#100;
		clock = ~clock;#100;
		address_a = 4'b0001;
		address_b = 4'b0011;
		address_in = 4'b0010;
		data_in = 255;
		wren = 1'b1;
		
		clock = ~clock;#100;
		clock = ~clock;#100;
		address_a = 4'b0010;
		address_b = 4'b0001;
		wren = 1'b0;
	
		
		clock = ~clock;#100;
		clock = ~clock;#100;
		
		clock = ~clock;#100;
		clock = ~clock;#100;

		end

endmodule
