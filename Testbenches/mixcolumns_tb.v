module mixcolumns_tb;
wire out;
reg [127:0] state_in;
wire [127:0] state_out;

initial begin

    state_in = 128'h6353e08c0960e104cd70b751bacad0e7;
    #10 $display("Input state:  %h", state_in);
    #10 $display("Output state: %h", state_out);
end
Mixcolumns dut(
    .in(state_in),
    .out(state_out)
);

endmodule