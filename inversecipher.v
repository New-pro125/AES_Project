module inversecipher #(
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
AddRoundKey a (in,Word[128*Nr+:128],outadd3[Nr]);
genvar i;
generate
    for(i=Nr-1;i>=1;i=i-1)
    begin 
      invShiftRows u(outadd3[i+1],outadd[i]);
      inverse_subbyte u1 (outadd[i],outadd1[i]);
      AddRoundKey u2 (outadd1[i],Word[128*i+:128],outadd2[i]);
      inverse_Mixcolumns u3 (outadd2[i],outadd3[i]);
      
    end
endgenerate

    invShiftRows u4 (outadd3[1],outadd4);
   inverse_subbyte u5 (outadd4,outadd5);   
   AddRoundKey u6 (outadd5,Word[0+:128],outadd6);
   
      assign out=outadd6;
endmodule
module AES_Decrypt_tb;
reg [127:0] in1;
wire [127:0] out1;
reg [127:0] key1;

reg [127:0] in2;
wire [127:0] out2;
reg [191:0] key2;

reg [127:0] in3;
wire [127:0] out3;
reg [255:0] key3;

inversecipher  #(4,4,10) a(.in(in1),.Key(key1),.out(out1));
inversecipher  #(4,6,12) b(in2,key2,out2);
inversecipher  #(4,8,14) c(in3,key3,out3);
initial begin
$monitor("in128= %h, key128= %h ,out128= %h",in1,key1,out1);
in1=128'h69c4e0d86a7b0430d8cdb78070b4c55a;
key1=128'h000102030405060708090a0b0c0d0e0f;
#10;
$monitor("in192= %h, key192= %h ,out192= %h",in2,key2,out2);
in2=128'hdda97ca4864cdfe06eaf70a0ec0d7191;
key2=192'h000102030405060708090a0b0c0d0e0f1011121314151617;
#10;
$monitor("in256= %h, key256= %h ,out256= %h",in3,key3,out3);
in3=128'h8ea2b7ca516745bfeafc49904b496089;
key3=256'h000102030405060708090a0b0c0d0e0f101112131415161718191a1b1c1d1e1f;
#10;
end
endmodule