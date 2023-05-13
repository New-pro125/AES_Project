module AddRoundKey
(
input wire [127:0] state ,
input wire [127:0] RoundKey ,
output [127:0] new_state
);
genvar i;
localparam BYTE = 8;
generate 
	for(i=16;i>0;i=i-1)

    assign  new_state[i*BYTE-1-:8]=state[i*BYTE-1-:8] ^ RoundKey[i*BYTE-1-:8];
endgenerate
endmodule
