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

typedef enum {IDLE, PRE_WRITE, WRITE_BIT, BIT_TRANSACTION_READY} spi_write_states_t;

module spi
#(
    parameter  SCL_CLK_HALF_PERIOD =    5,
    localparam DATA_WIDTH =             10,
    localparam CSX_OFFSET =             DATA_WIDTH - 2,
    localparam DCX_OFFSET =             DATA_WIDTH - 1,
    localparam PAYLOAD_OFFSET =         0,
    localparam MOSI_DELAY =             SCL_CLK_HALF_PERIOD*2,
    localparam MOSI_BITS_CNT =          8
)
(
    input                               clk,
                
    input                               miso,
    output                        mosi,
    output logic                        scl,
    output logic                        csx, // chip select 10th bit of packet
    output logic                        dcx, // data command selector 9th bit of packet
    
    input                               wr,
    input [DATA_WIDTH-1:0]              data_i,
    
    input                               rd,
    output [DATA_WIDTH-1:0]             data_o,
    
    input                               reset
);

    spi_write_states_t w_state, w_next_state;
    
    logic scl_enable, read; 
    logic                        empty;
    logic [DATA_WIDTH - 1:0]     tx_fifo_data_o, slr; 
    logic [$clog2(MOSI_BITS_CNT)-1:0]  transmitted_byte_idx;
    logic mosi_bit_was_send;
    shortint setup_count = 0;
    shortint hold_count = 0;
    
    scl_generator #(
        .HALF_PER_DIV_PARAM(SCL_CLK_HALF_PERIOD)
    )scl_gen(
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
   
    always_ff @(posedge clk or negedge reset) begin : write_sequental_states_storage
        if (!reset) begin
            w_state <= IDLE;
        end
        else begin
            w_state <= w_next_state;
        end
    end
    
    always_comb begin : write_combinational_state_transitions
        case (w_state)
            IDLE: begin
                if (!empty) begin
                    w_next_state = PRE_WRITE;
                end else begin
                    w_next_state = IDLE; // @loopback
                end
            end
            PRE_WRITE: begin
                w_next_state = WRITE_BIT;
            end
            WRITE_BIT: begin
                if (transmitted_byte_idx == '1 && hold_count >= MOSI_DELAY-1) begin
                    w_next_state = IDLE;
                end else if (transmitted_byte_idx < MOSI_BITS_CNT && hold_count >= MOSI_DELAY-1) begin
                    w_next_state = BIT_TRANSACTION_READY;
                end else begin
                    w_next_state = WRITE_BIT; // @loopback
                end
            end
            BIT_TRANSACTION_READY: begin
                w_next_state = WRITE_BIT;
            end
            default: begin
                w_next_state = IDLE; 
            end
        endcase
    end
    
    always_ff @(negedge scl or negedge reset) begin : write_transmitted_byte_counting
        if (!reset) begin
            transmitted_byte_idx <= '0;
        end
        else begin
            transmitted_byte_idx <= transmitted_byte_idx + 1'b1;
        end    
    end 
       
    always_comb begin : write_combinational_output
        case (w_state)
            IDLE: begin
                if (!empty) begin
                    scl_enable = '0;
                    read = '1;
                end else begin
                    scl_enable = '0;
                    read = '0;
                end
            end
            PRE_WRITE: begin
                scl_enable = '1;
                read = '0;
            end
            WRITE_BIT: begin
                scl_enable = '1;
                read = '0;
            end
            BIT_TRANSACTION_READY: begin
                scl_enable = '1;
                read = '0;
            end
            default: begin
                read = '0;
                scl_enable = '0;
            end
        endcase
    end
    
    always_ff @(posedge clk) begin : write_sequental_output
        case (w_next_state)
            IDLE: begin
                hold_count <= '0;
            end
            WRITE_BIT: begin
                hold_count <= hold_count + 1'b1;
            end
            BIT_TRANSACTION_READY: begin
                hold_count <= '0;
            end
        endcase
    end
    
    always_ff @(negedge clk) begin
        if(w_state == PRE_WRITE) begin
            slr <= tx_fifo_data_o;
        end else if(scl_enable && w_state == WRITE_BIT && hold_count >= MOSI_DELAY-1) begin
            slr <= {1'b0, slr[DATA_WIDTH - 1:1]};
        end
    end
    
    assign mosi = slr[0];
    
endmodule
