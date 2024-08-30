module mux_alu(input logic mux_alu_sel,
				input logic [15:0] inmediato,
				input logic [15:0] output_a, 
				output logic [15:0] muxresult);

always @(output_a, inmediato, mux_alu_sel) begin
    case(mux_alu_sel)
        1'b0: muxresult= output_a;
        1'b1: muxresult= inmediato;
        default: muxresult = 16'b0; // Por defecto, asigna 0 si sel está en un estado no esperado
    endcase
end

endmodule
