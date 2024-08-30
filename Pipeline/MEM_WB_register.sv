module MEM_WB_register(
    input logic clock,
    input logic [11:0] dato,
	 input logic [15:0] result_alu,
	 input logic [3:0] destin,
    input logic writeBack,
	 input logic mem_rd,
    output logic [33:0] mem_wb_out 
);

    logic [33:0] mem_wb_reg;

    always_comb begin
        mem_wb_reg = {mem_rd, writeBack, destin, result_alu, dato};
    end

    always @(negedge clock) begin
        mem_wb_out = mem_wb_reg;
    end

endmodule
