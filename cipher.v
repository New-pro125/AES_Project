
module cipher #(
    parameter Nb=4, 
    parameter Nk=4, 
    parameter Nr=10 
) 
(input [127:0] in,input [32*Nk-1:0] Key,output [127:0]out);


wire [127:0]outadd[1:Nr];
wire [127:0]outadd1[1:Nr];
wire [127:0]outadd2[1:Nr];
wire [127:0]outadd3[0:Nr];
wire [127:0]outadd4;
wire [127:0]outadd5;
wire [127:0]outadd6;
wire [0:32*Nb*(Nr+1)-1] Word;


KeyExpansion #(Nb,Nk,Nr) a2 (Key,Word);
AddRoundKey a (in,Word[0+:128],outadd3[0]);
genvar i;
generate
    for(i=1;i<Nr;i=i+1)
    begin
       subbyte u (outadd3[i-1],outadd[i]);
      
       shiftRows u1 (outadd[i],outadd1[i]);
     
       Mixcolumns u2 (outadd1[i],outadd2[i]);
      
       AddRoundKey a3 (outadd2[i],Word[128*i+:128],outadd3[i]);
    
    end
endgenerate

       subbyte u4 (outadd3[Nr-1],outadd4);
  
       shiftRows u5 (outadd4,outadd5);
      
       AddRoundKey a6 (outadd5,Word[128*Nr+:128],outadd6);
    
      assign out=outadd6;
endmodule
module AES_Encrypt_tb;
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


initial begin

$monitor("in128= %h, key128= %h ,out128= %h",in1,key1,out1);
in1=128'h_3243f6a8_885a308d_313198a2_e0370734;
key1=128'h_2b7e1516_28aed2a6_abf71588_09cf4f3c;
#10;
$monitor("in192= %h, key192= %h ,out192= %h",in2,key2,out2);
in2=128'h_00112233_44556677_8899aabb_ccddeeff;
key2=192'h_00010203_04050607_08090a0b_0c0d0e0f_10111213_14151617;
#10;
$monitor("in256= %h, key256= %h ,out256= %h",in3,key3,out3);
in3=128'h_00112233_44556677_8899aabb_ccddeeff;
key3=256'h_00010203_04050607_08090a0b_0c0d0e0f_10111213_14151617_18191a1b_1c1d1e1f;
#10;
end

endmodule

