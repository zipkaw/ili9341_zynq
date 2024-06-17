module axis_vdma_frame_reader
    #(
        parameter AXIS_DATA_WIDTH =  24,
        parameter COLOR_DEPTH = 24,
        localparam BYTE_SIZE = 8
    )
    (
        // axis vdma channel
        input                               m_axis_mm2s_aclk,
        input                               m_axis_mm2s_tvalid,
        input                               m_axis_mm2s_tlast,
        input [DATA_WIDTH-1:0]              mm2s_stream_tdata,
        input [(DATA_WIDTH/BYTE_SIZE)-1:0]  mm2s_stream_tkeep,
        output                              m_axis_mm2s_tready,
        output                              mm2s_fsync,
        
        // display driver channel
        input                               display_ready,
        input                               display_frame_ready,
        output [COLOR_DEPTH-1:0]            display_rgb,
        output                              display_valid,
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
        if (display_ready && !display_frame_ready) begin
            mm2s_fsync <= '0;
        end else if(display_ready && !display_frame_ready) begin
            mm2s_fsync <= '1;
        end
        
    end
    
    always_ff @(negedge m_axis_mm2s_aclk) begin : read_data_channel
        if (m_axis_mm2s_tvalid && display_ready) begin
            display_valid <= '1;
            
            casex (mm2s_stream_tkeep)
                3'b1xx: display_rgb[(BYTE_SIZE*(3'b100))-1:0] <= mm2s_stream_tdata[(BYTE_SIZE*(3'b100))-1:0];
                3'bx1x: display_rgb[(BYTE_SIZE*(3'b010))-1:0] <= mm2s_stream_tdata[(BYTE_SIZE*(3'b010))-1:0];
                3'bxx1: display_rgb[(BYTE_SIZE*(3'b001))-1:0] <= mm2s_stream_tdata[(BYTE_SIZE*(3'b001))-1:0];
            endcase
        end
    end
endmodule
