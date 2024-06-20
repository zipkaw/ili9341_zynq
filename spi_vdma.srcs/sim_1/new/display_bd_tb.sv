`timescale 1ns / 1ps

module display_bd_tb();
    // inputs
    logic [23:0] axis_display_pixel;
    logic reset;
    logic clk;
    logic axis_display_valid;

    localparam CLK_HALF_DELAY =         5;

    // outputs
    logic csx;
    logic dcx;
    logic display_axis_frame_ready;
    logic display_axis_ready;
    logic mosi;
    logic scl;

    always begin
        #CLK_HALF_DELAY;
        clk = ~clk;
    end

    always begin
        forever begin
            @ (posedge display_axis_ready);
            axis_tdataBus(axis_display_pixel);
        end
    end
    
    default clocking cb @(posedge clk);
            endclocking

            dispay_driver_bd_wrapper dut
                                     (
                                         .axis_display_pixel(axis_display_pixel),
                                         .axis_display_valid(axis_display_valid),
                                         .clk(clk),
                                         .csx(csx),
                                         .dcx(dcx),
                                         .display_axis_frame_ready(display_axis_frame_ready),
                                         .display_axis_ready(display_axis_ready),
                                         .mosi(mosi),
                                         .reset(reset),
                                         .scl(scl)
                                     );

    initial begin
        clk <= '0;
        axis_display_pixel <= '0;
        reset <= '0;
        axis_display_valid <= '0;
        #100;
        reset <= '1;
        #1ms;
        axis_display_valid <= '1;
    end

    task axis_tdataBus(); // represent an pixel transactions (including pixel generation)
        output [23:0] pixel_o;
        begin
            int seed = 42;
            logic[23:0] pixel = $dist_uniform(seed, 0, {(23){1'b1}});
            ##0;
            pixel_o = pixel;
            #(CLK_HALF_DELAY*2);
        end
    endtask

endmodule
