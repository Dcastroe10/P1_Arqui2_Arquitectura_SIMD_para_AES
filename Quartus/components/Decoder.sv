module Decoder (OpCode, rd_type, rs1_type, rs2_type, ALUControl, RegWrite, MemWrite, Branch, MemToReg, ALUScr,VRegWrite,colread,colwrite);

    input wire [0:4] OpCode;
    input wire rd_type,rs1_type,rs2_type;
    output reg [0:1] MemToReg;
	 output reg [0:2] ALUControl;
    output reg RegWrite, MemWrite, Branch,VRegWrite,colread,colwrite;
    output reg ALUScr;

    always_comb begin
        case (OpCode)
				5'b11000: begin //mov rd=imma
                ALUControl = 3'b000;
                RegWrite = 1'b1;
                MemWrite = 1'b0;
                Branch = 1'b0;
                MemToReg = 2'b00;
                ALUScr = 1'b1;
					 VRegWrite = 1'b0;
					 colread =1'b0;
					 colwrite = 1'b0;
            end
				5'b10101: begin // suma rd=rs1+rs2
                ALUControl = 3'b000;
                RegWrite = 1'b1;
                MemWrite = 1'b0;
                Branch = 1'b0;
                MemToReg = 2'b00;
                ALUScr = 1'b0;
					 VRegWrite = 1'b0;
					 colread =1'b0;
					 colwrite = 1'b0;
            end
				5'b11011: begin //mov rd=rs1
                ALUControl = 3'b000;
                RegWrite = 1'b1;
                MemWrite = 1'b0;
                Branch = 1'b0;
                MemToReg = 2'b00;
                ALUScr = 1'b0;
					 VRegWrite = 1'b0;
					 
					 colread =1'b0;
					 colwrite =1'b0;
            end
				5'b01100: begin // rd=rs1 xor rs2
                ALUControl = 3'b011;
                RegWrite = 1'b1;
                MemWrite = 1'b0;
                Branch = 1'b0;
                MemToReg = 2'b00;
                ALUScr = 1'b0;
					 VRegWrite = 1'b0;
					 
					 colread =1'b0;
					 colwrite =1'b0;
            end
				5'b10001: begin // intruccion especial rcon
                ALUControl = 3'b000;
                RegWrite = 1'b0;
                MemWrite = 1'b0;
                Branch = 1'b0;
                MemToReg = 2'b11;
                ALUScr = 1'b1;
					 VRegWrite = 1'b1;
					 
					 colread =1'b0;
					 colwrite =1'b0;
            end
				5'b11100: begin // vrd=vrs1^vrs2
                ALUControl = 3'b011;
                RegWrite = 1'b0;
                MemWrite = 1'b0;
                Branch = 1'b0;
                MemToReg = 2'b00;
                ALUScr = 1'b0;
					 VRegWrite = 1'b1;
					 
					 colread =1'b0;
					 colwrite =1'b0;
            end
				5'b10110: begin // vldr vrd=[rs1]
                ALUControl = 3'b000;
                RegWrite = 1'b0;
                MemWrite = 1'b0;
                Branch = 1'b0;
                MemToReg = 2'b01;
                ALUScr = 1'b0;
					 VRegWrite = 1'b1;
					 
					 colread =1'b0;
					 colwrite =1'b0;
            end
				5'b11011: begin // ldr rd=[rs1]
                ALUControl = 3'b000;
                RegWrite = 1'b1;
                MemWrite = 1'b0;
                Branch = 1'b0;
                MemToReg = 2'b01;
                ALUScr = 1'b0;
					 VRegWrite = 1'b0;
					 
					 colread =1'b0;
					 colwrite =1'b0;
            end
				5'b10111: begin // vstr vrd=[rs1]
                ALUControl = 3'b000;
                RegWrite = 1'b0;
                MemWrite = 1'b1;
                Branch = 1'b0;
                MemToReg = 2'b00;
                ALUScr = 1'b1;
					 VRegWrite = 1'b0;
					 
					 colread =1'b0;
					 colwrite =1'b0;
            end
				5'b11010: begin // str rd=[rs1]
                ALUControl = 3'b000;
                RegWrite = 1'b0;
                MemWrite = 1'b1;
                Branch = 1'b0;
                MemToReg = 2'b00;
                ALUScr = 1'b1;
					 VRegWrite = 1'b0;
					 colread =1'b0;
					 colwrite = 1'b0;
            end
				5'b10100: begin // beq rs1 == rs2
                ALUControl = 3'b000;
                RegWrite = 1'b0;
                MemWrite = 1'b0;
                Branch = 1'b1;
                MemToReg = 2'b00;
                ALUScr = 1'b0;
					 VRegWrite = 1'b0;
					 colread = 1'b0;
					 colwrite = 1'b0;
            end
				5'b11001: begin // branch
                ALUControl = 3'b000;
                RegWrite = 1'b0;
                MemWrite = 1'b0;
                Branch = 1'b1;
                MemToReg = 2'b00;
                ALUScr = 1'b0;
					 VRegWrite = 1'b0;
					 
					 colread =1'b0;
					 colwrite =1'b0;
            end
				5'b11110: begin // instruccion especial sbox
                ALUControl = 3'b000;
                RegWrite = 1'b0;
                MemWrite = 1'b0;
                Branch = 1'b0;
                MemToReg = 2'b10;
                ALUScr = 1'b1;
					 VRegWrite = 1'b1;
					 
					 colread =1'b0;
					 colwrite = 1'b0;
            end
				5'b11111: begin // instruccion especial de sustitucion
                ALUControl = 3'b101;
                RegWrite = 1'b0;
                MemWrite = 1'b0;
                Branch = 1'b0;
                MemToReg = 2'b00;
                ALUScr = 1'b1;
					 VRegWrite = 1'b1 ;
					 
					 colread =1'b0;
					 colwrite = 1'b0;
            end
				5'b10011: begin // instruccion especial leer columna
                ALUControl = 3'b000;
                RegWrite = 1'b0;
                MemWrite = 1'b0;
                Branch = 1'b0;
                MemToReg = 2'b00;
                ALUScr = 1'b0;
					 VRegWrite = 1'b1;
					 
					 colread =1'b1;
					 colwrite =1'b0;
            end
				5'b10010: begin // instruccion especial escribir columna
                ALUControl = 3'b010;
                RegWrite = 1'b0;
                MemWrite = 1'b0;
                Branch = 1'b0;
                MemToReg = 2'b00;
                ALUScr = 1'b0;
					 VRegWrite = 1'b1;
					 
					 colread =1'b0;
					 colwrite =1'b1;
            end
				5'b11101: begin // shift
                ALUControl = 3'b100;
                RegWrite = 1'b0;
                MemWrite = 1'b0;
                Branch = 1'b0;
                MemToReg = 2'b00;
                ALUScr = 1'b0;
					 VRegWrite = 1'b1;
					 
					 colread =1'b0;
					 colwrite =1'b0;
            end
            default: begin
                ALUControl = 3'b000;
                RegWrite = 1'b0;
                MemWrite = 1'b0;
                Branch = 1'b0;
                MemToReg = 2'b00;
                ALUScr = 1'b1;
					 VRegWrite = 1'b0;
					 
					 colread =1'b0;
					 colwrite =1'b0;
            end
            
        endcase
    end
    
endmodule