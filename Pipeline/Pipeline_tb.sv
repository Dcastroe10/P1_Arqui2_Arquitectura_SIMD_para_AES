`timescale 1ps / 1ps
module Pipeline_tb;

	logic [3:0] dir_reg;



	 logic clock = 0;

	 logic [15:0] instruction;
	 logic [15:0] op1;
	 logic [15:0] op2;
	 logic [3:0] select;
	 logic [15:0] output_a;
	 logic [15:0] output_b;
	 logic mux_sel_alu;
	 logic [15:0] dir_mem;
	 logic [15:0] DI_reg;
	 logic reg_w;
	 logic mem_r;
	 //logic [3:0] dir_reg;
	 
     Pipeline dut (
        .clock(clock),
		  .instruction(instruction),
		  .select(select),
		  .output_a(output_a),
		  .output_b(output_b),
		  .op1(op1),
		  .op2(op2),
			.mux_sel_alu(mux_sel_alu),
			.dir_mem(dir_mem), 
			.DI_reg(DI_reg),
			.dir_reg(dir_reg),
			.reg_w(reg_w),
			.mem_r(mem_r)
    );  //agregar las otras salidas de pipeline
	 
	 initial begin 
	clock = ~clock;#100;
	clock = ~clock;#100;
	
	clock = ~clock;#100;
	clock = ~clock;#100;
	
	clock = ~clock;#100;
	clock = ~clock;#100;
	
	clock = ~clock;#100;
	clock = ~clock;#100;
	
	clock = ~clock;#100;
	clock = ~clock;#100;
	
	clock = ~clock;#100;
	clock = ~clock;#100;
	
	clock = ~clock;#100;
	clock = ~clock;#100;
	
	clock = ~clock;#100;
	clock = ~clock;#100;
	
	clock = ~clock;#100;
	clock = ~clock;#100;
	
	clock = ~clock;#100;
	clock = ~clock;#100;
	
	clock = ~clock;#100;
	clock = ~clock;#100;
	
	clock = ~clock;#100;
	clock = ~clock;#100;
	
	clock = ~clock;#100;
	clock = ~clock;#100;
	
	clock = ~clock;#100;
	clock = ~clock;#100;
	
	clock = ~clock;#100;
	clock = ~clock;#100;
	
	clock = ~clock;#100;
	clock = ~clock;#100;
	
	clock = ~clock;#100;
	clock = ~clock;#100;
	
	clock = ~clock;#100;
	clock = ~clock;#100;
	
	clock = ~clock;#100;
	clock = ~clock;#100;
	
	clock = ~clock;#100;
	clock = ~clock;#100;
	
	clock = ~clock;#100;
	clock = ~clock;#100;
	
	clock = ~clock;#100;
	clock = ~clock;#100;
	
	clock = ~clock;#100;
	clock = ~clock;#100;
	
	clock = ~clock;#100;
	clock = ~clock;#100;
	
	clock = ~clock;#100;
	clock = ~clock;#100;
	
	clock = ~clock;#100;
	clock = ~clock;#100;
	
	clock = ~clock;#100;
	clock = ~clock;#100;
	
	clock = ~clock;#100;
	clock = ~clock;#100;
	
	clock = ~clock;#100;
	clock = ~clock;#100;
	
	clock = ~clock;#100;
	clock = ~clock;#100;
	
	clock = ~clock;#100;
	clock = ~clock;#100;
	
	clock = ~clock;#100;
	clock = ~clock;#100;
	
	clock = ~clock;#100;
	clock = ~clock;#100;
	
	/*
	clock = ~clock;#100;
	clock = ~clock;#100;
	clock = ~clock;#100;
	clock = ~clock;#100;
	clock = ~clock;#100;
	clock = ~clock;#100;
	clock = ~clock;#100;
	clock = ~clock;#100;
	clock = ~clock;#100;
	clock = ~clock;#100;
	clock = ~clock;#100;
	clock = ~clock;#100;
	clock = ~clock;#100;
	clock = ~clock;#100;
	clock = ~clock;#100;
	clock = ~clock;#100;
	clock = ~clock;#100;
	clock = ~clock;#100;
	clock = ~clock;#100;
	clock = ~clock;#100;
	clock = ~clock;#100;
	clock = ~clock;#100;
	clock = ~clock;#100;
	clock = ~clock;#100;
	clock = ~clock;#100;
	clock = ~clock;#100;
	clock = ~clock;#100;
	clock = ~clock;#100;
	clock = ~clock;#100;
	clock = ~clock;#100;
	clock = ~clock;#100;
	clock = ~clock;#100;
	clock = ~clock;#100;
	
	*/
	 end

endmodule
