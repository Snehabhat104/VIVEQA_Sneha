module or_mux(
    input A,
    input B,
    output reg Y
);

always @(*) begin
    case({A,B})
        2'b00: Y=0;
        default: Y=1;
    endcase
end

endmodule