//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.05.2024 11:30:32
// Design Name: 
// Module Name: spi
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

typedef enum {IDLE, PRE_WRITE, WRITE} spi_write_states_t;

module spi
#(
    localparam DATA_WIDTH = 10,
    localparam CSX_OFFSET = DATA_WIDTH - 2,
    localparam DCX_OFFSET = DATA_WIDTH - 1,
    localparam PAYLOAD_OFFSET = 0
)
(
    input      clk,
    
    input      miso,
    output reg mosi,
    output reg scl,
    output reg csx, // chip select 10th bit of packet
    output reg dcx, // data command selector 9th bit of packet
    
    input      wr,
    input      [DATA_WIDTH-1:0] data_i,
    
    input      rd,
    output     [DATA_WIDTH-1:0] data_o,
    
    input      reset
);

    logic scl_enable, read, empty; 
    spi_write_states_t w_state, w_next_state;
    
    logic transaction_ready;
    logic [7:0] transmitted_byte_idx;
    
    logic [DATA_WIDTH - 1:0] tx_fifo_data_o;
    
    scl_generator scl_gen(
        .clk(clk),
        .reset(reset),
        .enable(scl_enable),
        .scl(scl)
    );
    
    spi_fifo #(
        .DATA_WIDTH(DATA_WIDTH),
        .DEPTH(4)
    ) tx_fifo(
        .clk(clk),
        .data_o(tx_fifo_data_o),
        .read(read),
        .data_i(data_i),
        .write(wr),
        .empty(empty),
        .reset(reset)
    );
   
endmodule
