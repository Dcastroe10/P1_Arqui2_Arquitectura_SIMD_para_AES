 module ALU_tb;
	
	
	parameter N = 32;
	
	// Inputs
	logic [N-1:0] a;
	logic [N-1:0] b;
	logic [3:0] select;
	
	logic [N-1:0] result;
	logic[6:0] led_disp;
	logic neg_flag;
	logic zero_flag;
	logic carry_flag;
	logic overflow_flag;
	logic nop_flag;

	
	
	
	
	ALU #(.N(N)) alu_inst(
        .a(a),
        .b(b),
        .select(select),
        .result(result),
        .led_disp(led_disp),
        .neg_flag(neg_flag),
        .zero_flag(zero_flag),
        .carry_flag(carry_flag),
        .overflow_flag(overflow_flag),
		  .nop_flag(nop_flag)
    );
	 
initial begin
		select = 4'b0000;//SUMA
		a = 4'b0111; 
		b = 4'b0001;
		#100;

		select = 4'b0001;//RESTA
		a = 4'b0011; 
		b = 4'b0001;	//result 2
		#100;
		
		select = 4'b0001;//RESTA
		a = 4'b0001; 
		b = 4'b0011;	//result -2
		#100;
		
		select = 4'b0010;//MULTI
		a = 4'b0010; 
		b = 4'b0010; //result 4
		#100;
		
		select = 4'b0011;//DIV 
		a = 4'b0101;
		b = 4'b1010; //result 2
		#100;
		
		select = 4'b0100;//AND
		a = 4'b1010; 
		b = 4'b0111; //result 2
		#100;
		
		select = 4'b0101;//OR
		a = 4'b1010; 
		b = 4'b0101; //result 15
		#100;
		
		select = 4'b0110;//SRL
		a = 4'b1111; 
		b = 4'b0010; //result 3
		#100;
		
		select = 4'b0111;//SLL
		a = 4'b0001; 
		b = 4'b0010; //result 4
		#100;
		
		select = 4'b1000;//NOP
		a = 4'b1111; 
		b = 4'b1111; //nop_flag 1
		#100;
		end
endmodule
