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
module AddRoundKey_tb;
reg [127:0] state;
reg [127:0] RoundKey;
wire [127:0] new_state;
initial
begin
    state=128'h3243f6a8885a308d313198a2e0370734;
    RoundKey=128'h2b7e151628aed2a6abf7158809cf4f3c;
end
AddRoundKey u (.state(state),.RoundKey(RoundKey),.new_state(new_state));
endmodule