module signal_delay #(
    parameter N = 3
)(
    input wire clk,
    input wire a,
    output wire a_delay
);

reg [N-1:0] shift_reg;

always @(posedge clk)
begin
    shift_reg <= {shift_reg[N-2:0], a};
end

assign a_delay = shift_reg[N-1];

endmodule