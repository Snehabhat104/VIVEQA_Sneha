module delay_3_cycles(
    input clk,
    input a,
    output a_delay
);

reg [2:0] shift_reg;

always @(posedge clk)
begin
    shift_reg <= {shift_reg[1:0],a};
end

assign a_delay = shift_reg[2];

endmodule