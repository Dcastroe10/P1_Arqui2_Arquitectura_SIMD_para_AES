module ImmGen (OpCode, InstructionP1, InstructionP2, Imm);
    
    input wire [0:4] OpCode;
    input wire [0:14] InstructionP1;
    input wire [0:9] InstructionP2;
    output reg [0:31] Imm;
    
    always_comb begin
        case (OpCode)
            5'b10111: begin
                Imm = {22'b0, InstructionP2};
            end
            5'b01000: begin
                Imm = {{52{InstructionP1[0]}}, InstructionP1[0:6], InstructionP2}; 
            end
            5'b11000: begin
                Imm = {{52{InstructionP1[0]}}, InstructionP1[0], InstructionP2[4], InstructionP1[1:6], InstructionP2[0:3]};
            end
            5'b00100: begin
                Imm = {{52{InstructionP1[0]}}, InstructionP1};
            end
            default: begin
                Imm = 32'b0;
            end
        endcase
    end

endmodule
