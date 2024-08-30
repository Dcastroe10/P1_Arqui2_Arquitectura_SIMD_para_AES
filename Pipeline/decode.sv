module decode(
	input logic [15:0] instruction,
	input logic [12:0] next_pc,
	input logic clock,
	input logic [3:0] dir_reg,
	input logic [15:0] DI_reg,
	input logic write_reg,
	output logic [15:0] inmediato,
	output logic [3:0] destiny, 	//Donde va a haber WB
	output logic writeBack,
	output logic sel_mux_alu,
	output logic [3:0] AluControl,
	output logic [15:0]  output_a, //Salida A
	output logic [15:0]  output_b, //Salida B
	output logic mem_wr,
	output logic mem_rd
);




//ocupo el destino	4bits
//writeBack				1bit

//control del alu		4bits
//output_a				32bits
//output_b				32bits

//mem_wr  				1bit
//mem_rd  				1bit


logic [3:0] operation;

logic [3:0]  address_a;
logic [3:0]  address_b;


initial begin 
	writeBack = 1'b0;
	mem_wr = 1'b0;
	mem_rd = 1'b0;
	sel_mux_alu = 1'b0;
	inmediato = 16'b0;
end


assign operation = instruction[15:12];


registerBank_M dut (
        .address_a(address_a),
        .address_b(address_b),
        .address_in(dir_reg),
        .data_in(DI_reg),
        .clock(clock),
        .wren(write_reg),
        .q_a(output_a),
        .q_b(output_b)
		  );

always @(posedge clock) begin
    case (operation) 
        4'b0000:  begin
            destiny = instruction[11:8];
				address_a = instruction[7:4];
				address_b = instruction[3:0];
				AluControl = 4'b0000;      	//NOP
				writeBack = 1'b0;
				sel_mux_alu = 1'b1;
        end
        4'b0001: begin
				destiny = instruction[11:8];
				address_a = instruction[7:4];
				address_b = instruction[3:0];
				AluControl = 4'b0001;      	//RESTA
				writeBack = 1'b1;
				sel_mux_alu = 1'b0;
        end
        4'b0010: begin
            destiny = instruction[11:8];
				address_a = instruction[7:4];
				address_b = instruction[3:0];
				AluControl = 4'b0010;      	//MULTI
				writeBack = 1'b1;
				sel_mux_alu = 1'b0;
        end
        4'b0011: begin
            destiny = instruction[11:8];
				address_a = instruction[7:4];
				address_b = instruction[3:0];
				AluControl = 4'b0011;      	//DIV ENTERA
				writeBack = 1'b1;
				sel_mux_alu = 1'b0;
        end
        4'b0100: begin
				destiny = instruction[11:8];
				address_a = instruction[7:4];
				address_b = instruction[3:0];
				AluControl = 4'b0100;      	//AND
				writeBack = 1'b1;
				sel_mux_alu = 1'b0;
        end
        4'b0101: begin
            destiny = instruction[11:8];
				address_a = instruction[7:4];
				address_b = instruction[3:0];
				AluControl = 4'b0101;      	//OR
				writeBack = 1'b1;
				sel_mux_alu = 1'b0;
        end
        4'b0110: begin
            destiny = instruction[11:8];
				address_a = instruction[7:4];
				address_b = instruction[3:0];
				AluControl = 4'b0110;      	//SRL
				writeBack = 1'b1;
				sel_mux_alu = 1'b0;
        end
        4'b0111: begin
            destiny = instruction[11:8];
				address_a = instruction[7:4];
				address_b = instruction[3:0];
				AluControl = 4'b0111;      	//SLL podría modificarse para que en lugar de address_b 
				writeBack = 1'b1;				//tenga un "inmediato"
				sel_mux_alu = 1'b0;
        end
        4'b1000: begin
				destiny = instruction[11:8];
				address_a = instruction[7:4];
				address_b = instruction[3:0];
				AluControl = 4'b1000;      	//SUMA	
				writeBack = 1'b1;
				sel_mux_alu = 1'b0;
		  end
		  
		  
		  //Agregar la estructura de las demás instrucciones, que bits elegir y eso
        4'b1001: begin
		  
				AluControl = 4'b0000;
				destiny = instruction[11:8];				
				mem_wr = 1'b0;
				mem_rd = 1'b1;
				address_a = instruction[7:4];
				writeBack = 1'b1;
				sel_mux_alu = 1'b0;
				$display("En LOAD el dato es: %0d", DI_reg);
				$display("El otro dato es: %0d", dir_reg);
            // Load
        end
        4'b1010: begin
            AluControl = 4'b0000;     
				mem_wr = 1'b1;
				address_a = instruction[7:4];
				writeBack = 1'b0;
				sel_mux_alu = 1'b0;
				//STORE
        end
        4'b1011: begin
				writeBack = 1'b1;
				AluControl = 4'b0000;
				destiny = instruction[11:8];
				inmediato = {8'b0, instruction[7:0]};
				sel_mux_alu = 1'b1;
				
            // MOV
				
        end
        4'b1100: begin
            // Branch Equal
        end
        4'b1101: begin
            // Jump
        end
        4'b1110: begin
            // Branch Not Equal
        end
        //4'b1111: begin
            // Ret?
        //end
        default: begin//Caso base para que ocurran las otras operaciones
            AluControl = 4'b0000;  //NOP, la alu no hace nada
				mem_wr = 1'b0;
				mem_rd = 1'b0;
				writeBack = 1'b0;
				sel_mux_alu = 1'b0;	
        end
    endcase
end
endmodule



