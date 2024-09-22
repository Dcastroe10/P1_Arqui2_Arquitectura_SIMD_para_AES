module aes_sbox_tb;

	logic [3:0] row_tb;
	logic [3:0] col_tb;
	logic [7:0] sbox_out_tb;
	
	// Instancia sbox
	aes_sbox uut(
		.row(row_tb),
		.col(col_tb),
		.sbox_out(sbox_out_tb)
	);
	
	initial begin
	row_tb = 4'h3; col_tb = 4'he;
	#10
	
	row_tb = 4'h9; col_tb = 4'ha;
	#10
	
	row_tb = 4'h6; col_tb = 4'h4;
	#10
	
	row_tb = 4'hc; col_tb = 4'h9;
	#10
	
	row_tb = 4'hf; col_tb = 4'h1;
	
	end
	
	

endmodule