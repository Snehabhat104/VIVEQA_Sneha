module positive_edge_detector(
    input clk,
    input a,
    output edge_detect
);

reg a_delay;

always @(posedge clk)
begin
    a_delay <= a;
end

assign edge_detect = a & ~a_delay;

endmodule