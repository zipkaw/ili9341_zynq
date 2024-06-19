`timescale 1ns / 1ps
`include "display_commands.vh"

`define ON '1
`define OFF '0

typedef enum {IDLE_WRITE, READ_PIXEL, WRITE_1B_SPI, WRITE_2B_SPI} display_w_states;
typedef enum {IDLE_PW, SW_RESET, POWER_ON, WAKEUP} display_pw_states;

module display_driver
#(
    parameter FIFO_DEPTH =              3,
    localparam INPUT_COLOR_DEPTH =      24,
    localparam DATA_WIDTH =             9,
    localparam DISPLAY_COLOR_DEPTH =    16,
    localparam DISPLAY_WIDTH =          240,
    localparam DISPLAY_HEIGHT =         320,
    localparam TOTAL_PIXELS =           (DISPLAY_HEIGHT * DISPLAY_WIDTH)
)(
    // axis reader <--> display interface
    input [INPUT_COLOR_DEPTH-1:0]       axis_display_pixel,
    input                               axis_display_valid,
    input                               axis_display_clk_i,
    
    output                              display_axis_ready,
    output                              display_axis_frame_ready,
    
    // display <--> spi interface
    input                               spi_display_tx_fifo_empty,
    input                               spi_display_tx_fifo_full,
    output                              display_spi_write, // mux
    output [DATA_WIDTH-1:0]             display_spi_data, // mux
    
    input                               reset
);
    // conver 24-bit channel to 16-bit, using 5:6:5(RGB) schema
    task bitChannleConverter(input [INPUT_COLOR_DEPTH-1:0] fullColorPixel, output [DISPLAY_COLOR_DEPTH-1:0] convertedPixel);
        convertedPixel= {
            fullColorPixel[INPUT_COLOR_DEPTH-1:INPUT_COLOR_DEPTH-6],    // 5 B 
            fullColorPixel[INPUT_COLOR_DEPTH-9:INPUT_COLOR_DEPTH-14],   // 6 G   
            fullColorPixel[INPUT_COLOR_DEPTH-17:INPUT_COLOR_DEPTH-21]   // 5 R
            };
    endtask

    logic [DATA_WIDTH-1:0] pw_data_out; 
    logic [DATA_WIDTH-1:0] w_data_out;
    logic pw_write_req, w_write_req; 

    // write control states/regs
    int unsigned pixel_count;
    display_w_states w_state;
    logic [DISPLAY_COLOR_DEPTH-1:0] output_pixel;
    
    // power control states/regs
    bit pw_on, pw_in_progress;
    display_pw_states pw_state;
    int unsigned pw_command_count;
    bit pw_sleep_en;
    int unsigned pw_sleep_count;
    
    
    // fifo regs/nets
    logic [INPUT_COLOR_DEPTH-1:0] dfifo_o;
    logic fifo_read;
    logic fifo_empty;
    logic fifo_full;
 
    logic [DATA_WIDTH-1:0] POWER_ON_COMMANDS [`TOTAL_PW_ON_PACKETS_NUM-1:0] =
    '{
        `SW_RESET,
        `POWER_CONTROL_B,
        `POWER_ON_SECUENCE_CONTROL,
        `PUMP_RATIO_CONTROL,
        `DRIVER_TIMING_CONTROL_B,
        `POWER_CONTROL_1,
        `POWER_CONTROL_2,
        `VCOM_CONTROL_1,
        `VCOM_CONTROL_2,
        `MEM_ACC_CONTROL,
        `PIXEL_FORMAT,
        `FORMAT_CONTROL,
        `DISPLAY_FUNCTION_CONTROL,
        `GAMMA_3_FUNCTION_DISABLE,
        `GAMMA_FUNCTION_SET,
        `SLEEP_OFF,
        `DISPLAY_ON
    };
        
    fifo #(
        .DATA_WIDTH(INPUT_COLOR_DEPTH),
        .DEPTH(FIFO_DEPTH)
    ) pixel (
        .clk(axis_display_clk_i),
        .data_o(dfifo_o),
        .read(fifo_read),
        .data_i(axis_display_pixel),
        .write(axis_display_valid),
        .empty(fifo_empty),
        .full(fifo_full),
        .reset(reset)
    );
    
    assign display_axis_ready = !fifo_full && pw_on == `ON;
    
    always_ff @( negedge axis_display_clk_i or negedge reset ) begin : power_FSM
        if (!reset) begin
            pw_state <= IDLE_PW;
            pw_on <= `OFF;
            pw_in_progress <= '0;
        end else begin
            case(pw_state)
                IDLE_PW: begin
                    if(pw_on == `ON) begin
                        pw_state <= IDLE_PW;
                        pw_write_req <= '0;
                        pw_in_progress <= '0;
                    end else begin
                        if (!spi_display_tx_fifo_full) begin
                            pw_state <= SW_RESET;
                            pw_command_count <= `TOTAL_PW_ON_PACKETS_NUM - 1;
                            pw_in_progress <= '1;
                            pw_write_req <= '1;
                        end else begin
                            pw_state <= IDLE_PW;
                        end
                    end
                end
                SW_RESET: begin
                    pw_write_req <= '0;
                    if(pw_sleep_count != 0) begin
                        pw_sleep_en <= '1;
                        pw_state <= SW_RESET;
                    end else begin
                        pw_sleep_en <= '0;
                        pw_state <= POWER_ON;
                    end
                end
                POWER_ON: begin
                    pw_write_req <= '1;
                    if(pw_command_count != 1'b1) begin
                        if (!spi_display_tx_fifo_full) begin
                            pw_command_count <= pw_command_count - 1'b1;
                            pw_state <= POWER_ON;
                        end else begin
                            pw_state <= POWER_ON;
                        end
                    end else begin
                        pw_write_req <= '0;
                        pw_state <= WAKEUP;
                    end
                end
                WAKEUP: begin
                    if(pw_sleep_count != 0) begin
                        pw_sleep_en <= '1;
                        pw_state <= WAKEUP;
                    end else begin
                        if (!spi_display_tx_fifo_full) begin
                            pw_write_req <= '1;
                            pw_command_count <= pw_command_count - 1'b1;
                            pw_sleep_en <= '0;
                            pw_on <= `ON;
                            pw_state <= IDLE_PW;
                        end else begin 
                            pw_state <= WAKEUP;
                        end;
                    end
                end
                default: begin
                    pw_state <= IDLE_PW;
                end
            endcase
        end
    end
    
    always_ff @( negedge axis_display_clk_i or negedge reset ) begin : sleep_delay_block
        if (!reset) begin
            pw_sleep_count <= `WAKEUP_DELAY_100MHZ;
        end else begin
            if(pw_sleep_en) pw_sleep_count <= pw_sleep_count - 1'b1;
            else pw_sleep_count <= `WAKEUP_DELAY_100MHZ;
        end
    end
    
    always_ff @( negedge axis_display_clk_i or negedge reset ) begin : write_pixel_FSM
        if (!reset) begin
            w_state <= IDLE_WRITE;
        end else begin
            case (w_state)
                IDLE_WRITE: begin
                    if (!fifo_empty && pw_on == `ON) begin
                        fifo_read <= '1;
                        w_write_req <= '0;
                        
                        w_state <= READ_PIXEL;
                    end else begin // @loopback
                        w_state <= IDLE_WRITE;
                        fifo_read <= '0;
                        w_write_req <= '0;
                    end
                end
                READ_PIXEL: begin
                    // state outputs
                    fifo_read <= '0;
                    bitChannleConverter(dfifo_o[INPUT_COLOR_DEPTH-1:0], output_pixel[DISPLAY_COLOR_DEPTH-1:0]);
                    
                    // next state
                    if (!spi_display_tx_fifo_full) begin
                        w_write_req <= '1;
                        w_data_out <= {1'b1, output_pixel[7:0]};
                        w_state <= WRITE_1B_SPI;
                    end else begin // @loopback
                        w_write_req <= '0;
                        w_state <= READ_PIXEL;
                    end
                end
                WRITE_1B_SPI: begin
                    // next state
                    w_data_out <= {1'b1, output_pixel[15:8]};
                    w_state <= WRITE_2B_SPI;
                end
                WRITE_2B_SPI: begin
                    // state outputss
                    w_write_req <= '0;
                    
                    // next state
                    if (spi_display_tx_fifo_full) begin
                        w_state <= WRITE_2B_SPI;
                    end else begin
                        w_state <= IDLE_WRITE;
                    end
                end
                default: w_state <= IDLE_WRITE;
            endcase
        end
    end
    
    assign display_spi_data = (pw_in_progress) ? POWER_ON_COMMANDS[pw_command_count] : w_data_out;
    assign display_spi_write = (pw_in_progress) ? pw_write_req : w_write_req;
    
endmodule
