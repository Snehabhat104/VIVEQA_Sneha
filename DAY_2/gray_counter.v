module gray_counter(
    input clk,
    input rst,
    output [3:0] gray
);

reg [3:0] binary;

always @(posedge clk or posedge rst)
begin
    if(rst)
        binary <= 4'b0000;
    else
        binary <= binary + 1;
end

assign gray = binary ^ (binary >> 1);

endmodule