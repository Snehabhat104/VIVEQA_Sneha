module tb_sequence_detector_1011;

reg clk;
reg rst;
reg din;

wire detected;

sequence_detector_1011 dut(
    .clk(clk),
    .rst(rst),
    .din(din),
    .detected(detected)
);

always #5 clk = ~clk;

initial
begin
    clk = 0;
    rst = 1;

    #10 rst = 0;

    din=1; #10;
    din=0; #10;
    din=1; #10;
    din=1; #10;

    #20 $finish;
end

endmodule