
module WBPipe(MemData, ALUResult, MemToReg, WriteData,sbox);

    input wire [31:0] MemData, ALUResult,sbox;
    input wire [1:0] MemToReg;
    output reg [31:0] WriteData;

    reg [31:0] Data_arr [2:0];
	 assign Data_arr[0] = ALUResult;
	 assign Data_arr[1] = MemData;
	 assign Data_arr[2] = sbox;

    Mux #(3, 32) MuxWD(.Data_arr(Data_arr), .selector(MemToReg), .Out(WriteData));


endmodule