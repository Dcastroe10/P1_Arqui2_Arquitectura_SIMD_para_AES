module IF_ID_register(
    input logic clock,
    input logic [15:0] if_id_inst_in,   //16 bits de la instruccion
    output logic [15:0] if_id_out       
);
    logic [15:0] if_id_reg;

    
    always_comb begin 
        if_id_reg = if_id_inst_in;
    end
	 
	 always @(negedge clock)begin
		  if_id_out = if_id_reg;
	 end 

endmodule

//16 bits de la instruccion que viene de memoria  (de read_ROM) [15:0]
//13 bits de la nueva dirección de memoria							 [28:16]
