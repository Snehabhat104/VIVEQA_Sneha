module binary_counter_tb;

reg clk;
reg rst;
wire [3:0] count;

binary_counter dut(
    .clk(clk),
    .rst(rst),
    .count(count)
);

always #5 clk = ~clk;

initial begin
    clk = 0;
    rst = 1;

    #10 rst = 0;

    #100 $finish;
end

endmodule