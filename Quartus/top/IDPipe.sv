
module IDPipe (clk, writeAddr, writeData, Instruction, PC, RegWrite, BranchAddr, Equal, data1, data2, Imm, rd, rs1, rs2);

    input wire [20:0] Instruction;
    input wire [11:0] PC;
    input wire RegWrite, clk;
    input wire [3:0] writeAddr;
    input wire [31:0] writeData;
    output reg [11:0] BranchAddr;
    output reg Equal;
    output reg [31:0] data1, data2;
    output reg [31:0] Imm;
    output reg [3:0] rd, rs1, rs2;

    reg [31:0] ShiftedImm;
	 //de momento no se generan inmediatos
    ImmGen immGen(
        .OpCode(Instruction[19:15]),
        .InstructionP1(Instruction[14:0]),
        .InstructionP2(Instruction[9:0]),
        .Imm(Imm));

    //Shifter shifter(
    //    .data(Imm),
    //    .out(ShiftedImm));

    Adder #(12) BAdder (
        .a(PC),
        .b(Imm[11:0]),
        .sum(BranchAddr),
        .cin(1'b0));

    assign rd = Instruction[13:10];
     assign rs1 = (Instruction[19:15] == 5'b10111) ? 4'b0000 : Instruction[8:5];
    assign rs2 = Instruction[3:0];

    Register_File regFile(
        .clk(clk),
        .address1(rs1),
        .address2(rs2),
        .addressw(writeAddr),
        .writeData(writeData),
        .writeEn(RegWrite),
        .read1(data1),
        .read2(data2));
    
    Nbit_Equal_Comp #(32) equalComp(
        .Data0(data1),
        .Data1(data2),
        .Out(Equal));

endmodule