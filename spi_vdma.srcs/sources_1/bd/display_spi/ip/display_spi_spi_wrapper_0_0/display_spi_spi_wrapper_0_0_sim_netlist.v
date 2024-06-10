// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.1 (win64) Build 2902540 Wed May 27 19:54:49 MDT 2020
// Date        : Fri Jun  7 14:46:16 2024
// Host        : DESKTOP-EK1VLDO running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/ES/Desktop/spi_vdma/spi_vdma.srcs/sources_1/bd/display_spi/ip/display_spi_spi_wrapper_0_0/display_spi_spi_wrapper_0_0_sim_netlist.v
// Design      : display_spi_spi_wrapper_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "display_spi_spi_wrapper_0_0,spi_wrapper,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "module_ref" *) 
(* X_CORE_INFO = "spi_wrapper,Vivado 2020.1" *) 
(* NotValidForBitStream *)
module display_spi_spi_wrapper_0_0
   (clk,
    miso,
    mosi,
    scl,
    csx,
    dcx,
    wr,
    data_i,
    rd,
    data_o,
    reset);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 clk CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME clk, ASSOCIATED_RESET reset, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN /clk_wiz_clk_out1, INSERT_VIP 0" *) inout clk;
  inout miso;
  inout mosi;
  inout scl;
  inout csx;
  inout dcx;
  inout wr;
  inout [9:0]data_i;
  inout rd;
  inout [9:0]data_o;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 reset RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME reset, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) inout reset;

  wire clk;
  wire csx;
  wire [9:0]data_i;
  wire dcx;
  wire reset;
  wire scl;
  wire wr;

  display_spi_spi_wrapper_0_0_spi_wrapper inst
       (.clk(clk),
        .csx(csx),
        .data_i({data_i[9:8],data_i[0]}),
        .dcx(dcx),
        .reset(reset),
        .scl(scl),
        .wr(wr));
endmodule

