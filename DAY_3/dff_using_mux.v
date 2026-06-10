module dff_using_mux(
    input clk,
    input D,
    output reg Q
);

wire mux_out;

assign mux_out = clk ? D : Q;

always @(posedge clk)
    Q <= mux_out;

endmodule