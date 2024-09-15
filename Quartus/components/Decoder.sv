module Decoder (OpCode, rd_type, rs1_type, rs2_type, ALUControl, RegWrite, MemWrite, Branch, MemToReg, ALUScr);

    input wire [0:4] OpCode;
    input wire rd_type,rs1_type,rs2_type;
    output reg [0:1] ALUControl;
    output reg RegWrite, MemWrite, Branch, MemToReg;
    output reg ALUScr;

    always_comb begin
        case (OpCode)
				5'b10111: begin //mov rd=imma
                ALUControl = 2'b00;
                RegWrite = 1'b1;
                MemWrite = 1'b0;
                Branch = 1'b0;
                MemToReg = 1'b0;
                ALUScr = 1'b1;
            end
				5'b11000: begin // suma rd=rs1+rs2
                ALUControl = 2'b00;
                RegWrite = 1'b1;
                MemWrite = 1'b0;
                Branch = 1'b0;
                MemToReg = 1'b0;
                ALUScr = 1'b0;
            end
				5'b11011: begin //mov rd=rs1
                ALUControl = 2'b00;
                RegWrite = 1'b1;
                MemWrite = 1'b0;
                Branch = 1'b0;
                MemToReg = 1'b0;
                ALUScr = 1'b0;
            end
				5'b11111: begin // rd=rs1*rs2
                ALUControl = 2'b10;
                RegWrite = 1'b1;
                MemWrite = 1'b0;
                Branch = 1'b0;
                MemToReg = 1'b0;
                ALUScr = 1'b0;
            end
				5'b11110: begin // rd=rs1-rs2
                ALUControl = 2'b01;
                RegWrite = 1'b1;
                MemWrite = 1'b0;
                Branch = 1'b0;
                MemToReg = 1'b0;
                ALUScr = 1'b0;
            end
				5'b01100: begin // rd=rs1 xor rs2
                ALUControl = 2'b11;
                RegWrite = 1'b1;
                MemWrite = 1'b0;
                Branch = 1'b0;
                MemToReg = 1'b0;
                ALUScr = 1'b0;
            end
            default: begin
                ALUControl = 2'b00;
                RegWrite = 1'b0;
                MemWrite = 1'b0;
                Branch = 1'b0;
                MemToReg = 1'b0;
                ALUScr = 1'b0;
            end
            
        endcase
    end
    
endmodule