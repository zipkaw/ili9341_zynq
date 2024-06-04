`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.06.2024 14:49:31
// Design Name: 
// Module Name: spi_fifo_tb
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


module spi_fifo_tb();

    logic clk; 
    
    always begin
        clk = ~clk;
        #5;
    end

    reg data_o
    reg read
    reg data_i
    reg write
    reg full
    reg empty
    reg reset

    spi_fifo dut
    #(
        .DATA_WIDTH(9),
        .DEPTH(4),
    )
    (
        .clk,
        .data_o,
        .read,
        .data_i,
        .write,
        .full,
        .empty,
        .reset
    ); 
    
    // read data without writing
    
    
    // write byte
    // read byte
    
    // write n bytes
    // read m bytes
    // write size - n + m bytes, expct full
    // read all bytex expect empty
     
endmodule
