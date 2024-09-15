
module MEMPipe(clk, ALUResult, WriteData, MemWrite, MemData);

    input wire clk;
    input wire [31:0] ALUResult, WriteData;
    input wire MemWrite;
    output reg [31:0] MemData;

    Memory #(1024, 32) mem(
        .clk(clk),
        .address(ALUResult[9:0]),
        .writeData(WriteData),
        .writeEn(MemWrite),
        .readData(MemData));


endmodule