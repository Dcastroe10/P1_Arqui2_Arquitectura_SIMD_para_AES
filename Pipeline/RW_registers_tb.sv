`timescale 1 ps / 1 ps
module RW_registers_tb;

// Parámetros del Testbench
    parameter CLK_PERIOD_A = 10; // Periodo de clock de clock_a
    parameter CLK_PERIOD_B = 20; // Periodo de clock de clock_b
    parameter SIM_TIME = 100;    // Tiempo total de simulac


	logic [15:0] address_a;
	logic [15:0] address_b;
	
	logic [11:0]  data_a;
	logic [11:0]  data_b;
	
	logic inclock = 0;
	logic outclock = 0;
	
	logic wren_a = 0;
	logic wren_b = 0;
	
	logic rden_a = 1;
	logic rden_b = 1;
	
	logic [11:0]  output_a; //Salida A
	logic [11:0]  output_b; //Salida B
	
	
	
	
	
    
	 
    RW_registers dut (
        .address_a(address_a),
        .address_b(address_b),
        .data_a(data_a),
        .data_b(data_b),
        .inclock(inclock),
        .outclock(outclock),
        .wren_a(wren_a),
        .wren_b(wren_b),
		  .rden_a(rden_a),
		  .rden_b(rden_b),
        .output_a(output_a),
        .output_b(output_b)
    );

	 
	 // Generación de clock
    //always #((CLK_PERIOD_A / 2)) clock_a <= ~clock_a;
    //always #CLK_PERIOD_B clock_b <= ~clock_b;

    // Testcase
    initial begin
		  assign outclock = ~inclock;
	  
	 
        // Inicialización de señales
        inclock = ~inclock;#100;
		  inclock = ~inclock;#100;
		  
		  address_a = 16'b0000000000000000;
		  rden_a = 1;
        wren_a = 0;
		  
		  address_b = 16'b0000000000000001;
		  rden_b = 1;
        wren_b = 0;
		  
		 
		  
		  inclock = ~inclock;#100;
		  inclock = ~inclock;#100;
		  
		  address_a = 16'b0000000000000000;
		  data_a = 12'b000000001111; 
		  rden_a = 0;
        wren_a = 1;
		  
		  inclock = ~inclock;#100;
		  inclock = ~inclock;#100;
		  
		  
		  address_b = 16'b0000000000000000;
		  rden_b = 1;
        wren_b = 0;
		  
		  inclock = ~inclock;#100;
		  inclock = ~inclock;#100;
		  
		  
		  inclock = ~inclock;#100;
		  inclock = ~inclock;#100;
		  
		  inclock = ~inclock;#100;
		  inclock = ~inclock;#100;
		  
		  
		  
		  
		 
		  
		  
		  
        
		  
		 
		  
        //address_b = 16'b0000000000000001;
		  
       
		  #10;
		  
		  
   

       
    end

endmodule
