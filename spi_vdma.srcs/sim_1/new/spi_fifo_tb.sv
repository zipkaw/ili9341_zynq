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
`define DATA_WIDTH 9

task reset_fifo(output reset);
    reset = '0;
    #10;
    reset = '1;
endtask

// read data without writing fifo (read empty fifo)
program tests(
    input [`DATA_WIDTH-1:0] data_i,
    output reg [`DATA_WIDTH-1:0] data_o,
    input empty,
    input full,
    
    output reg read,
    output reg write,
    output reg reset
);
    initial begin
        // 1;
        read <= '0;
        reset <= '1;
        #10;
        reset_fifo(reset);
        #10;
        read = '1;
        assert (empty == '1 && full == '0)
        else   $display("Wrong FIFO flags");
        assert (data_o == {`DATA_WIDTH{'0}})
        else   $display("Wrong FIFO output data");
        #10;
        // 2.
        reset <= '0;
        read <= '0;
        write <= '0;
        reset_fifo(reset);
        #10;
        write <= '1;
        data_o <= {'1, 8'had};
        #10;
        write <= '0;
        read <= '1; 
        #10;
        // 3.
        reset <= '0;
        read <= '0;
        write <= '0;
        reset_fifo(reset);
        #10;
        write <= '1;
        data_o <= {'1, 8'h11};
        #10;
        write <= '1;
        data_o <= {'1, 8'h22};
        #10;
        write <= '1;
        data_o <= {'1, 8'h33};
        #10;
        write <= '1;
        data_o <= {'1, 8'h44};
        #10;
        write <= '0;
        read <= '1;
        #20;
        read <= '0;
        #30;
        // 2.
        write <= '1;
        data_o <= {'1, 8'h55};
        #10;
        data_o <= {'1, 8'h66};
        #10;
        data_o <= {'1, 8'h88};
        #10;
        write <= '0;
        #10;
        read <= '1;
        #80;
    end
endprogram

module spi_fifo_tb();

    logic clk;
    reg [`DATA_WIDTH-1:0] data_o;
    reg [`DATA_WIDTH-1:0] data_i;
    reg read;
    reg write;
    reg full;
    reg empty;
    reg reset;
    
    initial begin 
        clk = 0;
        data_o = 0;
        data_i = 0;
        read = 0;
        write = 0;
        full = 0;
        empty = 0;
        reset = 0;
    end
    
    always begin
        #5;
        clk = ~clk;
    end

    spi_fifo #(
        .DATA_WIDTH(9),
        .DEPTH(4)
    )
    dut
    (
        .clk(clk),
        .data_o(data_o),
        .read(read),
        .data_i(data_i),
        .write(write),
        .full(full),
        .empty(empty),
        .reset(reset)
    ); 
    
    tests test(
    .data_i(data_o),
    .data_o(data_i),
    .empty(empty),
    .full(full),
    .read(read),
    .write(write),
    .reset(reset)
    );

endmodule
