module axis_vdma_frame_reader
    #(
         parameter COLOR_DEPTH = 24,
         localparam BYTE_SIZE = 8
     )
     (
         // axis vdma channel
         input                               m_axis_mm2s_aclk,
         input                               m_axis_mm2s_tvalid,
         input                               m_axis_mm2s_tlast,
         input [COLOR_DEPTH-1:0]             mm2s_stream_tdata,
         input [(COLOR_DEPTH/BYTE_SIZE)-1:0] mm2s_stream_tkeep,
         output                              m_axis_mm2s_tready,
         output logic                        mm2s_fsync,

         // display driver channel
         input                               display_ready,
         input                               display_frame_ready,
         output logic [COLOR_DEPTH-1:0]      display_rgb,
         output logic                        display_valid,
         output                              display_clk_o,

         input                               reset
     );

    assign m_axis_mm2s_tready = display_ready;
    assign display_clk_o = m_axis_mm2s_aclk;

    // initialte frame read using fclk
    always_ff @(negedge m_axis_mm2s_aclk) begin : read_frame_init
        if (reset) begin
            mm2s_fsync <= '1;
        end

        //  > AXI VDMA starts processing each frame on the falling edge of the mm2s_fsync input
        if (display_frame_ready) begin
            mm2s_fsync <= '1;
        end
        else begin
            mm2s_fsync <= '0;
        end

    end

    always_comb begin : read_data_channel
        if (m_axis_mm2s_tvalid) begin
            display_valid = m_axis_mm2s_tvalid;
        end

        if (mm2s_stream_tkeep[0])
            display_rgb[7:0] = {mm2s_stream_tdata[7:0]};
        else
            display_rgb[7:0] = {8{1'b0}};

        if (mm2s_stream_tkeep[1])
            display_rgb[15:8] = {mm2s_stream_tdata[15:8]};
        else
            display_rgb[15:8] = {8{1'b0}};

        if (mm2s_stream_tkeep[2])
            display_rgb[23:16] = {mm2s_stream_tdata[23:16]};
        else
            display_rgb[23:16] = {8{1'b0}};
    end
endmodule
