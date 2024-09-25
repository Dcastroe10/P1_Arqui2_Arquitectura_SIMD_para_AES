module Vectorial_Register #(parameter BITS = 32) (clk, writeData, writeEn, read);
    input wire [BITS-1:0] writeData;
    input wire writeEn, clk;
    output reg [BITS-1:0] read;
    
    reg [BITS-1:0] register;
    
    // Dividir el registro en 4 partes de 32 bits
    wire [7:0] part3 = register[7:0];
    wire [7:0] part2 = register[15:8];
    wire [7:0] part1 = register[23:16];
    wire [7:0] part0 = register[31:24];

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
