module tb_negative_edge_detector;

reg clk;
reg a;
wire edge_detect;

negative_edge_detector dut(
    .clk(clk),
    .a(a),
    .edge_detect(edge_detect)
);

always #5 clk = ~clk;

initial
begin
    clk = 0;
    a = 1;

    #15 a = 0;
    #20 a = 1;
    #20 a = 0;

    #30 $finish;
end

endmodule