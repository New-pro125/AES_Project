module subbyte_tb;
reg [127:0] data;
wire [127:0] dataout;
initial
begin
    $monitor("input= %h ,output= %h",data,dataout);
    data=128'h19a09ae93df4c6f8e3e28d48be2b2a08;
    
 #5   data=128'ha4686b029c9f5b6a7f35ea50f22b4349;
 #5 $finish;
end
subbyte a(.state(data),.outstate(dataout));
endmodule