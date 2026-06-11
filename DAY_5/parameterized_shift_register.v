module parameterized_shift_register #(
    parameter N = 8
)(
    input clk,
    input din,
    output dout
);

reg [N-1:0] shift_reg;

always @(posedge clk)
begin
    shift_reg <= {shift_reg[N-2:0], din};
end

assign dout = shift_reg[N-1];

endmodule