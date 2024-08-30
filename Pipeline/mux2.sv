module mux2(input logic mux_sel,
				input logic [11:0] dato_a,
				input logic [15:0] result_alu, 
				output logic [15:0] muxresult);

always @(dato_a, result_alu, mux_sel) begin
    case(mux_sel)
        1'b0: muxresult= result_alu;
        1'b1: muxresult= {4'b0, dato_a};
        default: muxresult = 1'b0; // Por defecto, asigna 0 si sel está en un estado no esperado
    endcase
end

endmodule
