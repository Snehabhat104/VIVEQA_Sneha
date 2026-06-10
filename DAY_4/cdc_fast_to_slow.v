module cdc_fast_to_slow(
    input slow_clk,
    input signal_fast,
    output reg signal_slow
);

reg sync1;

always @(posedge slow_clk)
begin
    sync1       <= signal_fast;
    signal_slow <= sync1;
end

endmodule