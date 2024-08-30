
module Pipeline(input logic clock,
					 output logic [15:0] instruction, 
					 output logic [3:0] select,
					 output logic [15:0] output_a,
					 output logic [15:0] output_b,
					 output logic mux_sel_alu,
					 output logic [15:0] dir_mem,
					 output logic [15:0] DI_reg,
					 output logic [3:0] dir_reg,
					 output logic reg_w,
					 output logic [15:0] op1,
					 output logic [15:0] op2,
					 output logic mem_r
					 );	
	
	logic [15:0] data;
	logic [59:0] id_exe_out;
	logic [3:0] destino;
	logic WBack;
	//logic [3:0] dir_reg;
	//logic [15:0] DI_reg;
	//logic [15:0] output_a;
	//logic [15:0] output_b;


	//logic mem_r;
	logic [12:0] address;
	logic [12:0] new_pc_address;
	logic [38:0] exe_mem_out;	
	
	//Datos del decode
	logic [3:0] destiny;
	logic writeBack; 
	
	
	logic [3:0] AluControl;
	logic mem_wr;
	logic mem_w;
	logic mem_rd;
	logic memo_r;
	logic memo_w;
	//logic [15:0] op1;
	//logic [15:0] op2;
	logic nop_flag;
	logic [15:0] result;
	logic [15:0] result_alu;
	//logic [15:0] dir_mem;
	//logic reg_w;
	//logic [3:0] dir_reg;
	logic [15:0] DI_alu;
	logic [11:0] DI_mem;
	logic mux_sel;
	logic [33:0] mem_wb_out;
	logic sel_mux_alu;
	logic [15:0] inmediato;
	logic [15:0] inmediate;
	//logic mux_sel_alu;
	//logic [15:0]  output_a;
	logic [15:0] op1_alu;
	logic [11:0] dato_a;
	
	logic [3:0] destin;
	logic wb;
	

	initial begin
		address = 11'b00000000000; 
		//data = 16'b1;
	end
					 
	always @(posedge clock) begin
		new_pc_address = address + 1; 
	end 
	//Fetch
	
	
	//new_pc_address debe ir pegada al registro "grande" IF/ID
	
	 //cambiar dirección de entrada(pc_in), no debe ser new_address, sino
	 //debe ser la dirección de pc que viene del último registro "grande" del pipeline o del mux
	 
	  pc_register pc_reg_inst (
        .clock(clock),
        .pc_in(new_pc_address),
        .pc_out(address)
    );
	 
	  inst_mem rom_inst (
        .address(address),
        .clock(clock),
        .q(data)  //instrucción que viene de la memoria de instrucciones
    );
	 
	 // Instanciación del módulo IF_ID_register
    IF_ID_register if_id_register_inst(
        .clock(clock),                    
        .if_id_inst_in(data), 
        .if_id_out(instruction)             // Salida del módulo IF_ID_register
    );
	
	//Decode
	
    decode deco_inst (
		  .instruction(instruction),
		  .next_pc(next_pc),
		  .clock(clock),
        .destiny(destiny),
		  .DI_reg(DI_reg),
		  .dir_reg(dir_reg),
		  .write_reg(reg_w),
		  .sel_mux_alu(sel_mux_alu),
		  .inmediato(inmediato),
		  .writeBack(writeBack),
		  .AluControl(AluControl),
        .output_a(output_a),
        .output_b(output_b),
		  .mem_wr(mem_wr),
		  .mem_rd(mem_rd)
    );
	  
	 
	 // Instancia de ID_EXE_register
    ID_EXE_register ID_EXE_register_inst (
        .clock(clock),
        .destiny(destiny),
		  .sel_mux_alu(sel_mux_alu),
		  .inmediato(inmediato),
        .writeBack(writeBack),
        .AluControl(AluControl),
        .mem_wr(mem_wr),
        .mem_rd(mem_rd),
        .output_a(output_a),
        .output_b(output_b),
        .id_exe_out(id_exe_out)
    );
	 
	 assign inmediate = id_exe_out[59:44];
	 assign mux_sel_alu = id_exe_out[43];
	 assign destino = id_exe_out[42:39];
	 assign WBack = id_exe_out[38];
	 assign select = id_exe_out[37:34];
	 assign op2 = id_exe_out[15:0];
	 assign op1 = id_exe_out[31:16];
	 assign memo_r = id_exe_out[32];
	 assign memo_w = id_exe_out[33];
	 
	 
	 mux_alu mux_alu_inst (
		.mux_alu_sel(mux_sel_alu),
		.inmediato(inmediate),
		.output_a(op1),
		.muxresult(op1_alu)
		
	);
	
	
    ALU #(16) ALU_inst (
        .a(op1_alu),
        .b(op2),
        .select(select),
        .result(result),
        .nop_flag(nop_flag)
    );
	 
	
	 EXE_MEM_register EXE_MEM_register_inst (
        .clock(clock),
        .result(result),
		  .destiny(destino),
        .writeBack(WBack),
		  .dir_mem(op1),
        .mem_wr(memo_w),
        .mem_rd(memo_r),
        .exe_mem_out(exe_mem_out)
    );
	 
	 assign result_alu = exe_mem_out[15:0];
	 assign destin = exe_mem_out[19:16];
	 assign wb = exe_mem_out[20];
	 assign mem_r = exe_mem_out[21];
	 assign mem_w = exe_mem_out[22];
	 assign dir_mem = exe_mem_out[38:23];
	 
	 //COSAS DE VGA
	 logic [15:0] address_b = 16'bx;
	 logic rden_b = 1'b0;
	 logic wren_b = 1'b0;
	 logic [11:0] dato_b;
	 
	DataMem datamem_inst (
    .address_a(dir_mem),
    .address_b(address_b), //JONA VGA
    .data_a(1'b1),
    .data_b(1'b0),
    .inclock(clock),
    .outclock(~clock),
	 .rden_a(mem_r),
	 .rden_b(1'b1), //JONA VGA
    .wren_a(mem_w),
    .wren_b(1'b0), //JONA VGA
    .q_a(dato_a),
    .q_b(dato_b) // JONA VGA
);

	//vga vga1 (.clk(clock), .readAddress(address_b), .pixelValue(dato_b), .switch(1'b0));


	MEM_WB_register MEM_WB_register_inst (
        .clock(clock),
        .dato(dato_a),
		  .result_alu(result_alu),
		  .destin(destin),
        .writeBack(wb),
		  .mem_rd(mem_r),
		  .mem_wb_out(mem_wb_out)
    );
	 
	 assign mux_sel = mem_wb_out[33]; 
	 assign DI_mem = mem_wb_out[11:0];
	 assign DI_alu = mem_wb_out[27:12];
	 assign dir_reg = mem_wb_out[31:28];
	 assign reg_w = mem_wb_out[32];
	 
	 mux2 mux_inst (
	 .mux_sel(mux_sel),
	 .result_alu(DI_alu),
	 .dato_a(DI_mem),
	 .muxresult(DI_reg)
);


	
endmodule
