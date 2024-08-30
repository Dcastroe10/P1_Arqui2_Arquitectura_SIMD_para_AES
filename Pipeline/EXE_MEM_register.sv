module EXE_MEM_register(
    input logic clock,
    input logic [15:0] result,
	 input logic [3:0] destiny,
    input logic writeBack,
	 input logic [15:0] dir_mem,
    input logic mem_wr,
    input logic mem_rd,
    output logic [38:0] exe_mem_out 
);

    logic [38:0] exe_mem_reg;

    always_comb begin
        exe_mem_reg = {dir_mem, mem_wr, mem_rd, writeBack, destiny, result};
    end

    always @(negedge clock) begin
        exe_mem_out = exe_mem_reg;
    end

endmodule
