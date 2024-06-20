//Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2020.1 (win64) Build 2902540 Wed May 27 19:54:49 MDT 2020
//Date        : Fri Jun 21 01:22:30 2024
//Host        : DESKTOP-EK1VLDO running 64-bit major release  (build 9200)
//Command     : generate_target dispay_driver_bd.bd
//Design      : dispay_driver_bd
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "dispay_driver_bd,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=dispay_driver_bd,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=2,numReposBlks=2,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=2,numPkgbdBlks=0,bdsource=USER,synth_mode=Global}" *) (* HW_HANDOFF = "dispay_driver_bd.hwdef" *) 
module dispay_driver_bd
   (axis_display_pixel,
    axis_display_valid,
    clk,
    csx,
    dcx,
    display_axis_frame_ready,
    display_axis_ready,
    mosi,
    reset,
    scl);
  input [23:0]axis_display_pixel;
  input axis_display_valid;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.CLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.CLK, ASSOCIATED_RESET reset, CLK_DOMAIN dispay_driver_bd_clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.000" *) input clk;
  output csx;
  output dcx;
  output display_axis_frame_ready;
  output display_axis_ready;
  output mosi;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.RESET RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.RESET, INSERT_VIP 0, POLARITY ACTIVE_LOW" *) input reset;
  output scl;

  wire [23:0]axis_display_pixel_0_1;
  wire axis_display_valid_0_1;
  wire clk_1;
  wire display_driver_wrapp_0_display_axis_frame_ready;
  wire display_driver_wrapp_0_display_axis_ready;
  wire [8:0]display_driver_wrapp_0_display_spi_data;
  wire display_driver_wrapp_0_display_spi_write;
  wire reset_0_1;
  wire spi_wrapper_0_csx;
  wire spi_wrapper_0_dcx;
  wire spi_wrapper_0_fifo_empty;
  wire spi_wrapper_0_fifo_full;
  wire spi_wrapper_0_mosi;
  wire spi_wrapper_0_scl;

  assign axis_display_pixel_0_1 = axis_display_pixel[23:0];
  assign axis_display_valid_0_1 = axis_display_valid;
  assign clk_1 = clk;
  assign csx = spi_wrapper_0_csx;
  assign dcx = spi_wrapper_0_dcx;
  assign display_axis_frame_ready = display_driver_wrapp_0_display_axis_frame_ready;
  assign display_axis_ready = display_driver_wrapp_0_display_axis_ready;
  assign mosi = spi_wrapper_0_mosi;
  assign reset_0_1 = reset;
  assign scl = spi_wrapper_0_scl;
  dispay_driver_bd_display_driver_wrapp_0_0 display_driver_wrapp_0
       (.axis_display_clk_i(clk_1),
        .axis_display_pixel(axis_display_pixel_0_1),
        .axis_display_valid(axis_display_valid_0_1),
        .display_axis_frame_ready(display_driver_wrapp_0_display_axis_frame_ready),
        .display_axis_ready(display_driver_wrapp_0_display_axis_ready),
        .display_spi_data(display_driver_wrapp_0_display_spi_data),
        .display_spi_write(display_driver_wrapp_0_display_spi_write),
        .reset(reset_0_1),
        .spi_display_tx_fifo_empty(spi_wrapper_0_fifo_empty),
        .spi_display_tx_fifo_full(spi_wrapper_0_fifo_full));
  dispay_driver_bd_spi_wrapper_0_0 spi_wrapper_0
       (.clk(clk_1),
        .csx(spi_wrapper_0_csx),
        .data_i(display_driver_wrapp_0_display_spi_data),
        .dcx(spi_wrapper_0_dcx),
        .fifo_empty(spi_wrapper_0_fifo_empty),
        .fifo_full(spi_wrapper_0_fifo_full),
        .miso(1'b0),
        .mosi(spi_wrapper_0_mosi),
        .rd(1'b0),
        .reset(reset_0_1),
        .scl(spi_wrapper_0_scl),
        .wr(display_driver_wrapp_0_display_spi_write));
endmodule
