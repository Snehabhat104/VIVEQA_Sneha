module tb_signal_delay;

reg clk;
reg a;
wire a_delay;

signal_delay #(.N(3)) dut (
    .clk(clk),
    .a(a),
    .a_delay(a_delay)
);

always #5 clk = ~clk;

initial
begin
    clk = 0;
    a = 0;

    #12 a = 1;
    #20 a = 0;
    #30 a = 1;

    #50 $finish;
end

endmodule