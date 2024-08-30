module ALU

#( parameter N = 16 )
(
	input logic [N-1:0] a,
	input logic [N-1:0] b,
	input logic [3:0] select,
	output logic [N-1:0] result,
	output logic nop_flag

);



	always @(a or b or select) begin
	
		//static logic carry_in = 0;		
		//carry_flag = 0;
		//overflow_flag = 0;
		//neg_flag = 0;
		//zero_flag = 0;
		nop_flag = 0;
		
		case (select)
		//NOP
		4'b0000: begin nop_flag = 1;
							result = a;
					end
		
		//Resta (a-b) cuando da negativo lo da en complemento a 2
		4'b0001: result = a-b;
		
		//Multiplicación
		4'b0010: result = a*b;
		
		//DIVISION
		4'b0011:result = a/b; 
		
		//AND
		4'b0100: result = a&b; 
		
		//OR
		4'b0101: result = a|b;
		
		//SRL
		4'b0110: result = a>>b;
		
		//SLL
		4'b0111: result = a<<b;
				
		//Suma
		4'b1000: result = a+b;
		
		endcase	
		//$display("A es:: %0d", a );
		//$display("B es:: %0d", b );
		//$display("El Resultado de la ALU es: %0d", result);		
	end
endmodule


