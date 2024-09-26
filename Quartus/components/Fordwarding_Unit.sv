module Fordwarding_Unit(rs1, rs2, MEM_rd, WB_rd, MEM_RegWrite, MEM_VRegWrite, WB_RegWrite, WB_VRegWrite, MemToReg, FwASel, FwBSel);

    input wire [4:0] rs1, rs2, MEM_rd, WB_rd;
    input wire MEM_RegWrite, MEM_VRegWrite, WB_RegWrite, WB_VRegWrite, MemToReg;
    output reg [1:0] FwASel, FwBSel;

    always_comb begin
        
        if ((MEM_RegWrite || MEM_VRegWrite) && (rs1 == MEM_rd) && MemToReg) begin
            FwASel = 2'b01;
        end else if ((MEM_RegWrite || MEM_VRegWrite) && (rs1 == MEM_rd)) begin
            FwASel = 2'b10;
        end else begin
            FwASel = (WB_RegWrite || WB_VRegWrite) && (rs1 == WB_rd) ? 2'b11 : 2'b00;
        end

        if ((MEM_RegWrite || MEM_VRegWrite) && (rs2 == MEM_rd) && MemToReg) begin
            FwBSel = 2'b01;
        end else if ((MEM_RegWrite || MEM_VRegWrite) && (rs2 == MEM_rd)) begin
            FwBSel = 2'b10;
        end else begin
            FwBSel = (WB_RegWrite || WB_VRegWrite) && (rs2 == WB_rd) ? 2'b11 : 2'b00;
        end

    end

endmodule