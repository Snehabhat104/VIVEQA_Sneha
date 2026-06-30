`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/24/2026 10:58:22 PM
// Design Name: 
// Module Name: servo_controller
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


module servo_controller(
    input clk,
    input rst,

    output reg pwm,
    output reg [7:0] angle
);

parameter CLK_FREQ = 24000000;

reg [18:0] cnt = 0;
reg [18:0] pulse_width;

reg dir = 0;

always @(posedge clk) begin

    if(rst) begin
        cnt <= 0;
        angle <= 0;
        dir <= 0;
    end
    else begin

        if(cnt == 479999)
            cnt <= 0;
        else
            cnt <= cnt + 1;

        if(cnt == 0) begin

            if(!dir) begin
                if(angle < 180)
                    angle <= angle + 1;
                else
                    dir <= 1;
            end
            else begin
                if(angle > 0)
                    angle <= angle - 1;
                else
                    dir <= 0;
            end
        end
    end
end

always @(*) begin
    pulse_width = 12000 + (angle * 48000) / 180;
end

always @(posedge clk) begin
    pwm <= (cnt < pulse_width);
end

endmodule
