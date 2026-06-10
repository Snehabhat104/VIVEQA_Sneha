module parallel_adder_tb;

reg [3:0] A;
reg [3:0] B;

wire [3:0] SUM;
wire COUT;

parallel_adder dut(
    .A(A),
    .B(B),
    .SUM(SUM),
    .COUT(COUT)
);

initial begin

    A=4'd3; B=4'd2; #10;
    A=4'd7; B=4'd5; #10;
    A=4'd15; B=4'd1; #10;

    $finish;
end

endmodule