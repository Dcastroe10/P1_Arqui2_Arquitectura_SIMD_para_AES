module ImmGen (OpCode, InstructionP1, InstructionP2, Imm);
    
    input wire [0:4] OpCode;
    input wire [0:4] InstructionP1;
    input wire [0:9] InstructionP2;
    output reg [0:31] Imm;
    
    always_comb begin
        case (OpCode)
            5'b11000: begin
                Imm = {24'b0, InstructionP2};
            end
				5'b11001: begin
                Imm = {27'b0, InstructionP1};
            end
				5'b10001: begin
                Imm = {27'b0, InstructionP1};
            end
				5'b10011: begin
                Imm = {27'b0, InstructionP1};
            end
				5'b10010: begin
                Imm = {27'b0, InstructionP1};
            end
            default: begin
                Imm = 32'b0;
            end
        endcase
    end

endmodule
