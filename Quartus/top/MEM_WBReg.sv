module MEM_WBReg(clk, MEM_MemData, MEM_ALUResult, MEM_rd, MEM_MemToReg, MEM_RegWrite,MEM_VRegWrite, MEM_sbox,
                    WB_MemData, WB_ALUResult, WB_rd, WB_MemToReg, WB_RegWrite,WB_VRegWrite,WB_sbox);

    input wire clk;
    input wire [31:0] MEM_MemData, MEM_ALUResult,MEM_sbox;
    input wire [4:0] MEM_rd;
    input wire MEM_RegWrite,MEM_VRegWrite;
	 input wire [1:0] MEM_MemToReg;
    output reg [31:0] WB_MemData, WB_ALUResult,WB_sbox;
    output reg [4:0] WB_rd;
    output reg WB_RegWrite,WB_VRegWrite;
	 output reg [1:0] WB_MemToReg;

    reg innerClk; // internal clock for emulate the setup & hold time
    reg [31:0] MemData, ALUResult,sbox;
    reg [4:0] rd;
    reg RegWrite,VRegWrite;  
	 reg [1:0] MemToReg; 

    always_ff @(posedge innerClk) begin
        MemData <= MEM_MemData;
        ALUResult <= MEM_ALUResult;
        rd <= MEM_rd;
        MemToReg <= MEM_MemToReg;
        RegWrite <= MEM_RegWrite;
		  VRegWrite <= MEM_VRegWrite;
		  sbox <= MEM_sbox;
    end

    always_ff @(posedge clk) begin
        WB_MemData <= MemData;
        WB_ALUResult <= ALUResult;
        WB_rd <= rd;
        WB_MemToReg <= MemToReg;
        WB_RegWrite <= RegWrite;
		  WB_VRegWrite <= VRegWrite;
		  WB_sbox <=sbox;
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