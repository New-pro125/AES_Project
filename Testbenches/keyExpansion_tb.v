
module keyExpansion_tb;
reg [0:127] k1;
wire [0:1407] out1;

reg [0:191] k2;
wire [0:1663] out2;

reg [0:255] k3;
wire [0:1919] out3;
KeyExpansion ks (k1,out1);
KeyExpansion #(4,6,12) ks2(k2,out2);
KeyExpansion #(4,8,14) ks3(k3,out3);
initial begin
k1=128'h_2b7e1516_28aed2a6_abf71588_09cf4f3c;
k2=192'h_8e73b0f7_da0e6452_c810f32b_809079e5_62f8ead2_522c6b7b;
k3=256'h_603deb10_15ca71be_2b73aef0_857d7781_1f352c07_3b6108d7_2d9810a3_0914dff4;
end
endmodule