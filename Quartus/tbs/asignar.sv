module asignar (
    input wire [31:0] original, dato,
    input wire [1:0] indice,
    output reg [31:0] result_alu
);
    reg [31:0] result;

    always_comb begin
        // Inicializa el resultado con el valor de 'original'
        result = original;
        
        // Lógica que asigna 'dato' a una porción de 'result' según 'indice'
        case (indice)
            2'b00: result[7:0] = dato[7:0];   // Asigna a la parte baja
            2'b01: result[15:8] = dato[7:0];  // Asigna a la segunda parte
            2'b10: result[23:16] = dato[7:0]; // Asigna a la tercera parte
            2'b11: result[31:24] = dato[7:0]; // Asigna a la parte alta
        endcase
    end

    // Asigna el resultado final a 'result_alu'
    assign result_alu = result; 

endmodule
