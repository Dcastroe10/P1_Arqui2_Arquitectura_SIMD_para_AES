//`timescale 1 ps / 1 ps
module decode_tb;
	// Señales del testbench
    logic [15:0] instruction;
    logic [12:0] next_pc;
    logic clock = 0;

    logic [31:0] output_a;
    logic [31:0] output_b;
    logic [3:0] destiny;
	 logic [3:0]  address_a; //"rs"
	 logic [3:0]  address_b; //"rt" En MIPS
	 logic [3:0] AluControl;
    
	 decode dut (
        .instruction(instruction),
        .next_pc(next_pc),
        .clock(clock),
        .output_a(output_a),
        .output_b(output_b),
        .destiny(destiny),
		  .address_a(address_a),
		  .address_b(address_b),
		  .AluControl(AluControl)
    );


    // Initialize signals
    initial begin 
	 
		instruction = 16'b0000001100000001;
		next_pc = 13'b0000000000001;
		
		clock = ~clock;#100;
		clock = ~clock;#100;
		
		instruction = 16'b0001000000100011;
		next_pc = 13'b0000000000010;
		
		
		clock = ~clock;#100;
		clock = ~clock;#100;
		
		instruction = 16'b0010000000100011;
		next_pc = 13'b0000000000010;
		
		
		clock = ~clock;#100;
		clock = ~clock;#100;
		
		clock = ~clock;#100;
		clock = ~clock;#100;
		
		
		clock = ~clock;#100;
		clock = ~clock;#100;
		
	

   

   
     
       
    end

endmodule