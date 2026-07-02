## 1. Write RTL for 1-bit Full Adder using Dataflow abstraction and verify the same using a Testbench.

`timescale 1ns / 1ps

module full_adder(
    input A,
    input B,
    input Cin,
    output Sum,
    output Cout
);

assign Sum = A ^ B ^ Cin;
assign Cout = (A & B) | (B & Cin) | (A & Cin);

endmodule

Testbench
`timescale 1ns / 1ps

module full_adder_tb;

reg A, B, Cin;
wire Sum, Cout;

full_adder uut(
    .A(A),
    .B(B),
    .Cin(Cin),
    .Sum(Sum),
    .Cout(Cout)
);

initial begin
    $monitor("A=%b B=%b Cin=%b Sum=%b Cout=%b", A, B, Cin, Sum, Cout);

    A=0; B=0; Cin=0; #10;
    A=0; B=0; Cin=1; #10;
    A=0; B=1; Cin=0; #10;
    A=0; B=1; Cin=1; #10;
    A=1; B=0; Cin=0; #10;
    A=1; B=0; Cin=1; #10;
    A=1; B=1; Cin=0; #10;
    A=1; B=1; Cin=1; #10;

    $finish;
end

endmodule

---


## 2. Write RTL for 2×4 Decoder using Dataflow abstraction and verify the same using a Testbench.

`timescale 1ns / 1ps

module decoder2x4(
    input A,
    input B,
    output [3:0] Y
);

assign Y[0] = ~A & ~B;
assign Y[1] = ~A & B;
assign Y[2] = A & ~B;
assign Y[3] = A & B;

endmodule
Testbench (decoder2x4_tb.v)
`timescale 1ns / 1ps

module decoder2x4_tb;

reg A, B;
wire [3:0] Y;

decoder2x4 uut(
    .A(A),
    .B(B),
    .Y(Y)
);

initial begin

    $monitor("A=%b B=%b Y=%b", A, B, Y);

    A=0; B=0; #10;
    A=0; B=1; #10;
    A=1; B=0; #10;
    A=1; B=1; #10;

    $finish;

end

endmodule

---


## 3. Write RTL for 8×3 Priority Encoder using Structural Model and verify the same using a Testbench.

`timescale 1ns / 1ps

module priority_encoder8x3(
    input [7:0] D,
    output Y2,
    output Y1,
    output Y0
);

or(Y2, D[4], D[5], D[6], D[7]);

or(Y1, D[2], D[3], D[6], D[7]);

wire w1, w2;
or(w1, D[1], D[3]);
or(w2, D[5], D[7]);
or(Y0, w1, w2);

endmodule
Testbench (priority_encoder8x3_tb.v)
`timescale 1ns / 1ps

module priority_encoder8x3_tb;

reg [7:0] D;
wire Y2, Y1, Y0;

priority_encoder8x3 uut(
    .D(D),
    .Y2(Y2),
    .Y1(Y1),
    .Y0(Y0)
);

initial begin

    $monitor("D=%b Output=%b%b%b", D, Y2, Y1, Y0);

    D=8'b00000001; #10;
    D=8'b00000010; #10;
    D=8'b00000100; #10;
    D=8'b00001000; #10;
    D=8'b00010000; #10;
    D=8'b00100000; #10;
    D=8'b01000000; #10;
    D=8'b10000000; #10;

    $finish;

end

endmodule

---

## 4. Write RTL for 4-bit Ripple Carry Adder using 1-bit Full Adder and verify the same using a Testbench.

`timescale 1ns / 1ps

module full_adder(
    input A,
    input B,
    input Cin,
    output Sum,
    output Cout
);

assign Sum = A ^ B ^ Cin;
assign Cout = (A & B) | (B & Cin) | (A & Cin);

endmodule
RTL Code (ripple_carry_adder.v)
`timescale 1ns / 1ps

module ripple_carry_adder(
    input [3:0] A,
    input [3:0] B,
    input Cin,
    output [3:0] Sum,
    output Cout
);

wire C1, C2, C3;

full_adder FA0(A[0], B[0], Cin, Sum[0], C1);
full_adder FA1(A[1], B[1], C1, Sum[1], C2);
full_adder FA2(A[2], B[2], C2, Sum[2], C3);
full_adder FA3(A[3], B[3], C3, Sum[3], Cout);

