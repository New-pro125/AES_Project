
module cipher_tb;
reg [127:0] in1;
wire [127:0] out1;
reg [127:0] key1;

reg [127:0] in2;
wire [127:0] out2;
reg [191:0] key2;

reg [127:0] in3;
wire [127:0] out3;
reg [255:0] key3;

cipher  #(4,4,10) a(.in(in1),.Key(key1),.out(out1));
cipher  #(4,6,12) b(in2,key2,out2);
cipher  #(4,8,14) c(in3,key3,out3);


initial
begin


in1=128'h_3243f6a8_885a308d_313198a2_e0370734;
key1=128'h_2b7e1516_28aed2a6_abf71588_09cf4f3c;
#10
in2=128'h_00112233_44556677_8899aabb_ccddeeff;
key2=192'h_00010203_04050607_08090a0b_0c0d0e0f_10111213_14151617;
#10
in3=128'h_00112233_44556677_8899aabb_ccddeeff;
key3=256'h_00010203_04050607_08090a0b_0c0d0e0f_10111213_14151617_18191a1b_1c1d1e1f;

end

endmodule

