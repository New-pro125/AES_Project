module inverse_mixcolumns_tb;
 reg clk;
 reg reset;
wire out;
reg [127:0] state_in;
wire [127:0] state_out;

initial begin
clk=1;
reset=0;
    state_in = 128'h4f63760643e0aa85efa7213201a4e705;
   #10  $display("Input state:  %h", state_in);
    #10 $display("Output state: %h", state_out);
end
always
#5 clk=~clk;
inverse_Mixcolumns dut(
    .in(state_in),
    .out(state_out)
);

endmodule