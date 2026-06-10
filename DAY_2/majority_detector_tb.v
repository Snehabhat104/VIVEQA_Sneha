module majority_detector_tb;

reg A;
reg B;
reg C;
wire Y;

majority_detector dut(
    .A(A),
    .B(B),
    .C(C),
    .Y(Y)
);

initial begin

    {A,B,C}=3'b000; #10;
    {A,B,C}=3'b001; #10;
    {A,B,C}=3'b010; #10;
    {A,B,C}=3'b011; #10;
    {A,B,C}=3'b100; #10;
    {A,B,C}=3'b101; #10;
    {A,B,C}=3'b110; #10;
    {A,B,C}=3'b111; #10;

    $finish;
end

endmodule