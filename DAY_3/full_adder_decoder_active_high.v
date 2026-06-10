module full_adder_decoder_active_high(
    input A,
    input B,
    input Cin,
    output Sum,
    output Cout
);

wire [7:0] Y;

assign Y[0] = ~A & ~B & ~Cin;
assign Y[1] = ~A & ~B &  Cin;
assign Y[2] = ~A &  B & ~Cin;
assign Y[3] = ~A &  B &  Cin;
assign Y[4] =  A & ~B & ~Cin;
assign Y[5] =  A & ~B &  Cin;
assign Y[6] =  A &  B & ~Cin;
assign Y[7] =  A &  B &  Cin;

assign Sum  = Y[1] | Y[2] | Y[4] | Y[7];
assign Cout = Y[3] | Y[5] | Y[6] | Y[7];

endmodule