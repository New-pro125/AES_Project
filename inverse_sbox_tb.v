module inverse_sbox_tb;

reg [7:0] din;
wire [7:0] dout;

inverse_sbox my_sbox(.din(din), .dout(dout));
integer i;
initial begin
    for (i = 0; i < 256; i=i+1) begin
        din = i;
	 $display("%02X    | %02X", din, dout);
        #1; // wait for output to stabilize
    $finish;
       
    end

end

endmodule
