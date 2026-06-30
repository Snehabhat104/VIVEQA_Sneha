`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/24/2026 11:01:22 PM
// Design Name: 
// Module Name: radar_uart
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


module radar_uart(
    input clk,
    input rst,

    input [7:0] angle,
    input [15:0] distance,

    output tx
);

wire busy;
reg start = 0;
reg [7:0] tx_data;

uart_tx UTX(
    .clk(clk),
    .rst(rst),
    .data_in(tx_data),
    .start(start),
    .tx(tx),
    .busy(busy)
);

//--------------------------------------------------
// Convert numbers to ASCII
//--------------------------------------------------

wire [7:0] a_h = (angle / 100) + 8'd48;
wire [7:0] a_t = ((angle % 100) / 10) + 8'd48;
wire [7:0] a_o = (angle % 10) + 8'd48;

wire [15:0] dist = (distance > 30) ? 30 : distance;

wire [7:0] d_h = (dist / 100) + 8'd48;
wire [7:0] d_t = ((dist % 100) / 10) + 8'd48;
wire [7:0] d_o = (dist % 10) + 8'd48;

//--------------------------------------------------
// 20 ms delay between packets
//--------------------------------------------------

reg [19:0] delay_cnt = 0;
reg send_enable = 0;

always @(posedge clk) begin
    if(rst) begin
        delay_cnt <= 0;
        send_enable <= 0;
    end
    else begin
        if(delay_cnt == 480000-1) begin   // 20ms @24MHz
            delay_cnt <= 0;
            send_enable <= 1;
        end
        else begin
            delay_cnt <= delay_cnt + 1;
            send_enable <= 0;
        end
    end
end

//--------------------------------------------------
// UART State Machine
//--------------------------------------------------

reg [3:0] state = 0;

always @(posedge clk) begin

    start <= 0;

    if(!busy && send_enable) begin

        case(state)

        0: begin
            tx_data <= a_h;
            start <= 1;
            state <= 1;
        end

        1: begin
            tx_data <= a_t;
            start <= 1;
            state <= 2;
        end

        2: begin
            tx_data <= a_o;
            start <= 1;
            state <= 3;
        end

        3: begin
            tx_data <= ",";
            start <= 1;
            state <= 4;
        end

        4: begin
            tx_data <= d_h;
            start <= 1;
            state <= 5;
        end

        5: begin
            tx_data <= d_t;
            start <= 1;
            state <= 6;
        end

        6: begin
            tx_data <= d_o;
            start <= 1;
            state <= 7;
        end

        7: begin
            tx_data <= 8'h0D;      // Carriage Return
            start <= 1;
            state <= 8;
        end

        8: begin
            tx_data <= 8'h0A;      // Line Feed
            start <= 1;
            state <= 0;
        end

        default: state <= 0;

        endcase

    end
end

endmodule

