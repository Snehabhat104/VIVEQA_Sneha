`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/24/2026 10:59:16 PM
// Design Name: 
// Module Name: ultrasonic_sensor
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ultrasonic_sensor(
    input clk,
    input rst,

    output reg trig,
    input echo,

    output reg [15:0] distance_cm
);

reg [23:0] cnt = 0;

reg [15:0] trig_cnt = 0;

reg echo_prev = 0;

reg [31:0] echo_count = 0;
reg [31:0] echo_width = 0;

reg [31:0] timeout = 0;

always @(posedge clk) begin

    if(rst) begin
        trig <= 0;
        cnt <= 0;
        trig_cnt <= 0;
    end
    else begin

        if(cnt == 1440000) begin
            cnt <= 0;
            trig_cnt <= 240;
        end
        else begin
            cnt <= cnt + 1;
        end

        if(trig_cnt != 0) begin
            trig <= 1;
            trig_cnt <= trig_cnt - 1;
        end
        else begin
            trig <= 0;
        end
    end
end

always @(posedge clk) begin

    echo_prev <= echo;

    if(!echo_prev && echo)
        echo_count <= 0;

    else if(echo)
        echo_count <= echo_count + 1;

    else if(echo_prev && !echo) begin

        echo_width <= echo_count;

        distance_cm <= echo_count / 1392;
    end
end

endmodule
