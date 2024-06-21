`timescale 1ns / 1ps

module axis_vdma_frame_reader_tb();
    localparam CLK_HALF_DELAY =         5;
    localparam INPUT_COLOR_DEPTH =     24;

    // intputs
    logic           m_axis_mm2s_aclk;
    logic           m_axis_mm2s_tvalid;
    logic           m_axis_mm2s_tlast;
    logic [23:0]    mm2s_stream_tdata;
    logic [2:0]     mm2s_stream_tkeep;
    logic           display_frame_ready;
    logic           display_ready;

    // outputs
    logic           m_axis_mm2s_tready;
    logic           mm2s_fsync;
    logic [23:0]    display_rgb;
    logic           display_valid;
    logic           display_clk_o;
    logic           reset;

    default clocking cb @(posedge m_axis_mm2s_aclk);
            endclocking;

    always begin
        #CLK_HALF_DELAY;
        m_axis_mm2s_aclk = ~m_axis_mm2s_aclk;
    end

    axis_vdma_frame_reader dut
                           (
                               .m_axis_mm2s_aclk(m_axis_mm2s_aclk),
                               .m_axis_mm2s_tvalid(m_axis_mm2s_tvalid),
                               .m_axis_mm2s_tlast(m_axis_mm2s_tlast),
                               .mm2s_stream_tdata(mm2s_stream_tdata),
                               .mm2s_stream_tkeep(mm2s_stream_tkeep),
                               .m_axis_mm2s_tready(m_axis_mm2s_tready),
                               .mm2s_fsync(mm2s_fsync),
                               .display_ready(display_ready),
                               .display_frame_ready(display_frame_ready),
                               .display_rgb(display_rgb),
                               .display_valid(display_valid),
                               .display_clk_o(display_clk_o),
                               .reset(reset)
                           );

    initial begin
        m_axis_mm2s_aclk <= '0;
        m_axis_mm2s_tvalid <= '0;
        m_axis_mm2s_tlast <= '0;
        mm2s_stream_tdata <= '0;
        mm2s_stream_tkeep <= '0;
        display_frame_ready <= '0;
        display_ready <= '0;
        reset <= '0;
        #150;
        reset <= '1;
        display_ready <= '1;
        #100;
        m_axis_mm2s_tvalid <= '1;
        mm2s_stream_tkeep <= 3'b111;
        axis_tdataBus(mm2s_stream_tdata);
        mm2s_stream_tkeep <= 3'b011;
        axis_tdataBus(mm2s_stream_tdata);
        mm2s_stream_tkeep <= 3'b001;
        axis_tdataBus(mm2s_stream_tdata);
        mm2s_stream_tkeep <= 3'b000;
        axis_tdataBus(mm2s_stream_tdata);
        mm2s_stream_tkeep <= 3'b100;
        axis_tdataBus(mm2s_stream_tdata);
        mm2s_stream_tkeep <= 3'b101;
        axis_tdataBus(mm2s_stream_tdata);
        m_axis_mm2s_tlast <= '1;
        display_frame_ready <= '1;
        #10;
        m_axis_mm2s_tvalid <= '0;
        display_frame_ready <= '0;
        #100;
        m_axis_mm2s_tvalid <= '1;
        axis_tdataBus(mm2s_stream_tdata);
        axis_tdataBus(mm2s_stream_tdata);
        axis_tdataBus(mm2s_stream_tdata);
        axis_tdataBus(mm2s_stream_tdata);
        axis_tdataBus(mm2s_stream_tdata);
        axis_tdataBus(mm2s_stream_tdata);
        m_axis_mm2s_tlast <= '1;
        display_frame_ready <= '1;
        #10;
        m_axis_mm2s_tvalid <= '0;
        display_frame_ready <= '0;
        m_axis_mm2s_tlast <= '0;
    end

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
