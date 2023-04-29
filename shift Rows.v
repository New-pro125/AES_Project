module shiftRows(din,dout);
input wire[127:0] din;
output wire [127:0]dout;


assign dout[7+0*8:0*8]=din[7+0*8:0*8];
assign dout[7+4*8:4*8]=din[7+4*8:4*8];
assign dout[7+8*8:8*8]=din[7+8*8:8*8];
assign dout[7+12*8:12*8]=din[7+12*8:12*8];

assign dout[7+1*8:1*8]=din[7+5*8:5*8];
assign dout[7+5*8:5*8]=din[7+9*8:9*8];
assign dout[7+9*8:9*8]=din[7+13*8:13*8];
assign dout[7+13*8:13*8]=din[7+1*8:1*8];

assign dout[7+2*8:2*8]=din[7+10*8:10*8];
assign dout[7+6*8:6*8]=din[7+14*8:14*8];
assign dout[7+10*8:10*8]=din[7+2*8:2*8];
assign dout[7+14*8:14*8]=din[7+6*8:6*8];

assign dout[7+3*8:3*8]=din[7+15*8:15*8];
assign dout[7+7*8:7*8]=din[7+3*8:3*8];
assign dout[7+11*8:11*8]=din[7+7*8:7*8];
assign dout[7+15*8:15*8]=din[7+11*8:11*8];


endmodule