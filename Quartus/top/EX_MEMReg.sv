module EX_MEMReg(clk, EX_ALUResult, EX_WriteData, EX_rd, EX_RegWrite, EX_MemToReg, EX_MemWrite,EX_VRegWrite,EX_colwrite,EX_columna,
                    , MEM_ALUResult, MEM_WriteData, MEM_rd, MEM_RegWrite, MEM_MemToReg, MEM_MemWrite,MEM_VRegWrite,MEM_colwrite,MEM_columna);
    
    input wire clk;
    input wire [31:0] EX_ALUResult, EX_WriteData;
    input wire [4:0] EX_rd;
    input wire EX_RegWrite, EX_MemWrite,EX_VRegWrite,EX_colwrite;
	 input wire [1:0] EX_MemToReg,EX_columna;
    output reg [31:0] MEM_ALUResult, MEM_WriteData;
    output reg [4:0] MEM_rd;
    output reg MEM_RegWrite, MEM_MemWrite,MEM_VRegWrite,MEM_colwrite;
	 output reg [1:0] MEM_MemToReg,MEM_columna;

    reg innerClk; // internal clock for emulate the setup & hold time
    reg [31:0] ALUResult, WriteData;
    reg [4:0] rd;
    reg RegWrite,MemWrite,VRegWrite,colwrite;
	 reg [1:0] MemToReg,columna;

   

    always_ff @(posedge innerClk) begin
        ALUResult <= EX_ALUResult;
        WriteData <= EX_WriteData;
        rd <= EX_rd;
        RegWrite <= EX_RegWrite;
        MemToReg <= EX_MemToReg;
        MemWrite <= EX_MemWrite;
		  VRegWrite <= EX_VRegWrite;
		  colwrite <= EX_colwrite;
		  columna <= EX_columna;
    end

    always_ff @(posedge clk) begin
        MEM_ALUResult <= ALUResult;
        MEM_WriteData <= WriteData;
        MEM_rd <= rd;
        MEM_RegWrite <= RegWrite;
        MEM_MemToReg <= MemToReg;
        MEM_MemWrite <= MemWrite;
		  MEM_VRegWrite <= VRegWrite;
		  MEM_colwrite <= colwrite;
		  MEM_columna <= columna;
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