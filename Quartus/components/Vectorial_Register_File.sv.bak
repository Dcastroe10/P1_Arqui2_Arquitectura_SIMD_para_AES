module Vectorial_Register_File #(parameter DEPTH = 32, parameter BITS = 128) (
    input wire clk,
    input wire [($clog2(DEPTH)-1):0] address1, address2, addressw,
    input wire [BITS-1:0] writeData,
    input wire writeEn,
    output reg [BITS-1:0] read1, read2
);

    reg [DEPTH-1:0] hotbitOut;
    wire [BITS-1:0] Mux [DEPTH-1:0];
    wire [DEPTH-1:0] regEnable;

    // Generar las señales de control de hotbit para la selección de registro
    Hot_Bit #(DEPTH) hotbit1(.index(addressw), .Out(hotbitOut));

    assign Mux[0] = 0;  // Primer valor del Mux es 0

    genvar i;
    generate
        for (i = 1; i < DEPTH; i++) begin : generate_vectorial_registers
            assign regEnable[i] = hotbitOut[i] & writeEn;

            // Instanciar el Vectorial_Register de 128 bits
            Vectorial_Register #(BITS) vectorial_register (
                .clk(clk),
                .writeData(writeData),
                .writeEn(regEnable[i]),
                .read(Mux[i])
            );
        end
    endgenerate

    // Multiplexores para seleccionar la salida de los registros según la dirección
    Mux #(DEPTH, BITS) mux1(.Data_arr(Mux), .selector(address1), .Out(read1));
    Mux #(DEPTH, BITS) mux2(.Data_arr(Mux), .selector(address2), .Out(read2));

endmodule
