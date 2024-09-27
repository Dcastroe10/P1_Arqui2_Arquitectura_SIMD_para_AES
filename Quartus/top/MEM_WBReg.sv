module MEM_WBReg(clk, MEM_MemData, MEM_ALUResult, MEM_rd, MEM_MemToReg, MEM_RegWrite,MEM_VRegWrite, MEM_sbox,MEM_rcon,MEM_colwrite,MEM_columna,
                    WB_MemData, WB_ALUResult, WB_rd, WB_MemToReg, WB_RegWrite,WB_VRegWrite,WB_sbox,WB_rcon,WB_colwrite,WB_columna);

    input wire clk;
    input wire [31:0] MEM_MemData, MEM_ALUResult,MEM_sbox,MEM_rcon;
    input wire [4:0] MEM_rd;
    input wire MEM_RegWrite,MEM_VRegWrite,MEM_colwrite;
	 input wire [1:0] MEM_MemToReg,MEM_columna;
    output reg [31:0] WB_MemData, WB_ALUResult,WB_sbox,WB_rcon;
    output reg [4:0] WB_rd;
    output reg WB_RegWrite,WB_VRegWrite,WB_colwrite;
	 output reg [1:0] WB_MemToReg,WB_columna;

    reg innerClk; // internal clock for emulate the setup & hold time
    reg [31:0] MemData, ALUResult,sbox,rcon;
    reg [4:0] rd;
    reg RegWrite,VRegWrite,colwrite;  
	 reg [1:0] MemToReg,columna; 

    always_ff @(posedge innerClk) begin
        MemData <= MEM_MemData;
        ALUResult <= MEM_ALUResult;
        rd <= MEM_rd;
        MemToReg <= MEM_MemToReg;
        RegWrite <= MEM_RegWrite;
		  VRegWrite <= MEM_VRegWrite;
		  sbox <= MEM_sbox;
		  rcon <= MEM_rcon;
		  colwrite <= MEM_colwrite;
		  columna <= MEM_columna;
    end

    always_ff @(posedge clk) begin
        WB_MemData <= MemData;
        WB_ALUResult <= ALUResult;
        WB_rd <= rd;
        WB_MemToReg <= MemToReg;
        WB_RegWrite <= RegWrite;
		  WB_VRegWrite <= VRegWrite;
		  WB_sbox <=sbox;
		  WB_rcon <= rcon;
		  WB_colwrite <= colwrite;
		  WB_columna <= columna;
		  
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