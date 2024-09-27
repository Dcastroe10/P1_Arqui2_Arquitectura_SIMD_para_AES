
module MEMPipe(clk, ALUResult, WriteData, MemWrite, MemData,SBoxData,rconData);

    input wire clk;
    input wire [31:0] ALUResult, WriteData;
    input wire MemWrite;
    output reg [31:0] MemData,SBoxData,rconData;

    s_box Sbox (.address1(ALUResult[7:0]), 
					 .address2(ALUResult[15:8]),
					 .address3(ALUResult[23:16]),
					 .address4(ALUResult[31:24]),
					 .readData(SBoxData));
					 
	 rcon Rcon(
	 .address1(ALUResult[7:0]),
	 .readData(rconData)
	 );
	 
	 Memory #(1024, 32) mem(
        .clk(clk),
        .address(ALUResult[9:0]),
        .writeData(WriteData),
        .writeEn(MemWrite),
        .readData(MemData));
	

		  

endmodule