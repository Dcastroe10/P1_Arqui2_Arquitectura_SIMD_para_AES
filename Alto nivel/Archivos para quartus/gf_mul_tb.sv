module gf_mul_tb;

	logic 	[7:0] a_tb;
	logic		[7:0] b_tb;
	logic		[7:0] c_tb;
	logic		[7:0] d_tb;
	
	logic		[1:0] row_tb;
	
	logic	[7:0] result_tb;
	
	//Instancia del gf_mul
	gf_mul uut(
		.index0(a_tb),
		.index1(b_tb),
		.index2(c_tb),
		.index3(d_tb),
		.row(row_tb),
		.result(result_tb)
	);
	
	initial begin
	
	a_tb = 8'h63;
	b_tb = 8'h2F;
	c_tb = 8'hAF;
	d_tb = 8'hA2;
	row_tb = 2'b01;
	
	#10
	
	a_tb = 8'hEB;
	b_tb = 8'h93;
	c_tb = 8'hC7;
	d_tb = 8'h20;
	row_tb = 2'b01;
	
	#10
	
	a_tb = 8'h9F;
	b_tb = 8'h92;
	c_tb = 8'hAB;
	d_tb = 8'hCB;
	row_tb = 2'b01;
	
	#10
	
	a_tb = 8'hA0;
	b_tb = 8'hC0;
	c_tb = 8'h30;
	d_tb = 8'h2B;
	row_tb = 2'b01;
	
	end

endmodule