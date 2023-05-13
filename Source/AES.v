module AES(input enable, 
output encryption128,
output encryption192 ,
output encryption256 ,
output decryption128 ,
output decryption192 ,
output decryption256 );
wire[127:0] text = 128'h_00112233445566778899aabbccddeeff;
wire[127:0] key128 = 128'h_000102030405060708090a0b0c0d0e0f;
wire[191:0] key192 = 192'h_000102030405060708090a0b0c0d0e0f1011121314151617;
wire[255:0] key256 = 256'h_000102030405060708090a0b0c0d0e0f101112131415161718191a1b1c1d1e1f;
wire[127:0] cipher_result128 = 128'h_69c4e0d86a7b0430d8cdb78070b4c55a;
wire[127:0] cipher_result192 = 128'h_dda97ca4864cdfe06eaf70a0ec0d7191;
wire[127:0] cipher_result256 = 128'h_8ea2b7ca516745bfeafc49904b496089;
wire[127:0] cipher_out128;
wire[127:0] cipher_out192;
wire[127:0] cipher_out256;
wire[127:0] inversecipher_out128;
wire[127:0] inversecipher_out192;
wire[127:0] inversecipher_out256;
cipher           a1(text,key128,cipher_out128);
cipher #(4,6,12) b1(text,key192,cipher_out192);
cipher #(4,8,14) c1(text,key256,cipher_out256);
inversecipher           a2(cipher_out128,key128,inversecipher_out128);
inversecipher #(4,6,12) b2(cipher_out192,key192,inversecipher_out192);
inversecipher #(4,8,14) c2(cipher_out256,key256,inversecipher_out256);
assign encryption128 = (cipher_out128 == cipher_result128 && enable==1) ? 1'b1 : 1'b0;
assign encryption192 = (cipher_out192 == cipher_result192 && enable==1) ? 1'b1 : 1'b0;
assign encryption256 = (cipher_out256 == cipher_result256 && enable==1) ? 1'b1 : 1'b0;
assign decryption128 = (inversecipher_out128 == text && enable==1) ? 1'b1 : 1'b0;
assign decryption192 = (inversecipher_out192 == text && enable==1) ? 1'b1 : 1'b0;
assign decryption256 = (inversecipher_out256 == text && enable==1) ? 1'b1 : 1'b0;

endmodule