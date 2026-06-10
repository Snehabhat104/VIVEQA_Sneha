module serial_adder(
    input clk,
    input rst,
    input A,
    input B,
    output reg SUM,
    output reg CARRY
);

always @(posedge clk or posedge rst)
begin
    if(rst)
    begin
        SUM   <= 0;
        CARRY <= 0;
    end
    else
    begin
        SUM   <= A ^ B ^ CARRY;
        CARRY <= (A & B) | (A & CARRY) | (B & CARRY);
    end
end

endmodule