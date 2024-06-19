`timescale 1ns / 1ps

module spi_wrapper(
        clk,
        miso,
        mosi,
        scl,
        csx,
        dcx,
        wr,
        data_i,
        rd,
        data_o,
        fifo_full,
        fifo_empty,
        reset
    );
    input                               clk;
    input                               miso;
    output                              mosi; // not used right now
    output                              scl;
    output                              csx; // chip select 10th bit of packet
    output                              dcx; // data command selector 9th bit of packet
    input                               wr;
    input [DATA_WIDTH-1:0]              data_i;
    input                               rd; // not used right now
    output [DATA_WIDTH-1:0]             data_o; // not used right now
    output                              fifo_full;
    output                              fifo_empty;
    input                               reset;

    parameter DATA_WIDTH = 9;

    spi #(.DATA_WIDTH(DATA_WIDTH))spi_wrapped(
            .clk(clk),
            .miso(miso),
            .mosi(mosi),
            .scl(scl),
            .csx(csx),
            .dcx(dcx),
            .wr(wr),
            .data_i(data_i),
            .rd(rd),
            .data_o(data_o),
            .fifo_full(fifo_full),
            .fifo_empty(fifo_empty),
            .reset(reset)
        );
endmodule
