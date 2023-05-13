module SPI(input Miso,input MOSI ,input data_in,output reg [127:0] data_out,input clk);
reg [127:0] slave_in;
wire [127:0] slave_out;
reg [127:0] out;
reg bit_in;
reg bit_out;
integer i;
initial
begin
slave_in<=128'h0;
slave_out<=128'h0;
data_out<=128'h0;
i=127;
end
always @ (posedge clk)
begin
       if(Miso==1)
        bit_in<=data_in;
        else if(Miso==0)
        bit_in<=bit_in;
    if(MOSI==1&&i<0)
    begin
        bit_out<=slave_out[i];
        i=i-1;
    end
    else if (MOSI==0)
    begin
        bit_out<=bit_out;
    end

end
always @(negedge clk)
begin
    if(Miso==1)
        slave_in<={slave_in[126:0],bit_in};
     else if(Miso==0)
    slave_in<=slave_in;
    if(MOSI==1)
    begin
        data_out<={data_out[126:0],bit_out}
    end
    else if (MOSI==0)
    begin
        data_out<=data_out;
    end
end
always @(MOSI,Miso) begin
    if(Miso==0&&MOSI==0)
    begin
        SPISlave u (slave_in,slave_out);
    end
end

endmodule