`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/24/2026 05:48:30 PM
// Design Name: 
// Module Name: uart_tx
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


module uart_tx(
    input wire clk,
    input wire rst,

    input wire [7:0] data_in,
    input wire start,

    output reg tx,
    output reg busy
);

    parameter CLK_FREQ = 24000000;
    parameter BAUD     = 115200;

    localparam BAUD_DIV = CLK_FREQ / BAUD; // 208

    reg [15:0] baud_cnt = 0;
    reg [3:0] bit_cnt = 0;
    reg [9:0] shift_reg = 10'h3FF;

    initial begin
        tx   = 1'b1;
        busy = 1'b0;
    end

    always @(posedge clk) begin

        if(rst) begin
            tx        <= 1'b1;
            busy      <= 1'b0;
            baud_cnt  <= 0;
            bit_cnt   <= 0;
            shift_reg <= 10'h3FF;
        end

        else begin

            if(!busy) begin

                tx <= 1'b1;

                if(start) begin
                    busy <= 1'b1;

                    shift_reg <= {
                        1'b1,
                        data_in,
                        1'b0
                    };

                    bit_cnt  <= 0;
                    baud_cnt <= 0;
                end
            end

            else begin

                if(baud_cnt == BAUD_DIV-1) begin

                    baud_cnt <= 0;

                    tx <= shift_reg[0];

                    shift_reg <= {
                        1'b1,
                        shift_reg[9:1]
                    };

                    bit_cnt <= bit_cnt + 1;

                    if(bit_cnt == 9) begin
                        busy <= 1'b0;
                        tx   <= 1'b1;
                    end

                end
                else begin
                    baud_cnt <= baud_cnt + 1;
                end
            end
        end
    end

endmodule