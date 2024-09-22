module ID_EXReg(clk, ID_data1, ID_data2, ID_Imm,
                ID_rd, ID_rs1, ID_rs2, ID_ALUControl,
                ID_RegWrite, ID_MemWrite, ID_MemToReg,
                ID_ALUScr, ID_VRegWrite,EX_data1, EX_data2, EX_Imm,
                EX_rd, EX_rs1, EX_rs2, EX_ALUControl,
                EX_RegWrite, EX_MemWrite, EX_MemToReg,
                EX_ALUScr,EX_VRegWrite);

    input wire clk;
    input wire [31:0] ID_data1, ID_data2, ID_Imm;
    input wire [4:0] ID_rd, ID_rs1, ID_rs2;
    input wire [1:0] ID_ALUControl;
    input wire ID_RegWrite, ID_MemWrite, ID_MemToReg, ID_ALUScr,ID_VRegWrite;
    output reg [31:0] EX_data1, EX_data2, EX_Imm;
    output reg [4:0] EX_rd, EX_rs1, EX_rs2;
    output reg [1:0] EX_ALUControl;
    output reg EX_RegWrite, EX_MemWrite, EX_MemToReg, EX_ALUScr,EX_VRegWrite;

    reg innerClk; // internal clock for emulate the setup & hold time
    reg [31:0] data1, data2, Imm;
    reg [3:0] rd, rs1, rs2;
    reg [1:0] ALUControl;
    reg RegWrite, MemWrite, MemToReg, ALUScr,VRegWrite;


    always_ff @(posedge innerClk) begin
        data1 <= ID_data1;
        data2 <= ID_data2;
        Imm <= ID_Imm;
        rd <= ID_rd;
        rs1 <= ID_rs1;
        rs2 <= ID_rs2;
        ALUControl <= ID_ALUControl;
        RegWrite <= ID_RegWrite;
        MemWrite <= ID_MemWrite;
        MemToReg <= ID_MemToReg;
        ALUScr <= ID_ALUScr;
		  VRegWrite <= ID_VRegWrite;
    end

    always_ff @(posedge clk) begin
        EX_data1 <= data1;
        EX_data2 <= data2;
        EX_Imm <= Imm;
        EX_rd <= rd;
        EX_rs1 <= rs1;
        EX_rs2 <= rs2;
        EX_ALUControl <= ALUControl;
        EX_RegWrite <= RegWrite;
        EX_MemWrite <= MemWrite;
        EX_MemToReg <= MemToReg;
        EX_ALUScr <= ALUScr;
		  EX_VRegWrite <= VRegWrite;
    end

    initial begin
        innerClk = 0;
        #1;
        for (int i=0; i<100; i++) begin
            #8 innerClk = ~innerClk; // emulate the setup & hold time
            #2 innerClk = ~innerClk; // emulate the setup & hold time
        end
    end

endmodule