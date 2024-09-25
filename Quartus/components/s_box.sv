module s_box #(parameter DEPTH = 32, BITS = 32) (
    input wire [$clog2(DEPTH*(BITS/8)):0] address1,
    input wire [$clog2(DEPTH*(BITS/8)):0] address2,
    input wire [$clog2(DEPTH*(BITS/8)):0] address3,
    input wire [$clog2(DEPTH*(BITS/8)):0] address4,
    output reg [BITS-1:0] readData
);

    // Memoria de 8 bits
    reg [7:0] registers [DEPTH*(BITS/8):0];

    // Concatenar los datos de las 4 direcciones
    always_comb begin
        readData = {registers[address1], registers[address2], registers[address3], registers[address4]};
    end

    // Inicialización de la memoria desde un archivo .dat
    initial begin
        $readmemh("datos_aleatorios_20bits.dat", registers);
    end

endmodule
