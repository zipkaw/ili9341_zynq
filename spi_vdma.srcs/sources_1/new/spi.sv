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
    parameter DATA_WIDTH = 9
)
(
    input clk,
    
    input miso,
    output reg mosi,
    output reg scl,
    output reg csx,
    output reg dcx, // data command selector 9th bit of packet
    
    input wr,
    input data_i[DATA_WIDTH-1:0],
    
    input rd,
    output data_o[DATA_WIDTH-1:0],
    
    input reset
);

    logic enable, read, empty; 
    spi_write_states_t w_state, w_next_state;
    
    logic transaction_ready;
    logic [$clog2(DATA_WIDTH) - 1:0] transmitted_byte_idx;
    
    
    scl_generator scl_gen(
        .clk(clk),
        .reset(reset),
        .enable(enable),
        .scl(scl)
    );
    
    spi_fifo #(
        .DATA_WIDTH(9),
        .DEPTH(4)
    ) tx_fifo(
        .clk(clk),
        .data_o(data_o),
        .read(read),
        .data_i(data_i),
        .write(wr),
        .full(),
        .empty(empty),
        .reset(reset)
    );
    
    // next logic
    always_ff @(posedge clk or negedge reset) begin
        if(!reset) begin
           w_state <= IDLE; 
        end
        else begin
            w_state <= w_next_state;
        end
    end
    
    // next states
    always_comb begin
        case (w_state)
            IDLE: if(!empty) begin
                w_next_state = PRE_WRITE;
            end else begin
                w_next_state = IDLE;
            end
            PRE_WRITE: begin
                w_next_state = WRITE;
            end
            WRITE: if(transaction_ready && !empty) begin
                w_next_state = IDLE;
            end
        endcase
    end
    
    // comb out
    always_comb begin
        case (w_state)
            IDLE: if(!empty) begin
                read <= '1;
            end
            PRE_WRITE: begin
                read <= '0;
                transaction_ready <= '0;
                transmitted_byte_idx <= '0;
                mosi <= data_o[transmitted_byte_idx];
            end
            WRITE: begin
                if(transmitted_byte_idx < DATA_WIDTH) begin
                    mosi <= data_o[transmitted_byte_idx];
                    transmitted_byte_idx <= transmitted_byte_idx + 1'b1;
                end else begin
                    transaction_ready <= '1;
                end
            end
        endcase
    end
    
endmodule
