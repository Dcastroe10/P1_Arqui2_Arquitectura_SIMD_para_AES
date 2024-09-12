
module WBPipe(MemData, ALUResult, MemToReg, WriteData);

    input wire [63:0] MemData, ALUResult;
    input wire MemToReg;
    output reg [63:0] WriteData;

    reg [63:0] Data_arr [1:0];
	 assign Data_arr[0] = ALUResult;
	 assign Data_arr[1] = MemData;

    Mux #(2, 64) MuxWD(.Data_arr(Data_arr), .selector(MemToReg), .Out(WriteData));


endmodule