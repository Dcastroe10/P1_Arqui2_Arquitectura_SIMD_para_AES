module gf_mul(
	input logic 	[7:0] index0,
	input logic		[7:0] index1,
	input logic		[7:0] index2,
	input logic		[7:0] index3,
	input logic		[1:0] row,
	output logic	[7:0] result
);
	
	logic [7:0] temp2;
	logic [7:0] temp3;
	
	logic [7:0] mf_0;
	logic [7:0] mf_1;
	logic [7:0] mf_2;
	logic [7:0] mf_3;
	
	function logic [7:0] mul_by_2(input logic [7:0] x);
		begin
			mul_by_2 = (x << 1);
			if (x[7] == 1'b1) begin
				mul_by_2 = mul_by_2 ^ 8'h1B;
			end
		end
	endfunction
	
	function logic [7:0] mul_by_3(input logic [7:0] x);
		begin
			mul_by_3 = mul_by_2(x) ^ x;
		end
	endfunction
	
	always_comb begin
	
		case (row)
			
			5'b00: begin			
				temp2 = mul_by_2(index0);
				temp3 = mul_by_3(index1);
				result = temp2 ^ temp3 ^ index2 ^ index3;
			end
				
			5'b01: begin			
				temp2 = mul_by_2(index1);
				temp3 = mul_by_3(index2);
				result = temp2 ^ temp3 ^ index0 ^ index3;
			end
			
			5'b10: begin			
				temp2 = mul_by_2(index2);
				temp3 = mul_by_3(index3);
				result = temp2 ^ temp3 ^ index0 ^ index1;
			end
			
			5'b11: begin			
				temp2 = mul_by_2(index3);
				temp3 = mul_by_3(index0);
				result = temp2 ^ temp3 ^ index1 ^ index2;
			end
		endcase
	end
	
endmodule