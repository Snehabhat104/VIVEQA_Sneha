module cdc_slow_to_fast(
    input fast_clk,
    input signal_slow,
    output reg signal_fast
);

reg sync1;

always @(posedge fast_clk)
begin
    sync1       <= signal_slow;
    signal_fast <= sync1;
end

endmodule