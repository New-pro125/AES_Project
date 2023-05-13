
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