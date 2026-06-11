module tb_lfsr_4bit;

reg clk;
reg rst;

wire [3:0] q;

lfsr_4bit dut(
    .clk(clk),
    .rst(rst),
    .q(q)
);

always #5 clk = ~clk;

initial
begin
    clk = 0;
    rst = 1;

    #10 rst = 0;

    #150 $finish;
end

endmodule