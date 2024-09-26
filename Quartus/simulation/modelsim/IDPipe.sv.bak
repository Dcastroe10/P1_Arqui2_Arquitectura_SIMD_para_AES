
module IDPipe (clk, writeAddr, writeData, Instruction, PC, RegWrite, BranchAddr, Equal, data1, data2, Imm, rd, rs1, rs2,VRegWrite);

    input wire [20:0] Instruction;
    input wire [11:0] PC;
    input wire RegWrite, clk, VRegWrite;
    input wire [3:0] writeAddr;
    input wire [31:0] writeData;
    output reg [11:0] BranchAddr;
    output reg Equal;
	 output reg [31:0] data1, data2;
    output reg [31:0] Imm;
    output reg [4:0] rd, rs1, rs2;
	 reg [31:0] r_data1, r_data2;
	 reg [31:0] v_data1, v_data2;
	 reg [31:0] Fwdata_1 [1:0];
	 reg [31:0] Fwdata_2 [1:0];

    reg [31:0] ShiftedImm;
	 //de momento no se generan inmediatos
    ImmGen immGen(
        .OpCode(Instruction[19:15]),
        .InstructionP1(Instruction[14:0]),
        .InstructionP2(Instruction[9:0]),
        .Imm(Imm));

    //Shifter shifter(
    //    .data(Imm),
    //    .out(ShiftedImm));

    Adder #(12) BAdder (
        .a(PC),
        .b(Imm[11:0]),
        .sum(BranchAddr),
        .cin(1'b0));

    assign rd = Instruction[14:10];
    assign rs1 = (Instruction[19:15] == 5'b11000) ? 5'b00000 : Instruction[9:5];
    assign rs2 = Instruction[4:0];

    Register_File regFile(
        .clk(clk),
        .address1(rs1[3:0]),
        .address2(rs2[3:0]),
        .addressw(writeAddr),
        .writeData(writeData),
        .writeEn(RegWrite),
        .read1(r_data1),
        .read2(r_data2));
		  
	 Vectorial_Register_File vecRegFile(
			.clk(clk),
			.address1(rs1[3:0]),
			.address2(rs2[3:0]),
			.addressw(writeAddr),
			.writeData(writeData),
			.writeEn(VRegWrite),
			.read1(v_data1),
			.read2(v_data2));
			
	 assign Fwdata_1[0] = r_data1;
	 assign Fwdata_1[1] = v_data1;
	 Mux #(2,32) data_1Mux(.Data_arr(Fwdata_1),.selector(Instruction[9]),.Out(data1));
	 
	 assign Fwdata_2[0] = r_data2;
	 assign Fwdata_2[1] = v_data2;
	 Mux #(2,32) data_2Mux(.Data_arr(Fwdata_2),.selector(Instruction[4]),.Out(data2));
    
    Nbit_Equal_Comp #(32) equalComp(
        .Data0(r_data1),
        .Data1(r_data2),
        .Out(Equal));

endmodule