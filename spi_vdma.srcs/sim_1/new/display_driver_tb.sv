`timescale 1ns / 1ps

module display_driver_tb();
    logic axis_display_clk_i;
    
    localparam INPUT_COLOR_DEPTH =      24;
    localparam DATA_WIDTH =             9;
    localparam CLK_HALF_DELAY =         5;
    
    event axis_ready_event;
    
    always begin
        #CLK_HALF_DELAY;
        axis_display_clk_i = ~axis_display_clk_i;
    end
    
    default clocking cb @(posedge axis_display_clk_i);
    endclocking
    
    logic [INPUT_COLOR_DEPTH-1:0]   axis_display_pixel;
    logic                           axis_display_valid;
    logic                           display_axis_ready;
    logic                           display_axis_frame_ready;
    logic                           spi_display_tx_fifo_empty;
    logic                           spi_display_tx_fifo_full;
    logic                           display_spi_write;
    logic [DATA_WIDTH-1:0]          display_spi_data;
    logic                           reset;
    
    display_driver dut(
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
    
    always begin
        forever begin
            @ (posedge display_axis_ready);
            axis_tdataBus(axis_display_pixel);
        end
    end
    
    initial begin
        axis_display_pixel <= '0;
        axis_display_valid <= '0;
        axis_display_clk_i <= '0;
        spi_display_tx_fifo_empty <= '0;
        spi_display_tx_fifo_full <= '1;
        display_spi_data <= '0;
        reset <= '0;
        #100;
        reset <= '1;
        #150;
        #100;
        spi_display_tx_fifo_full <= '0;
        #200;
        spi_display_tx_fifo_full <= '1;
        #450;
        spi_display_tx_fifo_full <= '0;
        
        axis_display_valid <= '1;
    end
    
    task axis_treadyTrigger();
        begin
            if (display_axis_ready) begin
                -> axis_ready_event;
                $display("display_axis_ready triggered");
            end
        end
    endtask
    
    task axis_tdataBus(); // represent an pixel transactions (including pixel generation)
        output [INPUT_COLOR_DEPTH-1:0] pixel_o;
        begin
            int seed = 42;
            logic[INPUT_COLOR_DEPTH-1:0] pixel = $dist_uniform(seed, 0, {(INPUT_COLOR_DEPTH-1){1'b1}});
            ##0;
            pixel_o = pixel;
            #(CLK_HALF_DELAY*2);
        end
    endtask
endmodule
