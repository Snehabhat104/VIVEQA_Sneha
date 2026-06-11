module tb_parameterized_shift_register;

reg clk;
reg din;

wire dout4;
wire dout8;

parameterized_shift_register #(.N(4)) DUT1 (
    .clk(clk),
    .din(din),
    .dout(dout4)
);

parameterized_shift_register #(.N(8)) DUT2 (
    .clk(clk),
    .din(din),
    .dout(dout8)
);

always #5 clk = ~clk;

initial
begin
    clk = 0;
    din = 0;

    #12 din = 1;
    #20 din = 0;
    #20 din = 1;

    #100 $finish;
end

endmodule