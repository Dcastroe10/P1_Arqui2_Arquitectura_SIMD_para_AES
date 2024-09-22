
module EXPipe(data1, data2, Imm, Fw1, Fw2, Fw3, SelFwA, SelFwB, ALUScr, ALUControl, ALUResult, WriteData);

    input wire [31:0] Imm, Fw1, Fw2, Fw3;
	 input wire [31:0] data1, data2;
    input wire [1:0] SelFwA, SelFwB;
    input wire ALUScr;
    input wire [1:0] ALUControl;
    output reg [31:0] ALUResult;
    output reg [31:0] WriteData;

    reg [31:0] ALUIn1, ALUIn2, FwBOut;
    reg [31:0] FwAData [3:0];
    reg [31:0] FwBData [3:0];
    reg [31:0] ScrData [1:0];

    assign FwAData[0] = data1;
    assign FwAData[1] = Fw1;
    assign FwAData[2] = Fw2;
    assign FwAData[3] = Fw3;

    assign FwBData[0] = data2;
    assign FwBData[1] = Fw1;
    assign FwBData[2] = Fw2;
    assign FwBData[3] = Fw3;

    Mux #(4, 32) FwAMux(.Data_arr(FwAData), .selector(SelFwA), .Out(ALUIn1));
    Mux #(4, 32) FwBMux(.Data_arr(FwBData), .selector(SelFwB), .Out(FwBOut));

    assign ScrData[0] = FwBOut;
    assign ScrData[1] = Imm;

    Mux #(2, 32) ScrMux(.Data_arr(ScrData), .selector(ALUScr), .Out(ALUIn2));
    Alu #(32) alu(.SrcA(ALUIn1), .SrcB(ALUIn2), .ALUControl(ALUControl), .ALUResult(ALUResult));
	 assign ALUResult = {24'b0,ALUResult};

    assign WriteData = FwBOut;

endmodule