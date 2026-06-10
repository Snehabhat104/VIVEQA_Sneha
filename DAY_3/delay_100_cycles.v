module delay_100_cycles(
    input clk,
    input a,
    output a_delay
);

reg [99:0] shift_reg;

always @(posedge clk)
begin
    shift_reg <= {shift_reg[98:0],a};
end

assign a_delay = shift_reg[99];

endmodule