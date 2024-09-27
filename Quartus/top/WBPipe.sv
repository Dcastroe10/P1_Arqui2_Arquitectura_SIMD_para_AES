
module WBPipe(MemData, ALUResult, rcon, MemToReg, WriteData,sbox);

    input wire [31:0] MemData, ALUResult,sbox,rcon;
    input wire [1:0] MemToReg;
    output reg [31:0] WriteData;

    reg [31:0] Data_arr [3:0];
	 assign Data_arr[0] = ALUResult;
	 assign Data_arr[1] = MemData;
	 assign Data_arr[2] = sbox;
	 assign Data_arr[3] = rcon;

    Mux #(4, 32) MuxWD(.Data_arr(Data_arr), .selector(MemToReg), .Out(WriteData));


endmodule