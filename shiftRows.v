module shiftRows(din,dout);
input wire[7:0] din [3:0][3:0];
output wire [7:0] dout [3:0][3:0];
// integer r,c;
// always @* begin
// for (r = 0;r<4;r=r+1 ) begin
//     for(c=0;c<4;c=c+1)begin
//      doutput[r][c]=dinput[r][(c+r)%4];
// end
// end
// end
assign dout[0][0]=din[0][0];
assign dout[0][1]=din[0][1];
assign dout[0][2]=din[0][2];
assign dout[0][3]=din[0][3];

assign dout[1][0]=din[1][1];
assign dout[1][1]=din[1][2];
assign dout[1][2]=din[1][3];
assign dout[1][3]=din[1][0];

assign dout[2][0]=din[2][2];
assign dout[2][1]=din[2][3];
assign dout[2][2]=din[2][0];
assign dout[2][3]=din[2][1];

assign dout[3][0]=din[3][3];
assign dout[3][1]=din[3][0];
assign dout[3][2]=din[3][1];
assign dout[3][3]=din[3][2];

endmodule
