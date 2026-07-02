## 1. Write RTL and Testbench for SR Latch using Gate Level Modelling.

`timescale 1ns / 1ps

module sr_latch(
    input S,
    input R,
    output Q,
    output Qbar
);

nor (Q, R, Qbar);
nor (Qbar, S, Q);

endmodule
Testbench (sr_latch_tb.v)
`timescale 1ns / 1ps

module sr_latch_tb;

reg S;
reg R;

wire Q;
wire Qbar;

sr_latch uut(
    .S(S),
    .R(R),
    .Q(Q),
    .Qbar(Qbar)
);

initial
begin

    $display(" S R | Q Qbar");
    $monitor(" %b %b | %b   %b", S, R, Q, Qbar);

    // Hold
    S = 0; R = 0;
    #10;

    // Set
    S = 1; R = 0;
    #10;

    // Hold
    S = 0; R = 0;
    #10;

    // Reset
    S = 0; R = 1;
    #10;

    // Hold
    S = 0; R = 0;
    #10;

    // Invalid State
    S = 1; R = 1;
    #10;

    // Return to Hold
    S = 0; R = 0;
    #10;

    $finish;

end

endmodule
Expected Output
S	R	Q	Q̅	Operation
0	0	Previous	Previous	Hold
1	0	1	0	Set
0	0	1	0	Hold
0	1	0	1	Reset
0	0	0	1	Hold
1	1	0	0	Invalid
0	0	Undefined	Undefined	Not Recommended

---


## 2. Write RTL and Testbench for JK Flip-Flop using Parameter Declaration for HOLD, RESET, SET, and TOGGLE.

`timescale 1ns / 1ps

module jk_ff(
    input clk,
    input J,
    input K,
    output reg Q
);

parameter HOLD   = 2'b00;
parameter RESET  = 2'b01;
parameter SET    = 2'b10;
parameter TOGGLE = 2'b11;

always @(posedge clk)
begin
    case({J,K})

        HOLD:   Q <= Q;
        RESET:  Q <= 1'b0;
        SET:    Q <= 1'b1;
        TOGGLE: Q <= ~Q;

    endcase
end

endmodule
Testbench (jk_ff_tb.v)
`timescale 1ns / 1ps

module jk_ff_tb;

reg clk;
reg J;
reg K;

wire Q;

jk_ff uut(
    .clk(clk),
    .J(J),
    .K(K),
    .Q(Q)
);

always #5 clk = ~clk;

initial
begin

    clk = 0;

    // Hold
    J = 0; K = 0;
    #10;

    // Reset
    J = 0; K = 1;
    #10;

    // Set
    J = 1; K = 0;
    #10;

    // Toggle
    J = 1; K = 1;
    #20;

    $finish;

end

endmodule

---


## 3. Write RTL and Testbench for a T Flip-Flop using D Flip-Flop.
RTL Code (d_ff.v)
`timescale 1ns / 1ps

module d_ff(
    input clk,
    input D,
    output reg Q
);

always @(posedge clk)
begin
    Q <= D;
end

endmodule
RTL Code (t_ff.v)
`timescale 1ns / 1ps

module t_ff(
    input clk,
    input T,
    output Q
);

wire d;
wire q_int;

assign d = T ^ q_int;

d_ff DFF(
    .clk(clk),
    .D(d),
    .Q(q_int)
);

assign Q = q_int;

endmodule
Testbench (t_ff_tb.v)
`timescale 1ns / 1ps

module t_ff_tb;

reg clk;
reg T;

wire Q;

t_ff uut(
    .clk(clk),
    .T(T),
    .Q(Q)
);

always #5 clk = ~clk;

initial
begin

    clk = 0;

    // Hold
    T = 0;
    #20;

    // Toggle
    T = 1;
    #40;

    // Hold
    T = 0;
    #20;

    $finish;

end

endmodule

---

## 4. Write RTL and Testbench for a 4-bit Synchronous Loadable Binary Up Counter.

`timescale 1ns / 1ps

module sync_up_counter(
    input clk,
    input reset,
    input load,
    input [3:0] data,
    output reg [3:0] count
);

always @(posedge clk)
begin
    if(reset)
        count <= 4'b0000;
    else if(load)
        count <= data;
    else
        count <= count + 1;
end

endmodule

Testbench 
`timescale 1ns / 1ps

module sync_up_counter_tb;

reg clk;
reg reset;
reg load;
reg [3:0] data;
wire [3:0] count;

sync_up_counter uut(
    .clk(clk),
    .reset(reset),
    .load(load),
    .data(data),
    .count(count)
);

always #5 clk = ~clk;

initial
begin

    clk = 0;
    reset = 1;
    load = 0;
    data = 4'b0000;

    #10 reset = 0;

    // Counter starts counting
    #40;

    // Load value 9
    load = 1;
    data = 4'b1001;
    #10;

    load = 0;

    // Continue counting
    #40;

    // Reset counter
    reset = 1;
    #10;

    reset = 0;
    #20;

    $finish;

end

initial
$monitor("Time=%0t Reset=%b Load=%b Data=%d Count=%d",
          $time, reset, load, data, count);

endmodule

---


## 5. Write RTL and Testbench for a 4-bit MOD-12 Loadable Binary Synchronous Up Counter.

`timescale 1ns / 1ps

module mod12_counter(
    input clk,
    input reset,
    input load,
    input [3:0] data,
    output reg [3:0] count
);

always @(posedge clk)
begin
    if(reset)
        count <= 4'd0;

    else if(load)
        count <= data;

    else if(count == 4'd11)
        count <= 4'd0;

    else
        count <= count + 1;

end

endmodule

Testbench 
`timescale 1ns / 1ps

module mod12_counter_tb;

reg clk;
reg reset;
reg load;
reg [3:0] data;

wire [3:0] count;

mod12_counter uut(
    .clk(clk),
    .reset(reset),
    .load(load),
    .data(data),
    .count(count)
);

always #5 clk = ~clk;

initial
begin

    clk = 0;
    reset = 1;
    load = 0;
    data = 4'd0;

    #10 reset = 0;

    // Count for some time
    #130;

    // Load value 8
    load = 1;
    data = 4'd8;
    #10;

    load = 0;

    #60;

    $finish;

end

initial
$monitor("Time=%0t Count=%d", $time, count);

endmodule

---


## 6. Write RTL and Testbench for a 4-bit Loadable Binary Synchronous Up-Down Counter.

`timescale 1ns / 1ps

module updown_counter(
    input clk,
    input reset,
    input load,
    input up_down,
    input [3:0] data,
    output reg [3:0] count
);

always @(posedge clk)
begin

    if(reset)
        count <= 4'b0000;

    else if(load)
        count <= data;

    else if(up_down)
        count <= count + 1;

    else
        count <= count - 1;

end

endmodule

Testbench 
`timescale 1ns / 1ps

module updown_counter_tb;

reg clk;
reg reset;
reg load;
reg up_down;
reg [3:0] data;

wire [3:0] count;

updown_counter uut(
    .clk(clk),
    .reset(reset),
    .load(load),
    .up_down(up_down),
    .data(data),
    .count(count)
);

always #5 clk = ~clk;

initial
begin

    clk = 0;
    reset = 1;
    load = 0;
    up_down = 1;
    data = 4'd0;

    #10 reset = 0;

    // Count Up
    #50;

    // Load Value
    load = 1;
    data = 4'd10;
    #10;

    load = 0;

    // Count Down
    up_down = 0;
    #60;

    $finish;

end

initial
$monitor("Time=%0t UpDown=%b Count=%d",
          $time, up_down, count);

endmodule
