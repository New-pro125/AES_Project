module subbyte(input [127:0] state ,output [127:0] outstate );

genvar i;
generate 
for(i=127;i>=0;i=i-8)
begin
sbox create(.din(state[i:i-7]),.dout(outstate[i:i-7]));
end
endgenerate
endmodule