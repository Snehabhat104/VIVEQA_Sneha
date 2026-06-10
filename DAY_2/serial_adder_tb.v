module serial_adder_tb;

reg clk;
reg rst;
reg A;
reg B;

wire SUM;
wire CARRY;

serial_adder dut(
    .clk(clk),
    .rst(rst),
    .A(A),
    .B(B),
    .SUM(SUM),
    .CARRY(CARRY)
);

always #5 clk = ~clk;

initial begin

    clk = 0;
    rst = 1;

    #10 rst = 0;

    A=0; B=1; #10;
    A=1; B=1; #10;
    A=1; B=0; #10;
    A=1; B=1; #10;

    #20 $finish;
end

endmodule