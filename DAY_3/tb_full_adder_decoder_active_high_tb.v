module tb_full_adder_decoder_active_high;

reg A,B,Cin;
wire Sum,Cout;

full_adder_decoder_active_high dut(
    .A(A),
    .B(B),
    .Cin(Cin),
    .Sum(Sum),
    .Cout(Cout)
);

initial begin
    {A,B,Cin}=3'b000; #10;
    {A,B,Cin}=3'b001; #10;
    {A,B,Cin}=3'b010; #10;
    {A,B,Cin}=3'b011; #10;
    {A,B,Cin}=3'b100; #10;
    {A,B,Cin}=3'b101; #10;
    {A,B,Cin}=3'b110; #10;
    {A,B,Cin}=3'b111; #10;
    $finish;
end

endmodule