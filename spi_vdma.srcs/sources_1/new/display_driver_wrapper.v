`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 20.06.2024 00:20:58
// Design Name:
// Module Name: display_driver_wrapper
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


module display_driver_wrapper(
        axis_display_pixel,
        axis_display_valid,
        axis_display_clk_i,
        display_axis_ready,
        display_axis_frame_ready,
        spi_display_tx_fifo_empty,
        spi_display_tx_fifo_full,
        display_spi_write,
        display_spi_data,
        reset
    );
    input [23:0] axis_display_pixel;
    input        axis_display_valid;
    input        axis_display_clk_i;
    output       display_axis_ready;
    output       display_axis_frame_ready;
    input        spi_display_tx_fifo_empty;
    input        spi_display_tx_fifo_full;
    output       display_spi_write;
    output [8:0] display_spi_data;
    input        reset;

    display_driver display_driver_wrapped (
                       .axis_display_pixel(axis_display_pixel),
                       .axis_display_valid(axis_display_valid),
                       .axis_display_clk_i(axis_display_clk_i),
                       .display_axis_ready(display_axis_ready),
                       .display_axis_frame_ready(display_axis_frame_ready),
                       .spi_display_tx_fifo_empty(spi_display_tx_fifo_empty),
                       .spi_display_tx_fifo_full(spi_display_tx_fifo_full),
                       .display_spi_write(display_spi_write),
                       .display_spi_data(display_spi_data),
                       .reset(reset)
                   );

endmodule
