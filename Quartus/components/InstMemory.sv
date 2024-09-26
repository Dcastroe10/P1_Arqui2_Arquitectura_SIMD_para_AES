module InstMemory #(parameter DEPTH = 32, BITS = 20) (address, readData);

    input wire [$clog2(DEPTH)-1:0] address;
    output reg [BITS-1:0] readData;

    reg [BITS-1:0] registers [DEPTH-1:0];


    always_comb begin
        readData = registers[address];
    end
    
    initial
        $readmemh("memory.dat", registers);
endmodule