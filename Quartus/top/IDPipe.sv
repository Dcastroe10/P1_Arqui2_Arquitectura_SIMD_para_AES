
module IDPipe (clk, writeAddr, writeData, Instruction, PC, RegWrite, BranchAddr, Equal, data1, data2, Imm, rd, rs1, rs2);

    input wire [31:0] Instruction;
    input wire [11:0] PC;
    input wire RegWrite, clk;
    input wire [4:0] writeAddr;
    input wire [63:0] writeData;
    output reg [11:0] BranchAddr;
    output reg Equal;
    output reg [63:0] data1, data2;
    output reg [63:0] Imm;
    output reg [4:0] rd, rs1, rs2;

    reg [63:0] ShiftedImm;

    ImmGen immGen(
        .OpCode(Instruction[6:2]),
        .InstructionP1(Instruction[31:20]),
        .InstructionP2(Instruction[11:7]),
        .Imm(Imm));

    Shifter shifter(
        .data(Imm),
        .out(ShiftedImm));

    Adder #(12) BAdder (
        .a(PC),
        .b(ShiftedImm[11:0]),
        .sum(BranchAddr),
        .cin(1'b0));

    assign rd = Instruction[11:7];
    assign rs1 = Instruction[19:15];
    assign rs2 = Instruction[24:20];

    Register_File regFile(
        .clk(clk),
        .address1(rs1),
        .address2(rs2),
        .addressw(writeAddr),
        .writeData(writeData),
        .writeEn(RegWrite),
        .read1(data1),
        .read2(data2));
    
    Nbit_Equal_Comp #(64) equalComp(
        .Data0(data1),
        .Data1(data2),
        .Out(Equal));

endmodule