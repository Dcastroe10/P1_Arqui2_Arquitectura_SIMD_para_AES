module Vectorial_Register #(parameter BITS = 128) (clk, writeData, writeEn, read);
    input wire [BITS-1:0] writeData;
    input wire writeEn, clk;
    output reg [BITS-1:0] read;
    
    reg [BITS-1:0] register;
    
    // Dividir el registro en 4 partes de 32 bits
    wire [31:0] part0 = register[31:0];
    wire [31:0] part1 = register[63:32];
    wire [31:0] part2 = register[95:64];
    wire [31:0] part3 = register[127:96];

    always_comb begin
        read = register;
    end
    
    always @(negedge clk) begin
        if (writeEn) begin
            register <= writeData;
        end
    end

    initial
        register = 0;

endmodule
