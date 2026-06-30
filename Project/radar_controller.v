`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/24/2026 11:00:01 PM
// Design Name: 
// Module Name: radar_controller
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


module radar_controller(
    input clk,
    input rst,

    input [7:0] angle,
    input [15:0] distance,

    output reg [7:0] tx_angle,
    output reg [15:0] tx_distance
);

always @(posedge clk) begin

    if(rst) begin
        tx_angle <= 0;
        tx_distance <= 0;
    end
    else begin
        tx_angle <= angle;
        tx_distance <= distance;
    end

end

endmodule
