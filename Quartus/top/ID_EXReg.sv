module ID_EXReg(clk, ID_data1, ID_data2, ID_Imm,
                ID_rd, ID_rs1, ID_rs2, ID_ALUControl,
                ID_RegWrite, ID_MemWrite, ID_MemToReg,ID_colwrite,ID_columna,
                ID_ALUScr, ID_VRegWrite,EX_data1, EX_data2, EX_Imm,
                EX_rd, EX_rs1, EX_rs2, EX_ALUControl,
                EX_RegWrite, EX_MemWrite, EX_MemToReg,
                EX_ALUScr,EX_VRegWrite,EX_colwrite,EX_columna,);

    input wire clk;
    input wire [31:0] ID_data1, ID_data2, ID_Imm;
    input wire [4:0] ID_rd, ID_rs1, ID_rs2;
    input wire [1:0] ID_MemToReg,ID_columna;
	 input wire [2:0]ID_ALUControl;
    input wire ID_RegWrite, ID_MemWrite, ID_ALUScr,ID_VRegWrite,ID_colwrite;
    output reg [31:0] EX_data1, EX_data2, EX_Imm;
    output reg [4:0] EX_rd, EX_rs1, EX_rs2;
    output reg [1:0] EX_MemToReg,EX_columna;
	 output reg [2:0] EX_ALUControl;
    output reg EX_RegWrite, EX_MemWrite,EX_ALUScr,EX_VRegWrite,EX_colwrite;
	 
    reg innerClk; // internal clock for emulate the setup & hold time
    reg [31:0] data1, data2, Imm;
    reg [4:0] rd, rs1, rs2;
    reg [2:0] ALUControl;
    reg RegWrite, MemWrite,ALUScr,VRegWrite,colwrite;
	 reg [1:0] MemToReg,columna;


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
		  colwrite <= ID_colwrite;
		  columna <= ID_columna;
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
		  EX_colwrite <= colwrite;
		  EX_columna <= columna;
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