module RegistroVec (
    input logic [3:0] fila1,       
	 input logic [3:0] fila2,
	 input logic [3:0] writeAddr,
    input logic [1:0] columnar,columnaw,         // Selector de columna para lectura/escritura
    input logic [31:0] data_in1,        // Entrada de datos (32 bits)
    input logic wr_en,                 // Habilitar escritura por fila1
    input logic col_read,              // Habilitar lectura por columna
    input logic col_write,             // Habilitar escritura por columna
    input logic clk,                   // Reloj
    output logic [31:0] data_out1,      // Salida de datos (32 bits)
	 output logic [31:0] data_out2       // Salida de datos (32 bits)
);

    logic [31:0] registro [15:0];       
	 
    // Escritura en el registro (una fila1 completa o una columna)
    always_ff @(posedge clk) begin
        if (wr_en) begin
            if (col_write) begin
                // Escritura por columna 
                case (columnaw)
                    2'b11: begin
                        registro[writeAddr][7:0] <= data_in1[31:24];
                        registro[writeAddr+1][7:0] <= data_in1[23:16];
                        registro[writeAddr+2][7:0] <= data_in1[15:8];
                        registro[writeAddr+3][7:0] <= data_in1[7:0];
                    end
                    2'b10: begin
                        registro[writeAddr][15:8] <= data_in1[31:24];
                        registro[writeAddr+1][15:8] <= data_in1[23:16];
                        registro[writeAddr+2][15:8] <= data_in1[15:8];
                        registro[writeAddr+3][15:8] <= data_in1[7:0];
                    end
                    2'b01: begin
                        registro[writeAddr][23:16] <= data_in1[31:24];
                        registro[writeAddr+1][23:16] <= data_in1[23:16];
                        registro[writeAddr+2][23:16] <= data_in1[15:8];
                        registro[writeAddr+3][23:16] <= data_in1[7:0];
                    end
                    2'b00: begin
                        registro[writeAddr][31:24] <= data_in1[31:24];
                        registro[writeAddr+1][31:24] <= data_in1[23:16];
                        registro[writeAddr+2][31:24] <= data_in1[15:8];
                        registro[writeAddr+3][31:24] <= data_in1[7:0];
                    end
                endcase
            end else begin
                // Escritura de una fila1 completa
                registro[writeAddr] <= data_in1;
            end
        end
    end
	 
    // Lectura del registro (una fila1 completa o una columna)
    always_comb begin
		  data_out1 = 32'b0; // Inicializar
        data_out2 = 32'b0; // Inicializar
        if (col_read) begin 
            // Lectura por columna (4 valores de 8 bits concatenados)
            case (columnar)
                2'b11: data_out1 = {registro[fila1][7:0], registro[fila1+1][7:0], registro[fila1+2][7:0], registro[fila1+3][7:0]};
                2'b10: data_out1 = {registro[fila1][15:8], registro[fila1+1][15:8], registro[fila1+2][15:8], registro[fila1+3][15:8]};
                2'b01: data_out1 = {registro[fila1][23:16], registro[fila1+1][23:16], registro[fila1+2][23:16], registro[fila1+3][23:16]};
                2'b00: data_out1 = {registro[fila1][31:24], registro[fila1+1][31:24], registro[fila1+2][31:24], registro[fila1+3][31:24]};
            endcase
				data_out2 = 32'b0; // Inicializar
        end else begin
            // Lectura de una fila1 completa
            data_out1 = registro[fila1];
				data_out2 = registro[fila2];
        end
    end

endmodule