endmodule
Testbench (ripple_carry_adder_tb.v)
`timescale 1ns / 1ps

module ripple_carry_adder_tb;

reg [3:0] A;
reg [3:0] B;
reg Cin;

wire [3:0] Sum;
wire Cout;

ripple_carry_adder uut(
    .A(A),
    .B(B),
    .Cin(Cin),
    .Sum(Sum),
    .Cout(Cout)
);

initial begin

    $monitor("A=%d B=%d Cin=%b Sum=%d Cout=%b",
              A, B, Cin, Sum, Cout);

    A=4'd3; B=4'd2; Cin=0; #10;
    A=4'd5; B=4'd6; Cin=0; #10;
    A=4'd8; B=4'd7; Cin=0; #10;
    A=4'd9; B=4'd9; Cin=0; #10;
    A=4'd15; B=4'd1; Cin=0; #10;

    $finish;

end

endmodule

---

## 5. Write RTL for 4:1 MUX using 2:1 MUXes and verify the same using a Testbench.

`timescale 1ns / 1ps

module mux2x1(
    input I0,
    input I1,
    input S,
    output Y
);

assign Y = S ? I1 : I0;

endmodule
RTL Code (mux4x1.v)
`timescale 1ns / 1ps

module mux4x1(
    input I0,
    input I1,
    input I2,
    input I3,
    input [1:0] S,
    output Y
);

wire w1, w2;

mux2x1 M1(I0, I1, S[0], w1);
mux2x1 M2(I2, I3, S[0], w2);
mux2x1 M3(w1, w2, S[1], Y);

endmodule
Testbench (mux4x1_tb.v)
`timescale 1ns / 1ps

module mux4x1_tb;

reg I0, I1, I2, I3;
reg [1:0] S;
wire Y;

mux4x1 uut(
    .I0(I0),
    .I1(I1),
    .I2(I2),
    .I3(I3),
    .S(S),
    .Y(Y)
);

initial begin

    I0=0; I1=1; I2=0; I3=1;

    S=2'b00; #10;
    S=2'b01; #10;
    S=2'b10; #10;
    S=2'b11; #10;

    $finish;

end

initial
$monitor("S=%b Y=%b", S, Y);

endmodule

---


## 6. Write RTL Description and Testbench for 3:8 Decoder.

`timescale 1ns / 1ps

module decoder3x8(
    input [2:0] A,
    output [7:0] Y
);

assign Y[0] = (~A[2]) & (~A[1]) & (~A[0]);
assign Y[1] = (~A[2]) & (~A[1]) & ( A[0]);
assign Y[2] = (~A[2]) & ( A[1]) & (~A[0]);
assign Y[3] = (~A[2]) & ( A[1]) & ( A[0]);
assign Y[4] = ( A[2]) & (~A[1]) & (~A[0]);
assign Y[5] = ( A[2]) & (~A[1]) & ( A[0]);
assign Y[6] = ( A[2]) & ( A[1]) & (~A[0]);
assign Y[7] = ( A[2]) & ( A[1]) & ( A[0]);

endmodule

Testbench
`timescale 1ns / 1ps

module decoder3x8_tb;

reg [2:0] A;
wire [7:0] Y;

decoder3x8 uut(
    .A(A),
    .Y(Y)
);

initial begin

    A=3'b000; #10;
    A=3'b001; #10;
    A=3'b010; #10;
    A=3'b011; #10;
    A=3'b100; #10;
    A=3'b101; #10;
    A=3'b110; #10;
    A=3'b111; #10;

    $finish;

end

initial
$monitor("A=%b Y=%b", A, Y);

endmodule

---


## 7. Write RTL Description and Testbench for 8:3 Priority Encoder.

`timescale 1ns / 1ps

module priority_encoder(
    input [7:0] D,
    output reg [2:0] Y
);

always @(*) begin

    casex(D)

        8'b1xxxxxxx : Y = 3'b111;
        8'b01xxxxxx : Y = 3'b110;
        8'b001xxxxx : Y = 3'b101;
        8'b0001xxxx : Y = 3'b100;
        8'b00001xxx : Y = 3'b011;
        8'b000001xx : Y = 3'b010;
        8'b0000001x : Y = 3'b001;
        8'b00000001 : Y = 3'b000;

        default : Y = 3'b000;

    endcase

end

endmodule
Testbench (priority_encoder_tb.v)
`timescale 1ns / 1ps

module priority_encoder_tb;

reg [7:0] D;
wire [2:0] Y;

priority_encoder uut(
    .D(D),
    .Y(Y)
);

initial begin

    D = 8'b00000001; #10;
    D = 8'b00000010; #10;
    D = 8'b00000100; #10;
    D = 8'b00001000; #10;
    D = 8'b00010000; #10;
    D = 8'b00100000; #10;
    D = 8'b01000000; #10;
    D = 8'b10000000; #10;

    // Priority Check
    D = 8'b10101010; #10;
    D = 8'b01011000; #10;

    $finish;

end

initial
$monitor("D=%b Y=%b", D, Y);

endmodule
