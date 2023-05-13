module sbox_tb;

reg [7:0] din;
wire [7:0] dout;

sbox my_sbox(.din(din), .dout(dout));
integer i;
initial begin
   
    for (i = 0; i < 256; i=i+1) begin
        din = i;
        #1; // wait for output to stabilize
        $display("%02X    | %02X", din, dout);

    end

    $finish;
end

endmodule