(* ORIG_REF_NAME = "scl_generator" *) 
module display_spi_spi_wrapper_0_0_scl_generator
   (scl,
    reset,
    scl_0);
  output scl;
  input reset;
  input scl_0;

  wire reset;
  wire scl;
  wire scl_0;

  (* OPT_MODIFIED = "MLO" *) 
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0),
    .IS_G_INVERTED(1'b1)) 
    scl_reg
       (.CLR(1'b0),
        .D(reset),
        .G(reset),
        .GE(1'b1),
        .Q(scl));
endmodule

(* ORIG_REF_NAME = "spi" *) 
module display_spi_spi_wrapper_0_0_spi
   (scl,
    csx,
    dcx,
    wr,
    reset,
    clk,
    data_i);
  output scl;
  output csx;
  output dcx;
  input wr;
  input reset;
  input clk;
  input [2:0]data_i;

  wire clk;
  wire csx;
  wire [2:0]data_i;
  wire dcx;
  wire mosi_reg_n_0;
  wire read;
  wire reset;
  wire scl;
  wire [9:8]tx_fifo_data_o;
  wire tx_fifo_n_0;
  wire tx_fifo_n_3;
  wire tx_fifo_n_4;
  wire wr;

  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    csx_reg
       (.CLR(1'b0),
        .D(tx_fifo_data_o[8]),
        .G(1'b0),
        .GE(1'b1),
        .Q(csx));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    dcx_reg
       (.CLR(1'b0),
        .D(tx_fifo_data_o[9]),
        .G(1'b0),
        .GE(1'b1),
        .Q(dcx));
  (* OPT_MODIFIED = "MLO" *) 
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0),
    .IS_G_INVERTED(1'b1)) 
    mosi_reg
       (.CLR(1'b0),
        .D(tx_fifo_n_3),
        .G(reset),
        .GE(1'b1),
        .Q(mosi_reg_n_0));
  (* XILINX_LEGACY_PRIM = "LDC" *) 
  LDCE #(
    .INIT(1'b0)) 
    read_reg
       (.CLR(tx_fifo_n_0),
        .D(1'b1),
        .G(tx_fifo_n_4),
        .GE(1'b1),
        .Q(read));
  display_spi_spi_wrapper_0_0_scl_generator scl_gen
       (.reset(reset),
        .scl(scl),
        .scl_0(tx_fifo_n_0));
  display_spi_spi_wrapper_0_0_spi_fifo tx_fifo
       (.clk(clk),
        .data_i(data_i),
        .\data_o_reg[0]_0 (tx_fifo_n_3),
        .\fifo_capacity_reg[2]_0 (tx_fifo_n_4),
        .read(read),
        .reset(reset),
        .reset_0(tx_fifo_n_0),
        .tx_fifo_data_o(tx_fifo_data_o),
        .wr(wr));
endmodule

(* ORIG_REF_NAME = "spi_fifo" *) 
module display_spi_spi_wrapper_0_0_spi_fifo
   (reset_0,
    tx_fifo_data_o,
    \data_o_reg[0]_0 ,
    \fifo_capacity_reg[2]_0 ,
    wr,
    reset,
    clk,
    data_i,
    read);
  output reset_0;
  output [1:0]tx_fifo_data_o;
  output \data_o_reg[0]_0 ;
  output \fifo_capacity_reg[2]_0 ;
  input wr;
  input reset;
  input clk;
  input [2:0]data_i;
  input read;

  wire clk;
  wire [2:0]data_i;
  wire [9:0]data_o0;
  wire \data_o[0]_i_1_n_0 ;
  wire \data_o[8]_i_1_n_0 ;
  wire \data_o[9]_i_1_n_0 ;
  wire \data_o_reg[0]_0 ;
  wire \fifo_buff[0][0]_i_1_n_0 ;
  wire \fifo_buff[0][8]_i_1_n_0 ;
  wire \fifo_buff[0][9]_i_1_n_0 ;
  wire \fifo_buff[1][0]_i_1_n_0 ;
  wire \fifo_buff[1][8]_i_1_n_0 ;
  wire \fifo_buff[1][9]_i_1_n_0 ;
  wire \fifo_buff[2][0]_i_1_n_0 ;
  wire \fifo_buff[2][8]_i_1_n_0 ;
  wire \fifo_buff[2][9]_i_1_n_0 ;
  wire \fifo_buff[3][0]_i_1_n_0 ;
  wire \fifo_buff[3][8]_i_1_n_0 ;
  wire \fifo_buff[3][9]_i_1_n_0 ;
  wire [9:0]\fifo_buff_reg[0] ;
  wire [9:0]\fifo_buff_reg[1] ;
  wire [9:0]\fifo_buff_reg[2] ;
  wire [9:0]\fifo_buff_reg[3] ;
  wire [31:0]fifo_capacity;
  wire [31:1]fifo_capacity0;
  wire fifo_capacity0_carry__0_i_1_n_0;
  wire fifo_capacity0_carry__0_i_1_n_1;
  wire fifo_capacity0_carry__0_i_1_n_2;
  wire fifo_capacity0_carry__0_i_1_n_3;
  wire fifo_capacity0_carry__0_i_1_n_4;
  wire fifo_capacity0_carry__0_i_1_n_5;
  wire fifo_capacity0_carry__0_i_1_n_6;
  wire fifo_capacity0_carry__0_i_1_n_7;
  wire fifo_capacity0_carry__0_i_2_n_0;
  wire fifo_capacity0_carry__0_i_3_n_0;
  wire fifo_capacity0_carry__0_i_4_n_0;
  wire fifo_capacity0_carry__0_i_5_n_0;
  wire fifo_capacity0_carry__0_n_0;
  wire fifo_capacity0_carry__0_n_1;
  wire fifo_capacity0_carry__0_n_2;
  wire fifo_capacity0_carry__0_n_3;
  wire fifo_capacity0_carry__1_i_1_n_0;
  wire fifo_capacity0_carry__1_i_1_n_1;
  wire fifo_capacity0_carry__1_i_1_n_2;
  wire fifo_capacity0_carry__1_i_1_n_3;
  wire fifo_capacity0_carry__1_i_1_n_4;
  wire fifo_capacity0_carry__1_i_1_n_5;
  wire fifo_capacity0_carry__1_i_1_n_6;
  wire fifo_capacity0_carry__1_i_1_n_7;
  wire fifo_capacity0_carry__1_i_2_n_0;
  wire fifo_capacity0_carry__1_i_3_n_0;
  wire fifo_capacity0_carry__1_i_4_n_0;
  wire fifo_capacity0_carry__1_i_5_n_0;
  wire fifo_capacity0_carry__1_n_0;
  wire fifo_capacity0_carry__1_n_1;
  wire fifo_capacity0_carry__1_n_2;
  wire fifo_capacity0_carry__1_n_3;
  wire fifo_capacity0_carry__2_i_1_n_0;
  wire fifo_capacity0_carry__2_i_1_n_1;
  wire fifo_capacity0_carry__2_i_1_n_2;
  wire fifo_capacity0_carry__2_i_1_n_3;
  wire fifo_capacity0_carry__2_i_1_n_4;
  wire fifo_capacity0_carry__2_i_1_n_5;
  wire fifo_capacity0_carry__2_i_1_n_6;
  wire fifo_capacity0_carry__2_i_1_n_7;
  wire fifo_capacity0_carry__2_i_2_n_0;
  wire fifo_capacity0_carry__2_i_3_n_0;
  wire fifo_capacity0_carry__2_i_4_n_0;
  wire fifo_capacity0_carry__2_i_5_n_0;
  wire fifo_capacity0_carry__2_n_0;
  wire fifo_capacity0_carry__2_n_1;
  wire fifo_capacity0_carry__2_n_2;
  wire fifo_capacity0_carry__2_n_3;
  wire fifo_capacity0_carry__3_i_1_n_0;
  wire fifo_capacity0_carry__3_i_1_n_1;
  wire fifo_capacity0_carry__3_i_1_n_2;
  wire fifo_capacity0_carry__3_i_1_n_3;
  wire fifo_capacity0_carry__3_i_1_n_4;
  wire fifo_capacity0_carry__3_i_1_n_5;
  wire fifo_capacity0_carry__3_i_1_n_6;
  wire fifo_capacity0_carry__3_i_1_n_7;
  wire fifo_capacity0_carry__3_i_2_n_0;
  wire fifo_capacity0_carry__3_i_3_n_0;
  wire fifo_capacity0_carry__3_i_4_n_0;
  wire fifo_capacity0_carry__3_i_5_n_0;
  wire fifo_capacity0_carry__3_n_0;
  wire fifo_capacity0_carry__3_n_1;
  wire fifo_capacity0_carry__3_n_2;
  wire fifo_capacity0_carry__3_n_3;
  wire fifo_capacity0_carry__4_i_1_n_0;
  wire fifo_capacity0_carry__4_i_1_n_1;
  wire fifo_capacity0_carry__4_i_1_n_2;
  wire fifo_capacity0_carry__4_i_1_n_3;
  wire fifo_capacity0_carry__4_i_1_n_4;
  wire fifo_capacity0_carry__4_i_1_n_5;
  wire fifo_capacity0_carry__4_i_1_n_6;
  wire fifo_capacity0_carry__4_i_1_n_7;
  wire fifo_capacity0_carry__4_i_2_n_0;
  wire fifo_capacity0_carry__4_i_3_n_0;
  wire fifo_capacity0_carry__4_i_4_n_0;
  wire fifo_capacity0_carry__4_i_5_n_0;
  wire fifo_capacity0_carry__4_n_0;
  wire fifo_capacity0_carry__4_n_1;
  wire fifo_capacity0_carry__4_n_2;
  wire fifo_capacity0_carry__4_n_3;
  wire fifo_capacity0_carry__5_i_1_n_1;
  wire fifo_capacity0_carry__5_i_1_n_2;
  wire fifo_capacity0_carry__5_i_1_n_3;
  wire fifo_capacity0_carry__5_i_1_n_4;
  wire fifo_capacity0_carry__5_i_1_n_5;
  wire fifo_capacity0_carry__5_i_1_n_6;
  wire fifo_capacity0_carry__5_i_1_n_7;
  wire fifo_capacity0_carry__5_i_2_n_0;
  wire fifo_capacity0_carry__5_i_3_n_0;
  wire fifo_capacity0_carry__5_i_4_n_0;
  wire fifo_capacity0_carry__5_i_5_n_0;
  wire fifo_capacity0_carry__5_n_0;
  wire fifo_capacity0_carry__5_n_1;
  wire fifo_capacity0_carry__5_n_2;
  wire fifo_capacity0_carry__5_n_3;
  wire fifo_capacity0_carry__6_i_1_n_0;
  wire fifo_capacity0_carry__6_i_2_n_0;
  wire fifo_capacity0_carry__6_i_3_n_0;
  wire fifo_capacity0_carry__6_n_2;
  wire fifo_capacity0_carry__6_n_3;
  wire fifo_capacity0_carry_i_1_n_0;
  wire fifo_capacity0_carry_i_1_n_1;
  wire fifo_capacity0_carry_i_1_n_2;
  wire fifo_capacity0_carry_i_1_n_3;
  wire fifo_capacity0_carry_i_1_n_4;
  wire fifo_capacity0_carry_i_1_n_5;
  wire fifo_capacity0_carry_i_1_n_6;
  wire fifo_capacity0_carry_i_1_n_7;
  wire fifo_capacity0_carry_i_2_n_0;
  wire fifo_capacity0_carry_i_2_n_1;
  wire fifo_capacity0_carry_i_2_n_2;
  wire fifo_capacity0_carry_i_2_n_3;
  wire fifo_capacity0_carry_i_2_n_4;
  wire fifo_capacity0_carry_i_2_n_5;
  wire fifo_capacity0_carry_i_2_n_6;
  wire fifo_capacity0_carry_i_2_n_7;
  wire fifo_capacity0_carry_i_3_n_0;
  wire fifo_capacity0_carry_i_4_n_0;
  wire fifo_capacity0_carry_i_5_n_0;
  wire fifo_capacity0_carry_i_6_n_0;
  wire fifo_capacity0_carry_i_7_n_0;
  wire fifo_capacity0_carry_n_0;
  wire fifo_capacity0_carry_n_1;
  wire fifo_capacity0_carry_n_2;
  wire fifo_capacity0_carry_n_3;
  wire \fifo_capacity[0]_i_1_n_0 ;
  wire \fifo_capacity[10]_i_1_n_0 ;
  wire \fifo_capacity[11]_i_1_n_0 ;
  wire \fifo_capacity[12]_i_1_n_0 ;
  wire \fifo_capacity[13]_i_1_n_0 ;
  wire \fifo_capacity[14]_i_1_n_0 ;
  wire \fifo_capacity[15]_i_1_n_0 ;
  wire \fifo_capacity[16]_i_1_n_0 ;
  wire \fifo_capacity[17]_i_1_n_0 ;
  wire \fifo_capacity[18]_i_1_n_0 ;
  wire \fifo_capacity[19]_i_1_n_0 ;
  wire \fifo_capacity[1]_i_1_n_0 ;
  wire \fifo_capacity[20]_i_1_n_0 ;
  wire \fifo_capacity[21]_i_1_n_0 ;
  wire \fifo_capacity[22]_i_1_n_0 ;
  wire \fifo_capacity[23]_i_1_n_0 ;
  wire \fifo_capacity[24]_i_1_n_0 ;
  wire \fifo_capacity[25]_i_1_n_0 ;
  wire \fifo_capacity[26]_i_1_n_0 ;
  wire \fifo_capacity[27]_i_1_n_0 ;
  wire \fifo_capacity[28]_i_1_n_0 ;
  wire \fifo_capacity[29]_i_1_n_0 ;
  wire \fifo_capacity[2]_i_1_n_0 ;
  wire \fifo_capacity[30]_i_1_n_0 ;
  wire \fifo_capacity[31]_i_1_n_0 ;
  wire \fifo_capacity[31]_i_2_n_0 ;
  wire \fifo_capacity[3]_i_1_n_0 ;
  wire \fifo_capacity[4]_i_1_n_0 ;
  wire \fifo_capacity[5]_i_1_n_0 ;
  wire \fifo_capacity[6]_i_1_n_0 ;
  wire \fifo_capacity[7]_i_1_n_0 ;
  wire \fifo_capacity[8]_i_1_n_0 ;
  wire \fifo_capacity[9]_i_1_n_0 ;
  wire \fifo_capacity_reg[2]_0 ;
  wire [1:0]rd_ptr;
  wire \rd_ptr[0]_i_1_n_0 ;
  wire \rd_ptr[1]_i_1_n_0 ;
  wire read;
  wire read_reg_i_2_n_0;
  wire read_reg_i_3_n_0;
  wire read_reg_i_4_n_0;
  wire read_reg_i_5_n_0;
  wire read_reg_i_6_n_0;
  wire read_reg_i_7_n_0;
  wire read_reg_i_8_n_0;
  wire read_reg_i_9_n_0;
  wire reset;
  wire reset_0;
  wire [1:0]tx_fifo_data_o;
  wire wr;
  wire [1:0]wr_ptr;
  wire \wr_ptr[0]_i_1_n_0 ;
  wire \wr_ptr[1]_i_1_n_0 ;
  wire wr_ptr_0;
  wire [3:3]NLW_fifo_capacity0_carry__5_i_1_CO_UNCONNECTED;
  wire [3:2]NLW_fifo_capacity0_carry__6_CO_UNCONNECTED;
  wire [3:3]NLW_fifo_capacity0_carry__6_O_UNCONNECTED;

  LUT3 #(
    .INIT(8'hE2)) 
    \data_o[0]_i_1 
       (.I0(data_o0[0]),
        .I1(\fifo_capacity[31]_i_2_n_0 ),
        .I2(\data_o_reg[0]_0 ),
        .O(\data_o[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hCCFFAAF0CC00AAF0)) 
    \data_o[0]_i_2 
       (.I0(\fifo_buff_reg[2] [0]),
        .I1(\fifo_buff_reg[3] [0]),
        .I2(\fifo_buff_reg[0] [0]),
        .I3(rd_ptr[1]),
        .I4(rd_ptr[0]),
        .I5(\fifo_buff_reg[1] [0]),
        .O(data_o0[0]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \data_o[8]_i_1 
       (.I0(data_o0[8]),
        .I1(\fifo_capacity[31]_i_2_n_0 ),
        .I2(tx_fifo_data_o[0]),
        .O(\data_o[8]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hCCFFAAF0CC00AAF0)) 
    \data_o[8]_i_2 
       (.I0(\fifo_buff_reg[2] [8]),
        .I1(\fifo_buff_reg[3] [8]),
        .I2(\fifo_buff_reg[0] [8]),
        .I3(rd_ptr[1]),
        .I4(rd_ptr[0]),
        .I5(\fifo_buff_reg[1] [8]),
        .O(data_o0[8]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \data_o[9]_i_1 
       (.I0(data_o0[9]),
        .I1(\fifo_capacity[31]_i_2_n_0 ),
        .I2(tx_fifo_data_o[1]),
        .O(\data_o[9]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hCCFFAAF0CC00AAF0)) 
    \data_o[9]_i_2 
       (.I0(\fifo_buff_reg[2] [9]),
        .I1(\fifo_buff_reg[3] [9]),
        .I2(\fifo_buff_reg[0] [9]),
        .I3(rd_ptr[1]),
        .I4(rd_ptr[0]),
        .I5(\fifo_buff_reg[1] [9]),
        .O(data_o0[9]));
  FDCE \data_o_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset_0),
        .D(\data_o[0]_i_1_n_0 ),
        .Q(\data_o_reg[0]_0 ));
  FDCE \data_o_reg[8] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset_0),
        .D(\data_o[8]_i_1_n_0 ),
        .Q(tx_fifo_data_o[0]));
  FDCE \data_o_reg[9] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset_0),
        .D(\data_o[9]_i_1_n_0 ),
        .Q(tx_fifo_data_o[1]));
  LUT5 #(
    .INIT(32'hFEFF0200)) 
    \fifo_buff[0][0]_i_1 
       (.I0(data_i[0]),
        .I1(wr_ptr[1]),
        .I2(wr_ptr[0]),
        .I3(wr_ptr_0),
        .I4(\fifo_buff_reg[0] [0]),
        .O(\fifo_buff[0][0]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFEFF0200)) 
    \fifo_buff[0][8]_i_1 
       (.I0(data_i[1]),
        .I1(wr_ptr[1]),
        .I2(wr_ptr[0]),
        .I3(wr_ptr_0),
        .I4(\fifo_buff_reg[0] [8]),
        .O(\fifo_buff[0][8]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFEFF0200)) 
    \fifo_buff[0][9]_i_1 
       (.I0(data_i[2]),
        .I1(wr_ptr[1]),
        .I2(wr_ptr[0]),
        .I3(wr_ptr_0),
        .I4(\fifo_buff_reg[0] [9]),
        .O(\fifo_buff[0][9]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hEFFF2000)) 
    \fifo_buff[1][0]_i_1 
       (.I0(data_i[0]),
        .I1(wr_ptr[1]),
        .I2(wr_ptr[0]),
        .I3(wr_ptr_0),
        .I4(\fifo_buff_reg[1] [0]),
        .O(\fifo_buff[1][0]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hEFFF2000)) 
    \fifo_buff[1][8]_i_1 
       (.I0(data_i[1]),
        .I1(wr_ptr[1]),
        .I2(wr_ptr[0]),
        .I3(wr_ptr_0),
        .I4(\fifo_buff_reg[1] [8]),
        .O(\fifo_buff[1][8]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hEFFF2000)) 
    \fifo_buff[1][9]_i_1 
       (.I0(data_i[2]),
        .I1(wr_ptr[1]),
        .I2(wr_ptr[0]),
        .I3(wr_ptr_0),
        .I4(\fifo_buff_reg[1] [9]),
        .O(\fifo_buff[1][9]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hEFFF2000)) 
    \fifo_buff[2][0]_i_1 
       (.I0(data_i[0]),
        .I1(wr_ptr[0]),
        .I2(wr_ptr[1]),
        .I3(wr_ptr_0),
        .I4(\fifo_buff_reg[2] [0]),
        .O(\fifo_buff[2][0]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hEFFF2000)) 
    \fifo_buff[2][8]_i_1 
       (.I0(data_i[1]),
        .I1(wr_ptr[0]),
        .I2(wr_ptr[1]),
        .I3(wr_ptr_0),
        .I4(\fifo_buff_reg[2] [8]),
        .O(\fifo_buff[2][8]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hEFFF2000)) 
    \fifo_buff[2][9]_i_1 
       (.I0(data_i[2]),
        .I1(wr_ptr[0]),
        .I2(wr_ptr[1]),
        .I3(wr_ptr_0),
        .I4(\fifo_buff_reg[2] [9]),
        .O(\fifo_buff[2][9]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hBFFF8000)) 
    \fifo_buff[3][0]_i_1 
       (.I0(data_i[0]),
        .I1(wr_ptr[1]),
        .I2(wr_ptr[0]),
        .I3(wr_ptr_0),
        .I4(\fifo_buff_reg[3] [0]),
        .O(\fifo_buff[3][0]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hBFFF8000)) 
    \fifo_buff[3][8]_i_1 
       (.I0(data_i[1]),
        .I1(wr_ptr[1]),
        .I2(wr_ptr[0]),
        .I3(wr_ptr_0),
        .I4(\fifo_buff_reg[3] [8]),
        .O(\fifo_buff[3][8]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hBFFF8000)) 
    \fifo_buff[3][9]_i_1 
       (.I0(data_i[2]),
        .I1(wr_ptr[1]),
        .I2(wr_ptr[0]),
        .I3(wr_ptr_0),
        .I4(\fifo_buff_reg[3] [9]),
        .O(\fifo_buff[3][9]_i_1_n_0 ));
  FDRE \fifo_buff_reg[0][0] 
       (.C(clk),
        .CE(1'b1),
        .D(\fifo_buff[0][0]_i_1_n_0 ),
        .Q(\fifo_buff_reg[0] [0]),
        .R(1'b0));
  FDRE \fifo_buff_reg[0][8] 
       (.C(clk),
        .CE(1'b1),
        .D(\fifo_buff[0][8]_i_1_n_0 ),
        .Q(\fifo_buff_reg[0] [8]),
        .R(1'b0));
  FDRE \fifo_buff_reg[0][9] 
       (.C(clk),
        .CE(1'b1),
        .D(\fifo_buff[0][9]_i_1_n_0 ),
        .Q(\fifo_buff_reg[0] [9]),
        .R(1'b0));
  FDRE \fifo_buff_reg[1][0] 
       (.C(clk),
        .CE(1'b1),
        .D(\fifo_buff[1][0]_i_1_n_0 ),
        .Q(\fifo_buff_reg[1] [0]),
        .R(1'b0));
  FDRE \fifo_buff_reg[1][8] 
       (.C(clk),
        .CE(1'b1),
        .D(\fifo_buff[1][8]_i_1_n_0 ),
        .Q(\fifo_buff_reg[1] [8]),
        .R(1'b0));
  FDRE \fifo_buff_reg[1][9] 
       (.C(clk),
        .CE(1'b1),
        .D(\fifo_buff[1][9]_i_1_n_0 ),
        .Q(\fifo_buff_reg[1] [9]),
        .R(1'b0));
  FDRE \fifo_buff_reg[2][0] 
       (.C(clk),
        .CE(1'b1),
        .D(\fifo_buff[2][0]_i_1_n_0 ),
        .Q(\fifo_buff_reg[2] [0]),
        .R(1'b0));
  FDRE \fifo_buff_reg[2][8] 
       (.C(clk),
        .CE(1'b1),
        .D(\fifo_buff[2][8]_i_1_n_0 ),
        .Q(\fifo_buff_reg[2] [8]),
        .R(1'b0));
  FDRE \fifo_buff_reg[2][9] 
       (.C(clk),
        .CE(1'b1),
        .D(\fifo_buff[2][9]_i_1_n_0 ),
        .Q(\fifo_buff_reg[2] [9]),
        .R(1'b0));
  FDRE \fifo_buff_reg[3][0] 
       (.C(clk),
        .CE(1'b1),
        .D(\fifo_buff[3][0]_i_1_n_0 ),
        .Q(\fifo_buff_reg[3] [0]),
        .R(1'b0));
  FDRE \fifo_buff_reg[3][8] 
       (.C(clk),
        .CE(1'b1),
        .D(\fifo_buff[3][8]_i_1_n_0 ),
        .Q(\fifo_buff_reg[3] [8]),
        .R(1'b0));
  FDRE \fifo_buff_reg[3][9] 
       (.C(clk),
        .CE(1'b1),
        .D(\fifo_buff[3][9]_i_1_n_0 ),
        .Q(\fifo_buff_reg[3] [9]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 fifo_capacity0_carry
       (.CI(1'b0),
        .CO({fifo_capacity0_carry_n_0,fifo_capacity0_carry_n_1,fifo_capacity0_carry_n_2,fifo_capacity0_carry_n_3}),
        .CYINIT(fifo_capacity0_carry_i_1_n_7),
        .DI({fifo_capacity0_carry_i_2_n_7,fifo_capacity0_carry_i_1_n_4,fifo_capacity0_carry_i_1_n_5,fifo_capacity0_carry_i_1_n_6}),
        .O(fifo_capacity0[4:1]),
        .S({fifo_capacity0_carry_i_3_n_0,fifo_capacity0_carry_i_4_n_0,fifo_capacity0_carry_i_5_n_0,fifo_capacity0_carry_i_6_n_0}));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 fifo_capacity0_carry__0
       (.CI(fifo_capacity0_carry_n_0),
        .CO({fifo_capacity0_carry__0_n_0,fifo_capacity0_carry__0_n_1,fifo_capacity0_carry__0_n_2,fifo_capacity0_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({fifo_capacity0_carry__0_i_1_n_7,fifo_capacity0_carry_i_2_n_4,fifo_capacity0_carry_i_2_n_5,fifo_capacity0_carry_i_2_n_6}),
        .O(fifo_capacity0[8:5]),
        .S({fifo_capacity0_carry__0_i_2_n_0,fifo_capacity0_carry__0_i_3_n_0,fifo_capacity0_carry__0_i_4_n_0,fifo_capacity0_carry__0_i_5_n_0}));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 fifo_capacity0_carry__0_i_1
       (.CI(fifo_capacity0_carry_i_2_n_0),
        .CO({fifo_capacity0_carry__0_i_1_n_0,fifo_capacity0_carry__0_i_1_n_1,fifo_capacity0_carry__0_i_1_n_2,fifo_capacity0_carry__0_i_1_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({fifo_capacity0_carry__0_i_1_n_4,fifo_capacity0_carry__0_i_1_n_5,fifo_capacity0_carry__0_i_1_n_6,fifo_capacity0_carry__0_i_1_n_7}),
        .S(fifo_capacity[11:8]));
  LUT1 #(
    .INIT(2'h1)) 
    fifo_capacity0_carry__0_i_2
       (.I0(fifo_capacity0_carry__0_i_1_n_7),
        .O(fifo_capacity0_carry__0_i_2_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    fifo_capacity0_carry__0_i_3
       (.I0(fifo_capacity0_carry_i_2_n_4),
        .O(fifo_capacity0_carry__0_i_3_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    fifo_capacity0_carry__0_i_4
       (.I0(fifo_capacity0_carry_i_2_n_5),
        .O(fifo_capacity0_carry__0_i_4_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    fifo_capacity0_carry__0_i_5
       (.I0(fifo_capacity0_carry_i_2_n_6),
        .O(fifo_capacity0_carry__0_i_5_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 fifo_capacity0_carry__1
       (.CI(fifo_capacity0_carry__0_n_0),
        .CO({fifo_capacity0_carry__1_n_0,fifo_capacity0_carry__1_n_1,fifo_capacity0_carry__1_n_2,fifo_capacity0_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI({fifo_capacity0_carry__1_i_1_n_7,fifo_capacity0_carry__0_i_1_n_4,fifo_capacity0_carry__0_i_1_n_5,fifo_capacity0_carry__0_i_1_n_6}),
        .O(fifo_capacity0[12:9]),
        .S({fifo_capacity0_carry__1_i_2_n_0,fifo_capacity0_carry__1_i_3_n_0,fifo_capacity0_carry__1_i_4_n_0,fifo_capacity0_carry__1_i_5_n_0}));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 fifo_capacity0_carry__1_i_1
       (.CI(fifo_capacity0_carry__0_i_1_n_0),
        .CO({fifo_capacity0_carry__1_i_1_n_0,fifo_capacity0_carry__1_i_1_n_1,fifo_capacity0_carry__1_i_1_n_2,fifo_capacity0_carry__1_i_1_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({fifo_capacity0_carry__1_i_1_n_4,fifo_capacity0_carry__1_i_1_n_5,fifo_capacity0_carry__1_i_1_n_6,fifo_capacity0_carry__1_i_1_n_7}),
        .S(fifo_capacity[15:12]));
  LUT1 #(
    .INIT(2'h1)) 
    fifo_capacity0_carry__1_i_2
       (.I0(fifo_capacity0_carry__1_i_1_n_7),
        .O(fifo_capacity0_carry__1_i_2_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    fifo_capacity0_carry__1_i_3
       (.I0(fifo_capacity0_carry__0_i_1_n_4),
        .O(fifo_capacity0_carry__1_i_3_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    fifo_capacity0_carry__1_i_4
       (.I0(fifo_capacity0_carry__0_i_1_n_5),
        .O(fifo_capacity0_carry__1_i_4_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    fifo_capacity0_carry__1_i_5
       (.I0(fifo_capacity0_carry__0_i_1_n_6),
        .O(fifo_capacity0_carry__1_i_5_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 fifo_capacity0_carry__2
       (.CI(fifo_capacity0_carry__1_n_0),
        .CO({fifo_capacity0_carry__2_n_0,fifo_capacity0_carry__2_n_1,fifo_capacity0_carry__2_n_2,fifo_capacity0_carry__2_n_3}),
        .CYINIT(1'b0),
        .DI({fifo_capacity0_carry__2_i_1_n_7,fifo_capacity0_carry__1_i_1_n_4,fifo_capacity0_carry__1_i_1_n_5,fifo_capacity0_carry__1_i_1_n_6}),
        .O(fifo_capacity0[16:13]),
        .S({fifo_capacity0_carry__2_i_2_n_0,fifo_capacity0_carry__2_i_3_n_0,fifo_capacity0_carry__2_i_4_n_0,fifo_capacity0_carry__2_i_5_n_0}));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 fifo_capacity0_carry__2_i_1
       (.CI(fifo_capacity0_carry__1_i_1_n_0),
        .CO({fifo_capacity0_carry__2_i_1_n_0,fifo_capacity0_carry__2_i_1_n_1,fifo_capacity0_carry__2_i_1_n_2,fifo_capacity0_carry__2_i_1_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({fifo_capacity0_carry__2_i_1_n_4,fifo_capacity0_carry__2_i_1_n_5,fifo_capacity0_carry__2_i_1_n_6,fifo_capacity0_carry__2_i_1_n_7}),
        .S(fifo_capacity[19:16]));
  LUT1 #(
    .INIT(2'h1)) 
    fifo_capacity0_carry__2_i_2
       (.I0(fifo_capacity0_carry__2_i_1_n_7),
        .O(fifo_capacity0_carry__2_i_2_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    fifo_capacity0_carry__2_i_3
       (.I0(fifo_capacity0_carry__1_i_1_n_4),
        .O(fifo_capacity0_carry__2_i_3_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    fifo_capacity0_carry__2_i_4
       (.I0(fifo_capacity0_carry__1_i_1_n_5),
        .O(fifo_capacity0_carry__2_i_4_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    fifo_capacity0_carry__2_i_5
       (.I0(fifo_capacity0_carry__1_i_1_n_6),
        .O(fifo_capacity0_carry__2_i_5_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 fifo_capacity0_carry__3
       (.CI(fifo_capacity0_carry__2_n_0),
        .CO({fifo_capacity0_carry__3_n_0,fifo_capacity0_carry__3_n_1,fifo_capacity0_carry__3_n_2,fifo_capacity0_carry__3_n_3}),
        .CYINIT(1'b0),
        .DI({fifo_capacity0_carry__3_i_1_n_7,fifo_capacity0_carry__2_i_1_n_4,fifo_capacity0_carry__2_i_1_n_5,fifo_capacity0_carry__2_i_1_n_6}),
        .O(fifo_capacity0[20:17]),
        .S({fifo_capacity0_carry__3_i_2_n_0,fifo_capacity0_carry__3_i_3_n_0,fifo_capacity0_carry__3_i_4_n_0,fifo_capacity0_carry__3_i_5_n_0}));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 fifo_capacity0_carry__3_i_1
       (.CI(fifo_capacity0_carry__2_i_1_n_0),
        .CO({fifo_capacity0_carry__3_i_1_n_0,fifo_capacity0_carry__3_i_1_n_1,fifo_capacity0_carry__3_i_1_n_2,fifo_capacity0_carry__3_i_1_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({fifo_capacity0_carry__3_i_1_n_4,fifo_capacity0_carry__3_i_1_n_5,fifo_capacity0_carry__3_i_1_n_6,fifo_capacity0_carry__3_i_1_n_7}),
        .S(fifo_capacity[23:20]));
  LUT1 #(
    .INIT(2'h1)) 
    fifo_capacity0_carry__3_i_2
       (.I0(fifo_capacity0_carry__3_i_1_n_7),
        .O(fifo_capacity0_carry__3_i_2_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    fifo_capacity0_carry__3_i_3
       (.I0(fifo_capacity0_carry__2_i_1_n_4),
        .O(fifo_capacity0_carry__3_i_3_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    fifo_capacity0_carry__3_i_4
       (.I0(fifo_capacity0_carry__2_i_1_n_5),
        .O(fifo_capacity0_carry__3_i_4_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    fifo_capacity0_carry__3_i_5
       (.I0(fifo_capacity0_carry__2_i_1_n_6),
        .O(fifo_capacity0_carry__3_i_5_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 fifo_capacity0_carry__4
       (.CI(fifo_capacity0_carry__3_n_0),
        .CO({fifo_capacity0_carry__4_n_0,fifo_capacity0_carry__4_n_1,fifo_capacity0_carry__4_n_2,fifo_capacity0_carry__4_n_3}),
        .CYINIT(1'b0),
        .DI({fifo_capacity0_carry__4_i_1_n_7,fifo_capacity0_carry__3_i_1_n_4,fifo_capacity0_carry__3_i_1_n_5,fifo_capacity0_carry__3_i_1_n_6}),
        .O(fifo_capacity0[24:21]),
        .S({fifo_capacity0_carry__4_i_2_n_0,fifo_capacity0_carry__4_i_3_n_0,fifo_capacity0_carry__4_i_4_n_0,fifo_capacity0_carry__4_i_5_n_0}));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 fifo_capacity0_carry__4_i_1
       (.CI(fifo_capacity0_carry__3_i_1_n_0),
        .CO({fifo_capacity0_carry__4_i_1_n_0,fifo_capacity0_carry__4_i_1_n_1,fifo_capacity0_carry__4_i_1_n_2,fifo_capacity0_carry__4_i_1_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({fifo_capacity0_carry__4_i_1_n_4,fifo_capacity0_carry__4_i_1_n_5,fifo_capacity0_carry__4_i_1_n_6,fifo_capacity0_carry__4_i_1_n_7}),
        .S(fifo_capacity[27:24]));
  LUT1 #(
    .INIT(2'h1)) 
    fifo_capacity0_carry__4_i_2
       (.I0(fifo_capacity0_carry__4_i_1_n_7),
        .O(fifo_capacity0_carry__4_i_2_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    fifo_capacity0_carry__4_i_3
       (.I0(fifo_capacity0_carry__3_i_1_n_4),
        .O(fifo_capacity0_carry__4_i_3_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    fifo_capacity0_carry__4_i_4
       (.I0(fifo_capacity0_carry__3_i_1_n_5),
        .O(fifo_capacity0_carry__4_i_4_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    fifo_capacity0_carry__4_i_5
       (.I0(fifo_capacity0_carry__3_i_1_n_6),
        .O(fifo_capacity0_carry__4_i_5_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 fifo_capacity0_carry__5
       (.CI(fifo_capacity0_carry__4_n_0),
        .CO({fifo_capacity0_carry__5_n_0,fifo_capacity0_carry__5_n_1,fifo_capacity0_carry__5_n_2,fifo_capacity0_carry__5_n_3}),
        .CYINIT(1'b0),
        .DI({fifo_capacity0_carry__5_i_1_n_7,fifo_capacity0_carry__4_i_1_n_4,fifo_capacity0_carry__4_i_1_n_5,fifo_capacity0_carry__4_i_1_n_6}),
        .O(fifo_capacity0[28:25]),
        .S({fifo_capacity0_carry__5_i_2_n_0,fifo_capacity0_carry__5_i_3_n_0,fifo_capacity0_carry__5_i_4_n_0,fifo_capacity0_carry__5_i_5_n_0}));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 fifo_capacity0_carry__5_i_1
       (.CI(fifo_capacity0_carry__4_i_1_n_0),
        .CO({NLW_fifo_capacity0_carry__5_i_1_CO_UNCONNECTED[3],fifo_capacity0_carry__5_i_1_n_1,fifo_capacity0_carry__5_i_1_n_2,fifo_capacity0_carry__5_i_1_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({fifo_capacity0_carry__5_i_1_n_4,fifo_capacity0_carry__5_i_1_n_5,fifo_capacity0_carry__5_i_1_n_6,fifo_capacity0_carry__5_i_1_n_7}),
        .S(fifo_capacity[31:28]));
  LUT1 #(
    .INIT(2'h1)) 
    fifo_capacity0_carry__5_i_2
       (.I0(fifo_capacity0_carry__5_i_1_n_7),
        .O(fifo_capacity0_carry__5_i_2_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    fifo_capacity0_carry__5_i_3
       (.I0(fifo_capacity0_carry__4_i_1_n_4),
        .O(fifo_capacity0_carry__5_i_3_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    fifo_capacity0_carry__5_i_4
       (.I0(fifo_capacity0_carry__4_i_1_n_5),
        .O(fifo_capacity0_carry__5_i_4_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    fifo_capacity0_carry__5_i_5
       (.I0(fifo_capacity0_carry__4_i_1_n_6),
        .O(fifo_capacity0_carry__5_i_5_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 fifo_capacity0_carry__6
       (.CI(fifo_capacity0_carry__5_n_0),
        .CO({NLW_fifo_capacity0_carry__6_CO_UNCONNECTED[3:2],fifo_capacity0_carry__6_n_2,fifo_capacity0_carry__6_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,fifo_capacity0_carry__5_i_1_n_5,fifo_capacity0_carry__5_i_1_n_6}),
        .O({NLW_fifo_capacity0_carry__6_O_UNCONNECTED[3],fifo_capacity0[31:29]}),
        .S({1'b0,fifo_capacity0_carry__6_i_1_n_0,fifo_capacity0_carry__6_i_2_n_0,fifo_capacity0_carry__6_i_3_n_0}));
  LUT1 #(
    .INIT(2'h1)) 
    fifo_capacity0_carry__6_i_1
       (.I0(fifo_capacity0_carry__5_i_1_n_4),
        .O(fifo_capacity0_carry__6_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    fifo_capacity0_carry__6_i_2
       (.I0(fifo_capacity0_carry__5_i_1_n_5),
        .O(fifo_capacity0_carry__6_i_2_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    fifo_capacity0_carry__6_i_3
       (.I0(fifo_capacity0_carry__5_i_1_n_6),
        .O(fifo_capacity0_carry__6_i_3_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 fifo_capacity0_carry_i_1
       (.CI(1'b0),
        .CO({fifo_capacity0_carry_i_1_n_0,fifo_capacity0_carry_i_1_n_1,fifo_capacity0_carry_i_1_n_2,fifo_capacity0_carry_i_1_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,fifo_capacity[0]}),
        .O({fifo_capacity0_carry_i_1_n_4,fifo_capacity0_carry_i_1_n_5,fifo_capacity0_carry_i_1_n_6,fifo_capacity0_carry_i_1_n_7}),
        .S({fifo_capacity[3:1],fifo_capacity0_carry_i_7_n_0}));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 fifo_capacity0_carry_i_2
       (.CI(fifo_capacity0_carry_i_1_n_0),
        .CO({fifo_capacity0_carry_i_2_n_0,fifo_capacity0_carry_i_2_n_1,fifo_capacity0_carry_i_2_n_2,fifo_capacity0_carry_i_2_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({fifo_capacity0_carry_i_2_n_4,fifo_capacity0_carry_i_2_n_5,fifo_capacity0_carry_i_2_n_6,fifo_capacity0_carry_i_2_n_7}),
        .S(fifo_capacity[7:4]));
  LUT1 #(
    .INIT(2'h1)) 
    fifo_capacity0_carry_i_3
       (.I0(fifo_capacity0_carry_i_2_n_7),
        .O(fifo_capacity0_carry_i_3_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    fifo_capacity0_carry_i_4
       (.I0(fifo_capacity0_carry_i_1_n_4),
        .O(fifo_capacity0_carry_i_4_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    fifo_capacity0_carry_i_5
       (.I0(fifo_capacity0_carry_i_1_n_5),
        .O(fifo_capacity0_carry_i_5_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    fifo_capacity0_carry_i_6
       (.I0(fifo_capacity0_carry_i_1_n_6),
        .O(fifo_capacity0_carry_i_6_n_0));
  LUT6 #(
    .INIT(64'h0100FFFFFEFF0000)) 
    fifo_capacity0_carry_i_7
       (.I0(read_reg_i_2_n_0),
        .I1(read_reg_i_3_n_0),
        .I2(read_reg_i_4_n_0),
        .I3(fifo_capacity[2]),
        .I4(wr),
        .I5(fifo_capacity[0]),
        .O(fifo_capacity0_carry_i_7_n_0));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h9)) 
    \fifo_capacity[0]_i_1 
       (.I0(\fifo_capacity[31]_i_2_n_0 ),
        .I1(fifo_capacity0_carry_i_1_n_7),
        .O(\fifo_capacity[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifo_capacity[10]_i_1 
       (.I0(fifo_capacity0_carry__0_i_1_n_5),
        .I1(\fifo_capacity[31]_i_2_n_0 ),
        .I2(fifo_capacity0[10]),
        .O(\fifo_capacity[10]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifo_capacity[11]_i_1 
       (.I0(fifo_capacity0_carry__0_i_1_n_4),
        .I1(\fifo_capacity[31]_i_2_n_0 ),
        .I2(fifo_capacity0[11]),
        .O(\fifo_capacity[11]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifo_capacity[12]_i_1 
       (.I0(fifo_capacity0_carry__1_i_1_n_7),
        .I1(\fifo_capacity[31]_i_2_n_0 ),
        .I2(fifo_capacity0[12]),
        .O(\fifo_capacity[12]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifo_capacity[13]_i_1 
       (.I0(fifo_capacity0_carry__1_i_1_n_6),
        .I1(\fifo_capacity[31]_i_2_n_0 ),
        .I2(fifo_capacity0[13]),
        .O(\fifo_capacity[13]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifo_capacity[14]_i_1 
       (.I0(fifo_capacity0_carry__1_i_1_n_5),
        .I1(\fifo_capacity[31]_i_2_n_0 ),
        .I2(fifo_capacity0[14]),
        .O(\fifo_capacity[14]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifo_capacity[15]_i_1 
       (.I0(fifo_capacity0_carry__1_i_1_n_4),
        .I1(\fifo_capacity[31]_i_2_n_0 ),
        .I2(fifo_capacity0[15]),
        .O(\fifo_capacity[15]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifo_capacity[16]_i_1 
       (.I0(fifo_capacity0_carry__2_i_1_n_7),
        .I1(\fifo_capacity[31]_i_2_n_0 ),
        .I2(fifo_capacity0[16]),
        .O(\fifo_capacity[16]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifo_capacity[17]_i_1 
       (.I0(fifo_capacity0_carry__2_i_1_n_6),
        .I1(\fifo_capacity[31]_i_2_n_0 ),
        .I2(fifo_capacity0[17]),
        .O(\fifo_capacity[17]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifo_capacity[18]_i_1 
       (.I0(fifo_capacity0_carry__2_i_1_n_5),
        .I1(\fifo_capacity[31]_i_2_n_0 ),
        .I2(fifo_capacity0[18]),
        .O(\fifo_capacity[18]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifo_capacity[19]_i_1 
       (.I0(fifo_capacity0_carry__2_i_1_n_4),
        .I1(\fifo_capacity[31]_i_2_n_0 ),
        .I2(fifo_capacity0[19]),
        .O(\fifo_capacity[19]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifo_capacity[1]_i_1 
       (.I0(fifo_capacity0_carry_i_1_n_6),
        .I1(\fifo_capacity[31]_i_2_n_0 ),
        .I2(fifo_capacity0[1]),
        .O(\fifo_capacity[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifo_capacity[20]_i_1 
       (.I0(fifo_capacity0_carry__3_i_1_n_7),
        .I1(\fifo_capacity[31]_i_2_n_0 ),
        .I2(fifo_capacity0[20]),
        .O(\fifo_capacity[20]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifo_capacity[21]_i_1 
       (.I0(fifo_capacity0_carry__3_i_1_n_6),
        .I1(\fifo_capacity[31]_i_2_n_0 ),
        .I2(fifo_capacity0[21]),
        .O(\fifo_capacity[21]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifo_capacity[22]_i_1 
       (.I0(fifo_capacity0_carry__3_i_1_n_5),
        .I1(\fifo_capacity[31]_i_2_n_0 ),
        .I2(fifo_capacity0[22]),
        .O(\fifo_capacity[22]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifo_capacity[23]_i_1 
       (.I0(fifo_capacity0_carry__3_i_1_n_4),
        .I1(\fifo_capacity[31]_i_2_n_0 ),
        .I2(fifo_capacity0[23]),
        .O(\fifo_capacity[23]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifo_capacity[24]_i_1 
       (.I0(fifo_capacity0_carry__4_i_1_n_7),
        .I1(\fifo_capacity[31]_i_2_n_0 ),
        .I2(fifo_capacity0[24]),
        .O(\fifo_capacity[24]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifo_capacity[25]_i_1 
       (.I0(fifo_capacity0_carry__4_i_1_n_6),
        .I1(\fifo_capacity[31]_i_2_n_0 ),
        .I2(fifo_capacity0[25]),
        .O(\fifo_capacity[25]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifo_capacity[26]_i_1 
       (.I0(fifo_capacity0_carry__4_i_1_n_5),
        .I1(\fifo_capacity[31]_i_2_n_0 ),
        .I2(fifo_capacity0[26]),
        .O(\fifo_capacity[26]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifo_capacity[27]_i_1 
       (.I0(fifo_capacity0_carry__4_i_1_n_4),
        .I1(\fifo_capacity[31]_i_2_n_0 ),
        .I2(fifo_capacity0[27]),
        .O(\fifo_capacity[27]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifo_capacity[28]_i_1 
       (.I0(fifo_capacity0_carry__5_i_1_n_7),
        .I1(\fifo_capacity[31]_i_2_n_0 ),
        .I2(fifo_capacity0[28]),
        .O(\fifo_capacity[28]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifo_capacity[29]_i_1 
       (.I0(fifo_capacity0_carry__5_i_1_n_6),
        .I1(\fifo_capacity[31]_i_2_n_0 ),
        .I2(fifo_capacity0[29]),
        .O(\fifo_capacity[29]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifo_capacity[2]_i_1 
       (.I0(fifo_capacity0_carry_i_1_n_5),
        .I1(\fifo_capacity[31]_i_2_n_0 ),
        .I2(fifo_capacity0[2]),
        .O(\fifo_capacity[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifo_capacity[30]_i_1 
       (.I0(fifo_capacity0_carry__5_i_1_n_5),
        .I1(\fifo_capacity[31]_i_2_n_0 ),
        .I2(fifo_capacity0[30]),
        .O(\fifo_capacity[30]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifo_capacity[31]_i_1 
       (.I0(fifo_capacity0_carry__5_i_1_n_4),
        .I1(\fifo_capacity[31]_i_2_n_0 ),
        .I2(fifo_capacity0[31]),
        .O(\fifo_capacity[31]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h0001FFFF)) 
    \fifo_capacity[31]_i_2 
       (.I0(fifo_capacity[2]),
        .I1(read_reg_i_4_n_0),
        .I2(read_reg_i_3_n_0),
        .I3(read_reg_i_2_n_0),
        .I4(read),
        .O(\fifo_capacity[31]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifo_capacity[3]_i_1 
       (.I0(fifo_capacity0_carry_i_1_n_4),
        .I1(\fifo_capacity[31]_i_2_n_0 ),
        .I2(fifo_capacity0[3]),
        .O(\fifo_capacity[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifo_capacity[4]_i_1 
       (.I0(fifo_capacity0_carry_i_2_n_7),
        .I1(\fifo_capacity[31]_i_2_n_0 ),
        .I2(fifo_capacity0[4]),
        .O(\fifo_capacity[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifo_capacity[5]_i_1 
       (.I0(fifo_capacity0_carry_i_2_n_6),
        .I1(\fifo_capacity[31]_i_2_n_0 ),
        .I2(fifo_capacity0[5]),
        .O(\fifo_capacity[5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifo_capacity[6]_i_1 
       (.I0(fifo_capacity0_carry_i_2_n_5),
        .I1(\fifo_capacity[31]_i_2_n_0 ),
        .I2(fifo_capacity0[6]),
        .O(\fifo_capacity[6]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifo_capacity[7]_i_1 
       (.I0(fifo_capacity0_carry_i_2_n_4),
        .I1(\fifo_capacity[31]_i_2_n_0 ),
        .I2(fifo_capacity0[7]),
        .O(\fifo_capacity[7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifo_capacity[8]_i_1 
       (.I0(fifo_capacity0_carry__0_i_1_n_7),
        .I1(\fifo_capacity[31]_i_2_n_0 ),
        .I2(fifo_capacity0[8]),
        .O(\fifo_capacity[8]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \fifo_capacity[9]_i_1 
       (.I0(fifo_capacity0_carry__0_i_1_n_6),
        .I1(\fifo_capacity[31]_i_2_n_0 ),
        .I2(fifo_capacity0[9]),
        .O(\fifo_capacity[9]_i_1_n_0 ));
  FDCE \fifo_capacity_reg[0] 
       (.C(clk),
        .CE(reset),
        .CLR(reset_0),
        .D(\fifo_capacity[0]_i_1_n_0 ),
        .Q(fifo_capacity[0]));
  FDCE \fifo_capacity_reg[10] 
       (.C(clk),
        .CE(reset),
        .CLR(reset_0),
        .D(\fifo_capacity[10]_i_1_n_0 ),
        .Q(fifo_capacity[10]));
  FDCE \fifo_capacity_reg[11] 
       (.C(clk),
        .CE(reset),
        .CLR(reset_0),
        .D(\fifo_capacity[11]_i_1_n_0 ),
        .Q(fifo_capacity[11]));
  FDCE \fifo_capacity_reg[12] 
       (.C(clk),
        .CE(reset),
        .CLR(reset_0),
        .D(\fifo_capacity[12]_i_1_n_0 ),
        .Q(fifo_capacity[12]));
  FDCE \fifo_capacity_reg[13] 
       (.C(clk),
        .CE(reset),
        .CLR(reset_0),
        .D(\fifo_capacity[13]_i_1_n_0 ),
        .Q(fifo_capacity[13]));
  FDCE \fifo_capacity_reg[14] 
       (.C(clk),
        .CE(reset),
        .CLR(reset_0),
        .D(\fifo_capacity[14]_i_1_n_0 ),
        .Q(fifo_capacity[14]));
  FDCE \fifo_capacity_reg[15] 
       (.C(clk),
        .CE(reset),
        .CLR(reset_0),
        .D(\fifo_capacity[15]_i_1_n_0 ),
        .Q(fifo_capacity[15]));
  FDCE \fifo_capacity_reg[16] 
       (.C(clk),
        .CE(reset),
        .CLR(reset_0),
        .D(\fifo_capacity[16]_i_1_n_0 ),
        .Q(fifo_capacity[16]));
  FDCE \fifo_capacity_reg[17] 
       (.C(clk),
        .CE(reset),
        .CLR(reset_0),
        .D(\fifo_capacity[17]_i_1_n_0 ),
        .Q(fifo_capacity[17]));
  FDCE \fifo_capacity_reg[18] 
       (.C(clk),
        .CE(reset),
        .CLR(reset_0),
        .D(\fifo_capacity[18]_i_1_n_0 ),
        .Q(fifo_capacity[18]));
  FDCE \fifo_capacity_reg[19] 
       (.C(clk),
        .CE(reset),
        .CLR(reset_0),
        .D(\fifo_capacity[19]_i_1_n_0 ),
        .Q(fifo_capacity[19]));
  FDCE \fifo_capacity_reg[1] 
       (.C(clk),
        .CE(reset),
        .CLR(reset_0),
        .D(\fifo_capacity[1]_i_1_n_0 ),
        .Q(fifo_capacity[1]));
  FDCE \fifo_capacity_reg[20] 
       (.C(clk),
        .CE(reset),
        .CLR(reset_0),
        .D(\fifo_capacity[20]_i_1_n_0 ),
        .Q(fifo_capacity[20]));
  FDCE \fifo_capacity_reg[21] 
       (.C(clk),
        .CE(reset),
        .CLR(reset_0),
        .D(\fifo_capacity[21]_i_1_n_0 ),
        .Q(fifo_capacity[21]));
  FDCE \fifo_capacity_reg[22] 
       (.C(clk),
        .CE(reset),
        .CLR(reset_0),
        .D(\fifo_capacity[22]_i_1_n_0 ),
        .Q(fifo_capacity[22]));
  FDCE \fifo_capacity_reg[23] 
       (.C(clk),
        .CE(reset),
        .CLR(reset_0),
        .D(\fifo_capacity[23]_i_1_n_0 ),
        .Q(fifo_capacity[23]));
  FDCE \fifo_capacity_reg[24] 
       (.C(clk),
        .CE(reset),
        .CLR(reset_0),
        .D(\fifo_capacity[24]_i_1_n_0 ),
        .Q(fifo_capacity[24]));
  FDCE \fifo_capacity_reg[25] 
       (.C(clk),
        .CE(reset),
        .CLR(reset_0),
        .D(\fifo_capacity[25]_i_1_n_0 ),
        .Q(fifo_capacity[25]));
  FDCE \fifo_capacity_reg[26] 
       (.C(clk),
        .CE(reset),
        .CLR(reset_0),
        .D(\fifo_capacity[26]_i_1_n_0 ),
        .Q(fifo_capacity[26]));
  FDCE \fifo_capacity_reg[27] 
       (.C(clk),
        .CE(reset),
        .CLR(reset_0),
        .D(\fifo_capacity[27]_i_1_n_0 ),
        .Q(fifo_capacity[27]));
  FDCE \fifo_capacity_reg[28] 
       (.C(clk),
        .CE(reset),
        .CLR(reset_0),
        .D(\fifo_capacity[28]_i_1_n_0 ),
        .Q(fifo_capacity[28]));
  FDCE \fifo_capacity_reg[29] 
       (.C(clk),
        .CE(reset),
        .CLR(reset_0),
        .D(\fifo_capacity[29]_i_1_n_0 ),
        .Q(fifo_capacity[29]));
  FDCE \fifo_capacity_reg[2] 
       (.C(clk),
        .CE(reset),
        .CLR(reset_0),
        .D(\fifo_capacity[2]_i_1_n_0 ),
        .Q(fifo_capacity[2]));
  FDCE \fifo_capacity_reg[30] 
       (.C(clk),
        .CE(reset),
        .CLR(reset_0),
        .D(\fifo_capacity[30]_i_1_n_0 ),
        .Q(fifo_capacity[30]));
  FDCE \fifo_capacity_reg[31] 
       (.C(clk),
        .CE(reset),
        .CLR(reset_0),
        .D(\fifo_capacity[31]_i_1_n_0 ),
        .Q(fifo_capacity[31]));
  FDCE \fifo_capacity_reg[3] 
       (.C(clk),
        .CE(reset),
        .CLR(reset_0),
        .D(\fifo_capacity[3]_i_1_n_0 ),
        .Q(fifo_capacity[3]));
  FDCE \fifo_capacity_reg[4] 
       (.C(clk),
        .CE(reset),
        .CLR(reset_0),
        .D(\fifo_capacity[4]_i_1_n_0 ),
        .Q(fifo_capacity[4]));
  FDCE \fifo_capacity_reg[5] 
       (.C(clk),
        .CE(reset),
        .CLR(reset_0),
        .D(\fifo_capacity[5]_i_1_n_0 ),
        .Q(fifo_capacity[5]));
  FDCE \fifo_capacity_reg[6] 
       (.C(clk),
        .CE(reset),
        .CLR(reset_0),
        .D(\fifo_capacity[6]_i_1_n_0 ),
        .Q(fifo_capacity[6]));
  FDCE \fifo_capacity_reg[7] 
       (.C(clk),
        .CE(reset),
        .CLR(reset_0),
        .D(\fifo_capacity[7]_i_1_n_0 ),
        .Q(fifo_capacity[7]));
  FDCE \fifo_capacity_reg[8] 
       (.C(clk),
        .CE(reset),
        .CLR(reset_0),
        .D(\fifo_capacity[8]_i_1_n_0 ),
        .Q(fifo_capacity[8]));
  FDCE \fifo_capacity_reg[9] 
       (.C(clk),
        .CE(reset),
        .CLR(reset_0),
        .D(\fifo_capacity[9]_i_1_n_0 ),
        .Q(fifo_capacity[9]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT3 #(
    .INIT(8'hB4)) 
    \rd_ptr[0]_i_1 
       (.I0(\fifo_capacity[31]_i_2_n_0 ),
        .I1(reset),
        .I2(rd_ptr[0]),
        .O(\rd_ptr[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'hF708)) 
    \rd_ptr[1]_i_1 
       (.I0(rd_ptr[0]),
        .I1(reset),
        .I2(\fifo_capacity[31]_i_2_n_0 ),
        .I3(rd_ptr[1]),
        .O(\rd_ptr[1]_i_1_n_0 ));
  FDCE \rd_ptr_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset_0),
        .D(\rd_ptr[0]_i_1_n_0 ),
        .Q(rd_ptr[0]));
  FDCE \rd_ptr_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset_0),
        .D(\rd_ptr[1]_i_1_n_0 ),
        .Q(rd_ptr[1]));
  LUT4 #(
    .INIT(16'hFFFE)) 
    read_reg_i_1
       (.I0(read_reg_i_2_n_0),
        .I1(read_reg_i_3_n_0),
        .I2(read_reg_i_4_n_0),
        .I3(fifo_capacity[2]),
        .O(\fifo_capacity_reg[2]_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    read_reg_i_2
       (.I0(read_reg_i_5_n_0),
        .I1(read_reg_i_6_n_0),
        .I2(fifo_capacity[31]),
        .I3(fifo_capacity[30]),
        .I4(fifo_capacity[0]),
        .I5(read_reg_i_7_n_0),
        .O(read_reg_i_2_n_0));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    read_reg_i_3
       (.I0(fifo_capacity[4]),
        .I1(fifo_capacity[5]),
        .I2(fifo_capacity[1]),
        .I3(fifo_capacity[3]),
        .I4(read_reg_i_8_n_0),
        .O(read_reg_i_3_n_0));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    read_reg_i_4
       (.I0(fifo_capacity[12]),
        .I1(fifo_capacity[13]),
        .I2(fifo_capacity[10]),
        .I3(fifo_capacity[11]),
        .I4(read_reg_i_9_n_0),
        .O(read_reg_i_4_n_0));
  LUT4 #(
    .INIT(16'hFFFE)) 
    read_reg_i_5
       (.I0(fifo_capacity[23]),
        .I1(fifo_capacity[22]),
        .I2(fifo_capacity[25]),
        .I3(fifo_capacity[24]),
        .O(read_reg_i_5_n_0));
  LUT4 #(
    .INIT(16'hFFFE)) 
    read_reg_i_6
       (.I0(fifo_capacity[19]),
        .I1(fifo_capacity[18]),
        .I2(fifo_capacity[21]),
        .I3(fifo_capacity[20]),
        .O(read_reg_i_6_n_0));
  LUT4 #(
    .INIT(16'hFFFE)) 
    read_reg_i_7
       (.I0(fifo_capacity[27]),
        .I1(fifo_capacity[26]),
        .I2(fifo_capacity[29]),
        .I3(fifo_capacity[28]),
        .O(read_reg_i_7_n_0));
  LUT4 #(
    .INIT(16'hFFFE)) 
    read_reg_i_8
       (.I0(fifo_capacity[7]),
        .I1(fifo_capacity[6]),
        .I2(fifo_capacity[9]),
        .I3(fifo_capacity[8]),
        .O(read_reg_i_8_n_0));
  LUT4 #(
    .INIT(16'hFFFE)) 
    read_reg_i_9
       (.I0(fifo_capacity[15]),
        .I1(fifo_capacity[14]),
        .I2(fifo_capacity[17]),
        .I3(fifo_capacity[16]),
        .O(read_reg_i_9_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    scl_reg_i_1
       (.I0(reset),
        .O(reset_0));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \wr_ptr[0]_i_1 
       (.I0(wr_ptr_0),
        .I1(wr_ptr[0]),
        .O(\wr_ptr[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \wr_ptr[1]_i_1 
       (.I0(wr_ptr[0]),
        .I1(wr_ptr_0),
        .I2(wr_ptr[1]),
        .O(\wr_ptr[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFD000000000000)) 
    \wr_ptr[1]_i_2 
       (.I0(fifo_capacity[2]),
        .I1(read_reg_i_4_n_0),
        .I2(read_reg_i_3_n_0),
        .I3(read_reg_i_2_n_0),
        .I4(wr),
        .I5(reset),
        .O(wr_ptr_0));
  FDCE \wr_ptr_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset_0),
        .D(\wr_ptr[0]_i_1_n_0 ),
        .Q(wr_ptr[0]));
  FDCE \wr_ptr_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .CLR(reset_0),
        .D(\wr_ptr[1]_i_1_n_0 ),
        .Q(wr_ptr[1]));
endmodule

(* ORIG_REF_NAME = "spi_wrapper" *) 
module display_spi_spi_wrapper_0_0_spi_wrapper
   (scl,
    csx,
    dcx,
    wr,
    reset,
    clk,
    data_i);
  output scl;
  output csx;
  output dcx;
  input wr;
  input reset;
  input clk;
  input [2:0]data_i;

  wire clk;
  wire csx;
  wire [2:0]data_i;
  wire dcx;
  wire reset;
  wire scl;
  wire wr;

  display_spi_spi_wrapper_0_0_spi spi_wrapped
       (.clk(clk),
        .csx(csx),
        .data_i(data_i),
        .dcx(dcx),
        .reset(reset),
        .scl(scl),
        .wr(wr));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
