`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.06.2024 23:36:43
// Design Name: 
// Module Name: spi_fifo
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


module spi_fifo
#(
  parameter  DATA_WIDTH = 9, // 8 bits for a data, 1 bit for command/data select 
  parameter  DEPTH     = 16,
  localparam PTR_WITDH  = $clog2(DEPTH)
)
(
    input clk,
    
    output reg [DATA_WIDTH-1:0] data_o,
    input read,
    
    input [DATA_WIDTH-1:0] data_i,
    input write,
    
    input reg full,
    input reg empty,
    
    input reset
);
    
    logic [PTR_WITDH-1:0] wr_ptr, rd_ptr;
    logic [DATA_WIDTH-1:0] fifo_buff[DEPTH];
    integer fifo_capacity;
    
    always_ff @(posedge clk or negedge reset) begin 
        if(!reset) begin    
            wr_ptr <= '0;
            rd_ptr <= '0;
            fifo_capacity <= '0;
            data_o <= '0;
        end else begin
            if (write && !full) begin
                fifo_buff[wr_ptr] <= data_i;
                wr_ptr = wr_ptr + 1'b1;
                fifo_capacity = fifo_capacity + 1'b1;
            end
            if (read && !empty) begin
                data_o <= fifo_buff[rd_ptr];
                rd_ptr = rd_ptr + 1'b1;
                fifo_capacity = fifo_capacity - 1'b1;
            end
        end
    end
    
    always_comb begin
        if (!reset) begin
            empty <= '1;
            full <= '0;
        end
        if (fifo_capacity == '0) begin
            empty <= '1;
        end 
        else begin
            empty <= '0;
        end
        if (fifo_capacity == DEPTH) begin
            full <= '1;
        end
        else begin
            full <= '0;
        end
    end
    
endmodule
