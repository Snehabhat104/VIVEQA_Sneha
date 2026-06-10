module and_mux(
    input A,
    input B,
    output reg Y
);

always @(*) begin
    case({A,B})
        2'b00: Y=0;
        2'b01: Y=0;
        2'b10: Y=0;
        2'b11: Y=1;
    endcase
end

endmodule