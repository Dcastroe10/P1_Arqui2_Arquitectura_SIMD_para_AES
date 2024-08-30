module ID_EXE_register(
    input logic clock,
    input logic [3:0] destiny,
    input logic writeBack,
    input logic [3:0] AluControl,
	 input logic [15:0] inmediato,
	 input logic sel_mux_alu,
    input logic mem_wr,
    input logic mem_rd,
    input logic [15:0] output_a,
    input logic [15:0] output_b,
    output logic [59:0] id_exe_out 
);

    logic [59:0] id_exe_reg;
 
    always_comb begin
        id_exe_reg = {inmediato, sel_mux_alu, destiny, writeBack, AluControl, mem_wr, mem_rd, output_a, output_b};
    end

    always @(negedge clock) begin
        id_exe_out = id_exe_reg;
    end

endmodule
