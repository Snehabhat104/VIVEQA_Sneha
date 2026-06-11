module sequence_detector_1011(
    input clk,
    input rst,
    input din,
    output reg detected
);

reg [2:0] state;

parameter S0=0,
          S1=1,
          S2=2,
          S3=3,
          S4=4;

always @(posedge clk or posedge rst)
begin
    if(rst)
    begin
        state <= S0;
        detected <= 0;
    end
    else
    begin
        detected <= 0;

        case(state)

        S0: state <= din ? S1 : S0;

        S1: state <= din ? S1 : S2;

        S2: state <= din ? S3 : S0;

        S3:
        begin
            if(din)
            begin
                state <= S4;
                detected <= 1;
            end
            else
                state <= S2;
        end

        S4:
            state <= din ? S1 : S2;

        endcase
    end
end

endmodule