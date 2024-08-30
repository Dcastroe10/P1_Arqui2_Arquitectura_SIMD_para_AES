module pc_register(
    input logic clock,
    input logic [12:0] pc_in,
    output logic [12:0] pc_out
);
    logic [12:0] pc_reg;
	 
    always_comb begin
        pc_reg <= pc_in;
    end
	 
	 always @(negedge clock) begin
		pc_out = pc_reg;
	 end
    

endmodule
