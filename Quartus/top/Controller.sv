
module Controller(Instruction, ALUControl, RegWrite, MemWrite, Branch, MemToReg, ALUScr,VRegWrite);
    parameter BITS = 20;
    input wire [BITS-1:0] Instruction;

    //output reg [0:63] Imm;
    output reg [0:1] MemToReg;
	 output reg [2:0] ALUControl;
    output reg RegWrite, MemWrite, Branch, VRegWrite;
    output reg ALUScr;

    Decoder decoder(
        .OpCode(Instruction[19:15]),
        .rd_type(Instruction[14]),
        .rs1_type(Instruction[9]),
		  .rs2_type(Instruction[4]),
        .ALUControl(ALUControl),
        .RegWrite(RegWrite),
        .MemWrite(MemWrite),
        .Branch(Branch),
        .MemToReg(MemToReg),
        .ALUScr(ALUScr),
		  .VRegWrite(VRegWrite));


endmodule