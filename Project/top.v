`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/24/2026 11:02:24 PM
// Design Name: 
// Module Name: top
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


module top(

    input clk_24mhz,

    output servo_pwm,
    output trig,
    input echo,

    output uart_tx,

    output reg [7:0] led

);

wire [7:0] angle;
wire [15:0] distance;

wire [7:0] tx_angle;
wire [15:0] tx_distance;

assign echo_led = echo;

reg [7:0] led_reg;

assign leds = led_reg;

always @(*) begin

    if(distance > 30)
        led = 8'b00000000;

    else if(distance > 26)
        led = 8'b00000001;

    else if(distance > 22)
        led = 8'b00000011;

    else if(distance > 18)
        led = 8'b00000111;

    else if(distance > 14)
        led = 8'b00001111;

    else if(distance > 10)
        led = 8'b00011111;

    else if(distance > 6)
        led = 8'b00111111;

    else if(distance > 3)
        led = 8'b01111111;

    else
        led = 8'b11111111;

end

servo_controller SERVO(
    .clk(clk_24mhz),
    .rst(1'b0),
    .pwm(servo_pwm),
    .angle(angle)
);

ultrasonic_sensor SONAR(
    .clk(clk_24mhz),
    .rst(1'b0),
    .trig(trig),
    .echo(echo),
    .distance_cm(distance)
);

radar_controller CTRL(
    .clk(clk_24mhz),
    .rst(1'b0),
    .angle(angle),
    .distance(distance),
    .tx_angle(tx_angle),
    .tx_distance(tx_distance)
);

radar_uart UART(
    .clk(clk_24mhz),
    .rst(1'b0),
    .angle(tx_angle),
    .distance(tx_distance),
    .tx(uart_tx)
);

endmodule