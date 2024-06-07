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
    logic [$clog2(DATA_WIDTH) - 1:0] transmitted_byte_idx;
    
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
    
    // next logic
    always_ff @(posedge clk or negedge reset) begin
        if(!reset) begin
           w_state <= IDLE; 
           w_next_state <= IDLE;
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
                mosi <= 'hZ;
            end
            PRE_WRITE: begin
                w_next_state = WRITE;
            end
            WRITE: if(transaction_ready) begin
                w_next_state = IDLE;
            end
        endcase
    end
    
    // comb out
    always_comb begin
        if(!reset) begin
            read <= '0;
            transaction_ready <= '0;
            scl_enable <= '0;
        end
        else begin
            case (w_state)
                IDLE: if(!empty) begin
                    read <= '1;
                end
                PRE_WRITE: begin
                    read <= '0;
                    transaction_ready <= '0;
                    transmitted_byte_idx <= PAYLOAD_OFFSET;
                    mosi <= tx_fifo_data_o[transmitted_byte_idx];
                    csx <= tx_fifo_data_o[CSX_OFFSET];
                    dcx <= tx_fifo_data_o[DCX_OFFSET];
                end
                WRITE: begin
                    if(transmitted_byte_idx[3:0] == CSX_OFFSET) begin
                        scl_enable <= '0;
                        transaction_ready <= '1;
                    end else begin
                        scl_enable <= '1;
                    end
                end
            endcase
        end
    end
    
    // sequental register out with scl spi clock
    always_ff @(negedge scl or negedge reset) begin
        if(!reset) begin
            transmitted_byte_idx <= '0;
            mosi <= 'hZ;
        end
        case (w_state)
            WRITE: begin
                transmitted_byte_idx = transmitted_byte_idx + 1'b1;
                mosi = tx_fifo_data_o[transmitted_byte_idx];
            end
        endcase
    end
    
endmodule
