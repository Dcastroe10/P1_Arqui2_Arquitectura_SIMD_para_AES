module IF_IDReg(clk, writeEn, IF_PC, IF_Instruction, ID_PC, ID_Instruction);
    input wire [11:0] IF_PC;
    input wire [20:0] IF_Instruction;
    input wire writeEn;
    output reg [11:0] ID_PC;
    output reg [20:0] ID_Instruction;
    input wire clk;

    reg innerClk; // internal clock for emulate the setup & hold time
    reg [11:0] PC;
    reg [20:0] Instruction;

    always_ff @(posedge innerClk) begin
        if (!writeEn) begin
            PC <= IF_PC;
            Instruction <= IF_Instruction;
        end
    end

    always_ff @(posedge clk) begin
        ID_PC <= PC;
        ID_Instruction <= Instruction;
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