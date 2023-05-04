module Mixcolumns(
  input wire [127:0] in, 
  output reg [127:0] out
);

  genvar i;
  
function[7:0] xntimes(input [7:0] result,input integer n);
integer j;
begin
	for(j=0;j<n;j=j+1)
	begin
		if(result[7] == 1) 
			result = ((result << 1) ^ 8'h1b);
		else 
			result = result << 1; 
	end
	xntimes=result;
end

endfunction


function [7:0] multiply_by_03;
input [7:0] result;
begin
	multiply_by_03=xntimes(result,1)^result;
end
endfunction

function [7:0] multiply_by_02; 
input [7:0] result;
begin
	multiply_by_02=xntimes(result,1);
end
endfunction

generate
for(i=3;i>=0;i=i-1) begin 

	assign out [32*i+31:32*i+24] = multiply_by_02(in[32*i+31:32*i+24]) ^ multiply_by_03(in[32*i+23:32*i+16]) ^  (in[32*i+15:32*i+8]) ^  (in[32*i+7:32*i]);
	assign out [32*i+23:32*i+16] =  (in[32*i+31:32*i+24]) ^ multiply_by_02(in[32*i+23:32*i+16]) ^ multiply_by_03(in[32*i+15:32*i+8]) ^  (in[32*i+7:32*i]);
	assign out [32*i+15:32*i+8]  =  (in[32*i+31:32*i+24]) ^  (in[32*i+23:32*i+16]) ^ multiply_by_02(in[32*i+15:32*i+8]) ^ multiply_by_03(in[32*i+7:32*i]);
  assign out [32*i+7:32*i]     = multiply_by_03(in[32*i+31:32*i+24]) ^  (in[32*i+23:32*i+16]) ^  (in[32*i+15:32*i+8]) ^ multiply_by_02(in[32*i+7:32*i]);
end
endgenerate
endmodule