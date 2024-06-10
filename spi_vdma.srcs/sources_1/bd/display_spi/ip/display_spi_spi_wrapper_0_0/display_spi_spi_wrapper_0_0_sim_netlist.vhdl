-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2020.1 (win64) Build 2902540 Wed May 27 19:54:49 MDT 2020
-- Date        : Fri Jun  7 14:46:16 2024
-- Host        : DESKTOP-EK1VLDO running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               c:/Users/ES/Desktop/spi_vdma/spi_vdma.srcs/sources_1/bd/display_spi/ip/display_spi_spi_wrapper_0_0/display_spi_spi_wrapper_0_0_sim_netlist.vhdl
-- Design      : display_spi_spi_wrapper_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z010clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity display_spi_spi_wrapper_0_0_scl_generator is
  port (
    scl : out STD_LOGIC;
    reset : in STD_LOGIC;
    scl_0 : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of display_spi_spi_wrapper_0_0_scl_generator : entity is "scl_generator";
end display_spi_spi_wrapper_0_0_scl_generator;

architecture STRUCTURE of display_spi_spi_wrapper_0_0_scl_generator is
  attribute OPT_MODIFIED : string;
  attribute OPT_MODIFIED of scl_reg : label is "MLO";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of scl_reg : label is "LD";
begin
scl_reg: unisim.vcomponents.LDCE
    generic map(
      INIT => '0',
      IS_G_INVERTED => '1'
    )
        port map (
      CLR => '0',
      D => reset,
      G => reset,
      GE => '1',
      Q => scl
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity display_spi_spi_wrapper_0_0_spi_fifo is
  port (
    reset_0 : out STD_LOGIC;
    tx_fifo_data_o : out STD_LOGIC_VECTOR ( 1 downto 0 );
    \data_o_reg[0]_0\ : out STD_LOGIC;
    \fifo_capacity_reg[2]_0\ : out STD_LOGIC;
    wr : in STD_LOGIC;
    reset : in STD_LOGIC;
    clk : in STD_LOGIC;
    data_i : in STD_LOGIC_VECTOR ( 2 downto 0 );
    read : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of display_spi_spi_wrapper_0_0_spi_fifo : entity is "spi_fifo";
end display_spi_spi_wrapper_0_0_spi_fifo;

architecture STRUCTURE of display_spi_spi_wrapper_0_0_spi_fifo is
  signal data_o0 : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal \data_o[0]_i_1_n_0\ : STD_LOGIC;
  signal \data_o[8]_i_1_n_0\ : STD_LOGIC;
  signal \data_o[9]_i_1_n_0\ : STD_LOGIC;
  signal \^data_o_reg[0]_0\ : STD_LOGIC;
  signal \fifo_buff[0][0]_i_1_n_0\ : STD_LOGIC;
  signal \fifo_buff[0][8]_i_1_n_0\ : STD_LOGIC;
  signal \fifo_buff[0][9]_i_1_n_0\ : STD_LOGIC;
  signal \fifo_buff[1][0]_i_1_n_0\ : STD_LOGIC;
  signal \fifo_buff[1][8]_i_1_n_0\ : STD_LOGIC;
  signal \fifo_buff[1][9]_i_1_n_0\ : STD_LOGIC;
  signal \fifo_buff[2][0]_i_1_n_0\ : STD_LOGIC;
  signal \fifo_buff[2][8]_i_1_n_0\ : STD_LOGIC;
  signal \fifo_buff[2][9]_i_1_n_0\ : STD_LOGIC;
  signal \fifo_buff[3][0]_i_1_n_0\ : STD_LOGIC;
  signal \fifo_buff[3][8]_i_1_n_0\ : STD_LOGIC;
  signal \fifo_buff[3][9]_i_1_n_0\ : STD_LOGIC;
  signal \fifo_buff_reg[0]\ : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal \fifo_buff_reg[1]\ : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal \fifo_buff_reg[2]\ : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal \fifo_buff_reg[3]\ : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal fifo_capacity : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal fifo_capacity0 : STD_LOGIC_VECTOR ( 31 downto 1 );
  signal \fifo_capacity0_carry__0_i_1_n_0\ : STD_LOGIC;
  signal \fifo_capacity0_carry__0_i_1_n_1\ : STD_LOGIC;
  signal \fifo_capacity0_carry__0_i_1_n_2\ : STD_LOGIC;
  signal \fifo_capacity0_carry__0_i_1_n_3\ : STD_LOGIC;
  signal \fifo_capacity0_carry__0_i_1_n_4\ : STD_LOGIC;
  signal \fifo_capacity0_carry__0_i_1_n_5\ : STD_LOGIC;
  signal \fifo_capacity0_carry__0_i_1_n_6\ : STD_LOGIC;
  signal \fifo_capacity0_carry__0_i_1_n_7\ : STD_LOGIC;
  signal \fifo_capacity0_carry__0_i_2_n_0\ : STD_LOGIC;
  signal \fifo_capacity0_carry__0_i_3_n_0\ : STD_LOGIC;
  signal \fifo_capacity0_carry__0_i_4_n_0\ : STD_LOGIC;
  signal \fifo_capacity0_carry__0_i_5_n_0\ : STD_LOGIC;
  signal \fifo_capacity0_carry__0_n_0\ : STD_LOGIC;
  signal \fifo_capacity0_carry__0_n_1\ : STD_LOGIC;
  signal \fifo_capacity0_carry__0_n_2\ : STD_LOGIC;
  signal \fifo_capacity0_carry__0_n_3\ : STD_LOGIC;
  signal \fifo_capacity0_carry__1_i_1_n_0\ : STD_LOGIC;
  signal \fifo_capacity0_carry__1_i_1_n_1\ : STD_LOGIC;
  signal \fifo_capacity0_carry__1_i_1_n_2\ : STD_LOGIC;
  signal \fifo_capacity0_carry__1_i_1_n_3\ : STD_LOGIC;
  signal \fifo_capacity0_carry__1_i_1_n_4\ : STD_LOGIC;
  signal \fifo_capacity0_carry__1_i_1_n_5\ : STD_LOGIC;
  signal \fifo_capacity0_carry__1_i_1_n_6\ : STD_LOGIC;
  signal \fifo_capacity0_carry__1_i_1_n_7\ : STD_LOGIC;
  signal \fifo_capacity0_carry__1_i_2_n_0\ : STD_LOGIC;
  signal \fifo_capacity0_carry__1_i_3_n_0\ : STD_LOGIC;
  signal \fifo_capacity0_carry__1_i_4_n_0\ : STD_LOGIC;
  signal \fifo_capacity0_carry__1_i_5_n_0\ : STD_LOGIC;
  signal \fifo_capacity0_carry__1_n_0\ : STD_LOGIC;
  signal \fifo_capacity0_carry__1_n_1\ : STD_LOGIC;
  signal \fifo_capacity0_carry__1_n_2\ : STD_LOGIC;
  signal \fifo_capacity0_carry__1_n_3\ : STD_LOGIC;
  signal \fifo_capacity0_carry__2_i_1_n_0\ : STD_LOGIC;
  signal \fifo_capacity0_carry__2_i_1_n_1\ : STD_LOGIC;
  signal \fifo_capacity0_carry__2_i_1_n_2\ : STD_LOGIC;
  signal \fifo_capacity0_carry__2_i_1_n_3\ : STD_LOGIC;
  signal \fifo_capacity0_carry__2_i_1_n_4\ : STD_LOGIC;
  signal \fifo_capacity0_carry__2_i_1_n_5\ : STD_LOGIC;
  signal \fifo_capacity0_carry__2_i_1_n_6\ : STD_LOGIC;
  signal \fifo_capacity0_carry__2_i_1_n_7\ : STD_LOGIC;
  signal \fifo_capacity0_carry__2_i_2_n_0\ : STD_LOGIC;
  signal \fifo_capacity0_carry__2_i_3_n_0\ : STD_LOGIC;
  signal \fifo_capacity0_carry__2_i_4_n_0\ : STD_LOGIC;
  signal \fifo_capacity0_carry__2_i_5_n_0\ : STD_LOGIC;
  signal \fifo_capacity0_carry__2_n_0\ : STD_LOGIC;
  signal \fifo_capacity0_carry__2_n_1\ : STD_LOGIC;
  signal \fifo_capacity0_carry__2_n_2\ : STD_LOGIC;
  signal \fifo_capacity0_carry__2_n_3\ : STD_LOGIC;
  signal \fifo_capacity0_carry__3_i_1_n_0\ : STD_LOGIC;
  signal \fifo_capacity0_carry__3_i_1_n_1\ : STD_LOGIC;
  signal \fifo_capacity0_carry__3_i_1_n_2\ : STD_LOGIC;
  signal \fifo_capacity0_carry__3_i_1_n_3\ : STD_LOGIC;
  signal \fifo_capacity0_carry__3_i_1_n_4\ : STD_LOGIC;
  signal \fifo_capacity0_carry__3_i_1_n_5\ : STD_LOGIC;
  signal \fifo_capacity0_carry__3_i_1_n_6\ : STD_LOGIC;
  signal \fifo_capacity0_carry__3_i_1_n_7\ : STD_LOGIC;
  signal \fifo_capacity0_carry__3_i_2_n_0\ : STD_LOGIC;
  signal \fifo_capacity0_carry__3_i_3_n_0\ : STD_LOGIC;
  signal \fifo_capacity0_carry__3_i_4_n_0\ : STD_LOGIC;
  signal \fifo_capacity0_carry__3_i_5_n_0\ : STD_LOGIC;
  signal \fifo_capacity0_carry__3_n_0\ : STD_LOGIC;
  signal \fifo_capacity0_carry__3_n_1\ : STD_LOGIC;
  signal \fifo_capacity0_carry__3_n_2\ : STD_LOGIC;
  signal \fifo_capacity0_carry__3_n_3\ : STD_LOGIC;
  signal \fifo_capacity0_carry__4_i_1_n_0\ : STD_LOGIC;
  signal \fifo_capacity0_carry__4_i_1_n_1\ : STD_LOGIC;
  signal \fifo_capacity0_carry__4_i_1_n_2\ : STD_LOGIC;
  signal \fifo_capacity0_carry__4_i_1_n_3\ : STD_LOGIC;
  signal \fifo_capacity0_carry__4_i_1_n_4\ : STD_LOGIC;
  signal \fifo_capacity0_carry__4_i_1_n_5\ : STD_LOGIC;
  signal \fifo_capacity0_carry__4_i_1_n_6\ : STD_LOGIC;
  signal \fifo_capacity0_carry__4_i_1_n_7\ : STD_LOGIC;
  signal \fifo_capacity0_carry__4_i_2_n_0\ : STD_LOGIC;
  signal \fifo_capacity0_carry__4_i_3_n_0\ : STD_LOGIC;
  signal \fifo_capacity0_carry__4_i_4_n_0\ : STD_LOGIC;
  signal \fifo_capacity0_carry__4_i_5_n_0\ : STD_LOGIC;
  signal \fifo_capacity0_carry__4_n_0\ : STD_LOGIC;
  signal \fifo_capacity0_carry__4_n_1\ : STD_LOGIC;
  signal \fifo_capacity0_carry__4_n_2\ : STD_LOGIC;
  signal \fifo_capacity0_carry__4_n_3\ : STD_LOGIC;
  signal \fifo_capacity0_carry__5_i_1_n_1\ : STD_LOGIC;
  signal \fifo_capacity0_carry__5_i_1_n_2\ : STD_LOGIC;
  signal \fifo_capacity0_carry__5_i_1_n_3\ : STD_LOGIC;
  signal \fifo_capacity0_carry__5_i_1_n_4\ : STD_LOGIC;
  signal \fifo_capacity0_carry__5_i_1_n_5\ : STD_LOGIC;
  signal \fifo_capacity0_carry__5_i_1_n_6\ : STD_LOGIC;
  signal \fifo_capacity0_carry__5_i_1_n_7\ : STD_LOGIC;
  signal \fifo_capacity0_carry__5_i_2_n_0\ : STD_LOGIC;
  signal \fifo_capacity0_carry__5_i_3_n_0\ : STD_LOGIC;
  signal \fifo_capacity0_carry__5_i_4_n_0\ : STD_LOGIC;
  signal \fifo_capacity0_carry__5_i_5_n_0\ : STD_LOGIC;
  signal \fifo_capacity0_carry__5_n_0\ : STD_LOGIC;
  signal \fifo_capacity0_carry__5_n_1\ : STD_LOGIC;
  signal \fifo_capacity0_carry__5_n_2\ : STD_LOGIC;
  signal \fifo_capacity0_carry__5_n_3\ : STD_LOGIC;
  signal \fifo_capacity0_carry__6_i_1_n_0\ : STD_LOGIC;
  signal \fifo_capacity0_carry__6_i_2_n_0\ : STD_LOGIC;
  signal \fifo_capacity0_carry__6_i_3_n_0\ : STD_LOGIC;
  signal \fifo_capacity0_carry__6_n_2\ : STD_LOGIC;
  signal \fifo_capacity0_carry__6_n_3\ : STD_LOGIC;
  signal fifo_capacity0_carry_i_1_n_0 : STD_LOGIC;
  signal fifo_capacity0_carry_i_1_n_1 : STD_LOGIC;
  signal fifo_capacity0_carry_i_1_n_2 : STD_LOGIC;
  signal fifo_capacity0_carry_i_1_n_3 : STD_LOGIC;
  signal fifo_capacity0_carry_i_1_n_4 : STD_LOGIC;
  signal fifo_capacity0_carry_i_1_n_5 : STD_LOGIC;
  signal fifo_capacity0_carry_i_1_n_6 : STD_LOGIC;
  signal fifo_capacity0_carry_i_1_n_7 : STD_LOGIC;
  signal fifo_capacity0_carry_i_2_n_0 : STD_LOGIC;
  signal fifo_capacity0_carry_i_2_n_1 : STD_LOGIC;
  signal fifo_capacity0_carry_i_2_n_2 : STD_LOGIC;
  signal fifo_capacity0_carry_i_2_n_3 : STD_LOGIC;
  signal fifo_capacity0_carry_i_2_n_4 : STD_LOGIC;
  signal fifo_capacity0_carry_i_2_n_5 : STD_LOGIC;
  signal fifo_capacity0_carry_i_2_n_6 : STD_LOGIC;
  signal fifo_capacity0_carry_i_2_n_7 : STD_LOGIC;
  signal fifo_capacity0_carry_i_3_n_0 : STD_LOGIC;
  signal fifo_capacity0_carry_i_4_n_0 : STD_LOGIC;
  signal fifo_capacity0_carry_i_5_n_0 : STD_LOGIC;
  signal fifo_capacity0_carry_i_6_n_0 : STD_LOGIC;
  signal fifo_capacity0_carry_i_7_n_0 : STD_LOGIC;
  signal fifo_capacity0_carry_n_0 : STD_LOGIC;
  signal fifo_capacity0_carry_n_1 : STD_LOGIC;
  signal fifo_capacity0_carry_n_2 : STD_LOGIC;
  signal fifo_capacity0_carry_n_3 : STD_LOGIC;
  signal \fifo_capacity[0]_i_1_n_0\ : STD_LOGIC;
  signal \fifo_capacity[10]_i_1_n_0\ : STD_LOGIC;
  signal \fifo_capacity[11]_i_1_n_0\ : STD_LOGIC;
  signal \fifo_capacity[12]_i_1_n_0\ : STD_LOGIC;
  signal \fifo_capacity[13]_i_1_n_0\ : STD_LOGIC;
  signal \fifo_capacity[14]_i_1_n_0\ : STD_LOGIC;
  signal \fifo_capacity[15]_i_1_n_0\ : STD_LOGIC;
  signal \fifo_capacity[16]_i_1_n_0\ : STD_LOGIC;
  signal \fifo_capacity[17]_i_1_n_0\ : STD_LOGIC;
  signal \fifo_capacity[18]_i_1_n_0\ : STD_LOGIC;
  signal \fifo_capacity[19]_i_1_n_0\ : STD_LOGIC;
  signal \fifo_capacity[1]_i_1_n_0\ : STD_LOGIC;
  signal \fifo_capacity[20]_i_1_n_0\ : STD_LOGIC;
  signal \fifo_capacity[21]_i_1_n_0\ : STD_LOGIC;
  signal \fifo_capacity[22]_i_1_n_0\ : STD_LOGIC;
  signal \fifo_capacity[23]_i_1_n_0\ : STD_LOGIC;
  signal \fifo_capacity[24]_i_1_n_0\ : STD_LOGIC;
  signal \fifo_capacity[25]_i_1_n_0\ : STD_LOGIC;
  signal \fifo_capacity[26]_i_1_n_0\ : STD_LOGIC;
  signal \fifo_capacity[27]_i_1_n_0\ : STD_LOGIC;
  signal \fifo_capacity[28]_i_1_n_0\ : STD_LOGIC;
  signal \fifo_capacity[29]_i_1_n_0\ : STD_LOGIC;
  signal \fifo_capacity[2]_i_1_n_0\ : STD_LOGIC;
  signal \fifo_capacity[30]_i_1_n_0\ : STD_LOGIC;
  signal \fifo_capacity[31]_i_1_n_0\ : STD_LOGIC;
  signal \fifo_capacity[31]_i_2_n_0\ : STD_LOGIC;
  signal \fifo_capacity[3]_i_1_n_0\ : STD_LOGIC;
  signal \fifo_capacity[4]_i_1_n_0\ : STD_LOGIC;
  signal \fifo_capacity[5]_i_1_n_0\ : STD_LOGIC;
  signal \fifo_capacity[6]_i_1_n_0\ : STD_LOGIC;
  signal \fifo_capacity[7]_i_1_n_0\ : STD_LOGIC;
  signal \fifo_capacity[8]_i_1_n_0\ : STD_LOGIC;
  signal \fifo_capacity[9]_i_1_n_0\ : STD_LOGIC;
  signal rd_ptr : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \rd_ptr[0]_i_1_n_0\ : STD_LOGIC;
  signal \rd_ptr[1]_i_1_n_0\ : STD_LOGIC;
  signal read_reg_i_2_n_0 : STD_LOGIC;
  signal read_reg_i_3_n_0 : STD_LOGIC;
  signal read_reg_i_4_n_0 : STD_LOGIC;
  signal read_reg_i_5_n_0 : STD_LOGIC;
  signal read_reg_i_6_n_0 : STD_LOGIC;
  signal read_reg_i_7_n_0 : STD_LOGIC;
  signal read_reg_i_8_n_0 : STD_LOGIC;
  signal read_reg_i_9_n_0 : STD_LOGIC;
  signal \^reset_0\ : STD_LOGIC;
  signal \^tx_fifo_data_o\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal wr_ptr : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \wr_ptr[0]_i_1_n_0\ : STD_LOGIC;
  signal \wr_ptr[1]_i_1_n_0\ : STD_LOGIC;
  signal wr_ptr_0 : STD_LOGIC;
  signal \NLW_fifo_capacity0_carry__5_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_fifo_capacity0_carry__6_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_fifo_capacity0_carry__6_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \data_o[8]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \data_o[9]_i_1\ : label is "soft_lutpair2";
  attribute ADDER_THRESHOLD : integer;
  attribute ADDER_THRESHOLD of fifo_capacity0_carry : label is 35;
  attribute ADDER_THRESHOLD of \fifo_capacity0_carry__0\ : label is 35;
  attribute ADDER_THRESHOLD of \fifo_capacity0_carry__0_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \fifo_capacity0_carry__1\ : label is 35;
  attribute ADDER_THRESHOLD of \fifo_capacity0_carry__1_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \fifo_capacity0_carry__2\ : label is 35;
  attribute ADDER_THRESHOLD of \fifo_capacity0_carry__2_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \fifo_capacity0_carry__3\ : label is 35;
  attribute ADDER_THRESHOLD of \fifo_capacity0_carry__3_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \fifo_capacity0_carry__4\ : label is 35;
  attribute ADDER_THRESHOLD of \fifo_capacity0_carry__4_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \fifo_capacity0_carry__5\ : label is 35;
  attribute ADDER_THRESHOLD of \fifo_capacity0_carry__5_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \fifo_capacity0_carry__6\ : label is 35;
  attribute ADDER_THRESHOLD of fifo_capacity0_carry_i_1 : label is 35;
  attribute ADDER_THRESHOLD of fifo_capacity0_carry_i_2 : label is 35;
  attribute SOFT_HLUTNM of \fifo_capacity[0]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \fifo_capacity[10]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \fifo_capacity[11]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \fifo_capacity[12]_i_1\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \fifo_capacity[13]_i_1\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \fifo_capacity[14]_i_1\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \fifo_capacity[15]_i_1\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \fifo_capacity[16]_i_1\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \fifo_capacity[17]_i_1\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \fifo_capacity[18]_i_1\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \fifo_capacity[19]_i_1\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \fifo_capacity[1]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \fifo_capacity[20]_i_1\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \fifo_capacity[21]_i_1\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \fifo_capacity[22]_i_1\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \fifo_capacity[23]_i_1\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \fifo_capacity[24]_i_1\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \fifo_capacity[25]_i_1\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \fifo_capacity[26]_i_1\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \fifo_capacity[27]_i_1\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \fifo_capacity[28]_i_1\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \fifo_capacity[29]_i_1\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \fifo_capacity[2]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \fifo_capacity[30]_i_1\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \fifo_capacity[31]_i_1\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \fifo_capacity[3]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \fifo_capacity[4]_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \fifo_capacity[5]_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \fifo_capacity[6]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \fifo_capacity[7]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \fifo_capacity[8]_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \fifo_capacity[9]_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \rd_ptr[0]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \rd_ptr[1]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \wr_ptr[0]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \wr_ptr[1]_i_1\ : label is "soft_lutpair1";
begin
  \data_o_reg[0]_0\ <= \^data_o_reg[0]_0\;
  reset_0 <= \^reset_0\;
  tx_fifo_data_o(1 downto 0) <= \^tx_fifo_data_o\(1 downto 0);
\data_o[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E2"
    )
        port map (
      I0 => data_o0(0),
      I1 => \fifo_capacity[31]_i_2_n_0\,
      I2 => \^data_o_reg[0]_0\,
      O => \data_o[0]_i_1_n_0\
    );
\data_o[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCFFAAF0CC00AAF0"
    )
        port map (
      I0 => \fifo_buff_reg[2]\(0),
      I1 => \fifo_buff_reg[3]\(0),
      I2 => \fifo_buff_reg[0]\(0),
      I3 => rd_ptr(1),
      I4 => rd_ptr(0),
      I5 => \fifo_buff_reg[1]\(0),
      O => data_o0(0)
    );
\data_o[8]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E2"
    )
        port map (
      I0 => data_o0(8),
      I1 => \fifo_capacity[31]_i_2_n_0\,
      I2 => \^tx_fifo_data_o\(0),
      O => \data_o[8]_i_1_n_0\
    );
\data_o[8]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCFFAAF0CC00AAF0"
    )
        port map (
      I0 => \fifo_buff_reg[2]\(8),
      I1 => \fifo_buff_reg[3]\(8),
      I2 => \fifo_buff_reg[0]\(8),
      I3 => rd_ptr(1),
      I4 => rd_ptr(0),
      I5 => \fifo_buff_reg[1]\(8),
      O => data_o0(8)
    );
\data_o[9]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E2"
    )
        port map (
      I0 => data_o0(9),
      I1 => \fifo_capacity[31]_i_2_n_0\,
      I2 => \^tx_fifo_data_o\(1),
      O => \data_o[9]_i_1_n_0\
    );
\data_o[9]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCFFAAF0CC00AAF0"
    )
        port map (
      I0 => \fifo_buff_reg[2]\(9),
      I1 => \fifo_buff_reg[3]\(9),
      I2 => \fifo_buff_reg[0]\(9),
      I3 => rd_ptr(1),
      I4 => rd_ptr(0),
      I5 => \fifo_buff_reg[1]\(9),
      O => data_o0(9)
    );
\data_o_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \^reset_0\,
      D => \data_o[0]_i_1_n_0\,
      Q => \^data_o_reg[0]_0\
    );
\data_o_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \^reset_0\,
      D => \data_o[8]_i_1_n_0\,
      Q => \^tx_fifo_data_o\(0)
    );
\data_o_reg[9]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \^reset_0\,
      D => \data_o[9]_i_1_n_0\,
      Q => \^tx_fifo_data_o\(1)
    );
\fifo_buff[0][0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FEFF0200"
    )
        port map (
      I0 => data_i(0),
      I1 => wr_ptr(1),
      I2 => wr_ptr(0),
      I3 => wr_ptr_0,
      I4 => \fifo_buff_reg[0]\(0),
      O => \fifo_buff[0][0]_i_1_n_0\
    );
\fifo_buff[0][8]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FEFF0200"
    )
        port map (
      I0 => data_i(1),
      I1 => wr_ptr(1),
      I2 => wr_ptr(0),
      I3 => wr_ptr_0,
      I4 => \fifo_buff_reg[0]\(8),
      O => \fifo_buff[0][8]_i_1_n_0\
    );
\fifo_buff[0][9]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FEFF0200"
    )
        port map (
      I0 => data_i(2),
      I1 => wr_ptr(1),
      I2 => wr_ptr(0),
      I3 => wr_ptr_0,
      I4 => \fifo_buff_reg[0]\(9),
      O => \fifo_buff[0][9]_i_1_n_0\
    );
\fifo_buff[1][0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"EFFF2000"
    )
        port map (
      I0 => data_i(0),
      I1 => wr_ptr(1),
      I2 => wr_ptr(0),
      I3 => wr_ptr_0,
      I4 => \fifo_buff_reg[1]\(0),
      O => \fifo_buff[1][0]_i_1_n_0\
    );
\fifo_buff[1][8]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"EFFF2000"
    )
        port map (
      I0 => data_i(1),
      I1 => wr_ptr(1),
      I2 => wr_ptr(0),
      I3 => wr_ptr_0,
      I4 => \fifo_buff_reg[1]\(8),
      O => \fifo_buff[1][8]_i_1_n_0\
    );
\fifo_buff[1][9]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"EFFF2000"
    )
        port map (
      I0 => data_i(2),
      I1 => wr_ptr(1),
      I2 => wr_ptr(0),
      I3 => wr_ptr_0,
      I4 => \fifo_buff_reg[1]\(9),
      O => \fifo_buff[1][9]_i_1_n_0\
    );
\fifo_buff[2][0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"EFFF2000"
    )
        port map (
      I0 => data_i(0),
      I1 => wr_ptr(0),
      I2 => wr_ptr(1),
      I3 => wr_ptr_0,
      I4 => \fifo_buff_reg[2]\(0),
      O => \fifo_buff[2][0]_i_1_n_0\
    );
\fifo_buff[2][8]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"EFFF2000"
    )
        port map (
      I0 => data_i(1),
      I1 => wr_ptr(0),
      I2 => wr_ptr(1),
      I3 => wr_ptr_0,
      I4 => \fifo_buff_reg[2]\(8),
      O => \fifo_buff[2][8]_i_1_n_0\
    );
\fifo_buff[2][9]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"EFFF2000"
    )
        port map (
      I0 => data_i(2),
      I1 => wr_ptr(0),
      I2 => wr_ptr(1),
      I3 => wr_ptr_0,
      I4 => \fifo_buff_reg[2]\(9),
      O => \fifo_buff[2][9]_i_1_n_0\
    );
\fifo_buff[3][0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BFFF8000"
    )
        port map (
      I0 => data_i(0),
      I1 => wr_ptr(1),
      I2 => wr_ptr(0),
      I3 => wr_ptr_0,
      I4 => \fifo_buff_reg[3]\(0),
      O => \fifo_buff[3][0]_i_1_n_0\
    );
\fifo_buff[3][8]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BFFF8000"
    )
        port map (
      I0 => data_i(1),
      I1 => wr_ptr(1),
      I2 => wr_ptr(0),
      I3 => wr_ptr_0,
      I4 => \fifo_buff_reg[3]\(8),
      O => \fifo_buff[3][8]_i_1_n_0\
    );
\fifo_buff[3][9]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BFFF8000"
    )
        port map (
      I0 => data_i(2),
      I1 => wr_ptr(1),
      I2 => wr_ptr(0),
      I3 => wr_ptr_0,
      I4 => \fifo_buff_reg[3]\(9),
      O => \fifo_buff[3][9]_i_1_n_0\
    );
\fifo_buff_reg[0][0]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \fifo_buff[0][0]_i_1_n_0\,
      Q => \fifo_buff_reg[0]\(0),
      R => '0'
    );
\fifo_buff_reg[0][8]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \fifo_buff[0][8]_i_1_n_0\,
      Q => \fifo_buff_reg[0]\(8),
      R => '0'
    );
\fifo_buff_reg[0][9]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \fifo_buff[0][9]_i_1_n_0\,
      Q => \fifo_buff_reg[0]\(9),
      R => '0'
    );
\fifo_buff_reg[1][0]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \fifo_buff[1][0]_i_1_n_0\,
      Q => \fifo_buff_reg[1]\(0),
      R => '0'
    );
\fifo_buff_reg[1][8]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \fifo_buff[1][8]_i_1_n_0\,
      Q => \fifo_buff_reg[1]\(8),
      R => '0'
    );
\fifo_buff_reg[1][9]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \fifo_buff[1][9]_i_1_n_0\,
      Q => \fifo_buff_reg[1]\(9),
      R => '0'
    );
\fifo_buff_reg[2][0]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \fifo_buff[2][0]_i_1_n_0\,
      Q => \fifo_buff_reg[2]\(0),
      R => '0'
    );
\fifo_buff_reg[2][8]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \fifo_buff[2][8]_i_1_n_0\,
      Q => \fifo_buff_reg[2]\(8),
      R => '0'
    );
\fifo_buff_reg[2][9]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \fifo_buff[2][9]_i_1_n_0\,
      Q => \fifo_buff_reg[2]\(9),
      R => '0'
    );
\fifo_buff_reg[3][0]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \fifo_buff[3][0]_i_1_n_0\,
      Q => \fifo_buff_reg[3]\(0),
      R => '0'
    );
\fifo_buff_reg[3][8]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \fifo_buff[3][8]_i_1_n_0\,
      Q => \fifo_buff_reg[3]\(8),
      R => '0'
    );
\fifo_buff_reg[3][9]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \fifo_buff[3][9]_i_1_n_0\,
      Q => \fifo_buff_reg[3]\(9),
      R => '0'
    );
fifo_capacity0_carry: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => fifo_capacity0_carry_n_0,
      CO(2) => fifo_capacity0_carry_n_1,
      CO(1) => fifo_capacity0_carry_n_2,
      CO(0) => fifo_capacity0_carry_n_3,
      CYINIT => fifo_capacity0_carry_i_1_n_7,
      DI(3) => fifo_capacity0_carry_i_2_n_7,
      DI(2) => fifo_capacity0_carry_i_1_n_4,
      DI(1) => fifo_capacity0_carry_i_1_n_5,
      DI(0) => fifo_capacity0_carry_i_1_n_6,
      O(3 downto 0) => fifo_capacity0(4 downto 1),
      S(3) => fifo_capacity0_carry_i_3_n_0,
      S(2) => fifo_capacity0_carry_i_4_n_0,
      S(1) => fifo_capacity0_carry_i_5_n_0,
      S(0) => fifo_capacity0_carry_i_6_n_0
    );
\fifo_capacity0_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => fifo_capacity0_carry_n_0,
      CO(3) => \fifo_capacity0_carry__0_n_0\,
      CO(2) => \fifo_capacity0_carry__0_n_1\,
      CO(1) => \fifo_capacity0_carry__0_n_2\,
      CO(0) => \fifo_capacity0_carry__0_n_3\,
      CYINIT => '0',
      DI(3) => \fifo_capacity0_carry__0_i_1_n_7\,
      DI(2) => fifo_capacity0_carry_i_2_n_4,
      DI(1) => fifo_capacity0_carry_i_2_n_5,
      DI(0) => fifo_capacity0_carry_i_2_n_6,
      O(3 downto 0) => fifo_capacity0(8 downto 5),
      S(3) => \fifo_capacity0_carry__0_i_2_n_0\,
      S(2) => \fifo_capacity0_carry__0_i_3_n_0\,
      S(1) => \fifo_capacity0_carry__0_i_4_n_0\,
      S(0) => \fifo_capacity0_carry__0_i_5_n_0\
    );
\fifo_capacity0_carry__0_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => fifo_capacity0_carry_i_2_n_0,
      CO(3) => \fifo_capacity0_carry__0_i_1_n_0\,
      CO(2) => \fifo_capacity0_carry__0_i_1_n_1\,
      CO(1) => \fifo_capacity0_carry__0_i_1_n_2\,
      CO(0) => \fifo_capacity0_carry__0_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \fifo_capacity0_carry__0_i_1_n_4\,
      O(2) => \fifo_capacity0_carry__0_i_1_n_5\,
      O(1) => \fifo_capacity0_carry__0_i_1_n_6\,
      O(0) => \fifo_capacity0_carry__0_i_1_n_7\,
      S(3 downto 0) => fifo_capacity(11 downto 8)
    );
\fifo_capacity0_carry__0_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \fifo_capacity0_carry__0_i_1_n_7\,
      O => \fifo_capacity0_carry__0_i_2_n_0\
    );
\fifo_capacity0_carry__0_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => fifo_capacity0_carry_i_2_n_4,
      O => \fifo_capacity0_carry__0_i_3_n_0\
    );
\fifo_capacity0_carry__0_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => fifo_capacity0_carry_i_2_n_5,
      O => \fifo_capacity0_carry__0_i_4_n_0\
    );
\fifo_capacity0_carry__0_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => fifo_capacity0_carry_i_2_n_6,
      O => \fifo_capacity0_carry__0_i_5_n_0\
    );
\fifo_capacity0_carry__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \fifo_capacity0_carry__0_n_0\,
      CO(3) => \fifo_capacity0_carry__1_n_0\,
      CO(2) => \fifo_capacity0_carry__1_n_1\,
      CO(1) => \fifo_capacity0_carry__1_n_2\,
      CO(0) => \fifo_capacity0_carry__1_n_3\,
      CYINIT => '0',
      DI(3) => \fifo_capacity0_carry__1_i_1_n_7\,
      DI(2) => \fifo_capacity0_carry__0_i_1_n_4\,
      DI(1) => \fifo_capacity0_carry__0_i_1_n_5\,
      DI(0) => \fifo_capacity0_carry__0_i_1_n_6\,
      O(3 downto 0) => fifo_capacity0(12 downto 9),
      S(3) => \fifo_capacity0_carry__1_i_2_n_0\,
      S(2) => \fifo_capacity0_carry__1_i_3_n_0\,
      S(1) => \fifo_capacity0_carry__1_i_4_n_0\,
      S(0) => \fifo_capacity0_carry__1_i_5_n_0\
    );
\fifo_capacity0_carry__1_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \fifo_capacity0_carry__0_i_1_n_0\,
      CO(3) => \fifo_capacity0_carry__1_i_1_n_0\,
      CO(2) => \fifo_capacity0_carry__1_i_1_n_1\,
      CO(1) => \fifo_capacity0_carry__1_i_1_n_2\,
      CO(0) => \fifo_capacity0_carry__1_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \fifo_capacity0_carry__1_i_1_n_4\,
      O(2) => \fifo_capacity0_carry__1_i_1_n_5\,
      O(1) => \fifo_capacity0_carry__1_i_1_n_6\,
      O(0) => \fifo_capacity0_carry__1_i_1_n_7\,
      S(3 downto 0) => fifo_capacity(15 downto 12)
    );
\fifo_capacity0_carry__1_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \fifo_capacity0_carry__1_i_1_n_7\,
      O => \fifo_capacity0_carry__1_i_2_n_0\
    );
\fifo_capacity0_carry__1_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \fifo_capacity0_carry__0_i_1_n_4\,
      O => \fifo_capacity0_carry__1_i_3_n_0\
    );
\fifo_capacity0_carry__1_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \fifo_capacity0_carry__0_i_1_n_5\,
      O => \fifo_capacity0_carry__1_i_4_n_0\
    );
\fifo_capacity0_carry__1_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \fifo_capacity0_carry__0_i_1_n_6\,
      O => \fifo_capacity0_carry__1_i_5_n_0\
    );
\fifo_capacity0_carry__2\: unisim.vcomponents.CARRY4
     port map (
      CI => \fifo_capacity0_carry__1_n_0\,
      CO(3) => \fifo_capacity0_carry__2_n_0\,
      CO(2) => \fifo_capacity0_carry__2_n_1\,
      CO(1) => \fifo_capacity0_carry__2_n_2\,
      CO(0) => \fifo_capacity0_carry__2_n_3\,
      CYINIT => '0',
      DI(3) => \fifo_capacity0_carry__2_i_1_n_7\,
      DI(2) => \fifo_capacity0_carry__1_i_1_n_4\,
      DI(1) => \fifo_capacity0_carry__1_i_1_n_5\,
      DI(0) => \fifo_capacity0_carry__1_i_1_n_6\,
      O(3 downto 0) => fifo_capacity0(16 downto 13),
      S(3) => \fifo_capacity0_carry__2_i_2_n_0\,
      S(2) => \fifo_capacity0_carry__2_i_3_n_0\,
      S(1) => \fifo_capacity0_carry__2_i_4_n_0\,
      S(0) => \fifo_capacity0_carry__2_i_5_n_0\
    );
\fifo_capacity0_carry__2_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \fifo_capacity0_carry__1_i_1_n_0\,
      CO(3) => \fifo_capacity0_carry__2_i_1_n_0\,
      CO(2) => \fifo_capacity0_carry__2_i_1_n_1\,
      CO(1) => \fifo_capacity0_carry__2_i_1_n_2\,
      CO(0) => \fifo_capacity0_carry__2_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \fifo_capacity0_carry__2_i_1_n_4\,
      O(2) => \fifo_capacity0_carry__2_i_1_n_5\,
      O(1) => \fifo_capacity0_carry__2_i_1_n_6\,
      O(0) => \fifo_capacity0_carry__2_i_1_n_7\,
      S(3 downto 0) => fifo_capacity(19 downto 16)
    );
\fifo_capacity0_carry__2_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \fifo_capacity0_carry__2_i_1_n_7\,
      O => \fifo_capacity0_carry__2_i_2_n_0\
    );
\fifo_capacity0_carry__2_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \fifo_capacity0_carry__1_i_1_n_4\,
      O => \fifo_capacity0_carry__2_i_3_n_0\
    );
\fifo_capacity0_carry__2_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \fifo_capacity0_carry__1_i_1_n_5\,
      O => \fifo_capacity0_carry__2_i_4_n_0\
    );
\fifo_capacity0_carry__2_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \fifo_capacity0_carry__1_i_1_n_6\,
      O => \fifo_capacity0_carry__2_i_5_n_0\
    );
\fifo_capacity0_carry__3\: unisim.vcomponents.CARRY4
     port map (
      CI => \fifo_capacity0_carry__2_n_0\,
      CO(3) => \fifo_capacity0_carry__3_n_0\,
      CO(2) => \fifo_capacity0_carry__3_n_1\,
      CO(1) => \fifo_capacity0_carry__3_n_2\,
      CO(0) => \fifo_capacity0_carry__3_n_3\,
      CYINIT => '0',
      DI(3) => \fifo_capacity0_carry__3_i_1_n_7\,
      DI(2) => \fifo_capacity0_carry__2_i_1_n_4\,
      DI(1) => \fifo_capacity0_carry__2_i_1_n_5\,
      DI(0) => \fifo_capacity0_carry__2_i_1_n_6\,
      O(3 downto 0) => fifo_capacity0(20 downto 17),
      S(3) => \fifo_capacity0_carry__3_i_2_n_0\,
      S(2) => \fifo_capacity0_carry__3_i_3_n_0\,
      S(1) => \fifo_capacity0_carry__3_i_4_n_0\,
      S(0) => \fifo_capacity0_carry__3_i_5_n_0\
    );
\fifo_capacity0_carry__3_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \fifo_capacity0_carry__2_i_1_n_0\,
      CO(3) => \fifo_capacity0_carry__3_i_1_n_0\,
      CO(2) => \fifo_capacity0_carry__3_i_1_n_1\,
      CO(1) => \fifo_capacity0_carry__3_i_1_n_2\,
      CO(0) => \fifo_capacity0_carry__3_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \fifo_capacity0_carry__3_i_1_n_4\,
      O(2) => \fifo_capacity0_carry__3_i_1_n_5\,
      O(1) => \fifo_capacity0_carry__3_i_1_n_6\,
      O(0) => \fifo_capacity0_carry__3_i_1_n_7\,
      S(3 downto 0) => fifo_capacity(23 downto 20)
    );
\fifo_capacity0_carry__3_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \fifo_capacity0_carry__3_i_1_n_7\,
      O => \fifo_capacity0_carry__3_i_2_n_0\
    );
\fifo_capacity0_carry__3_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \fifo_capacity0_carry__2_i_1_n_4\,
      O => \fifo_capacity0_carry__3_i_3_n_0\
    );
\fifo_capacity0_carry__3_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \fifo_capacity0_carry__2_i_1_n_5\,
      O => \fifo_capacity0_carry__3_i_4_n_0\
    );
\fifo_capacity0_carry__3_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \fifo_capacity0_carry__2_i_1_n_6\,
      O => \fifo_capacity0_carry__3_i_5_n_0\
    );
\fifo_capacity0_carry__4\: unisim.vcomponents.CARRY4
     port map (
      CI => \fifo_capacity0_carry__3_n_0\,
      CO(3) => \fifo_capacity0_carry__4_n_0\,
      CO(2) => \fifo_capacity0_carry__4_n_1\,
      CO(1) => \fifo_capacity0_carry__4_n_2\,
      CO(0) => \fifo_capacity0_carry__4_n_3\,
      CYINIT => '0',
      DI(3) => \fifo_capacity0_carry__4_i_1_n_7\,
      DI(2) => \fifo_capacity0_carry__3_i_1_n_4\,
      DI(1) => \fifo_capacity0_carry__3_i_1_n_5\,
      DI(0) => \fifo_capacity0_carry__3_i_1_n_6\,
      O(3 downto 0) => fifo_capacity0(24 downto 21),
      S(3) => \fifo_capacity0_carry__4_i_2_n_0\,
      S(2) => \fifo_capacity0_carry__4_i_3_n_0\,
      S(1) => \fifo_capacity0_carry__4_i_4_n_0\,
      S(0) => \fifo_capacity0_carry__4_i_5_n_0\
    );
\fifo_capacity0_carry__4_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \fifo_capacity0_carry__3_i_1_n_0\,
      CO(3) => \fifo_capacity0_carry__4_i_1_n_0\,
      CO(2) => \fifo_capacity0_carry__4_i_1_n_1\,
      CO(1) => \fifo_capacity0_carry__4_i_1_n_2\,
      CO(0) => \fifo_capacity0_carry__4_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \fifo_capacity0_carry__4_i_1_n_4\,
      O(2) => \fifo_capacity0_carry__4_i_1_n_5\,
      O(1) => \fifo_capacity0_carry__4_i_1_n_6\,
      O(0) => \fifo_capacity0_carry__4_i_1_n_7\,
      S(3 downto 0) => fifo_capacity(27 downto 24)
    );
\fifo_capacity0_carry__4_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \fifo_capacity0_carry__4_i_1_n_7\,
      O => \fifo_capacity0_carry__4_i_2_n_0\
    );
\fifo_capacity0_carry__4_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \fifo_capacity0_carry__3_i_1_n_4\,
      O => \fifo_capacity0_carry__4_i_3_n_0\
    );
\fifo_capacity0_carry__4_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \fifo_capacity0_carry__3_i_1_n_5\,
      O => \fifo_capacity0_carry__4_i_4_n_0\
    );
\fifo_capacity0_carry__4_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \fifo_capacity0_carry__3_i_1_n_6\,
      O => \fifo_capacity0_carry__4_i_5_n_0\
    );
\fifo_capacity0_carry__5\: unisim.vcomponents.CARRY4
     port map (
      CI => \fifo_capacity0_carry__4_n_0\,
      CO(3) => \fifo_capacity0_carry__5_n_0\,
      CO(2) => \fifo_capacity0_carry__5_n_1\,
      CO(1) => \fifo_capacity0_carry__5_n_2\,
      CO(0) => \fifo_capacity0_carry__5_n_3\,
      CYINIT => '0',
      DI(3) => \fifo_capacity0_carry__5_i_1_n_7\,
      DI(2) => \fifo_capacity0_carry__4_i_1_n_4\,
      DI(1) => \fifo_capacity0_carry__4_i_1_n_5\,
      DI(0) => \fifo_capacity0_carry__4_i_1_n_6\,
      O(3 downto 0) => fifo_capacity0(28 downto 25),
      S(3) => \fifo_capacity0_carry__5_i_2_n_0\,
      S(2) => \fifo_capacity0_carry__5_i_3_n_0\,
      S(1) => \fifo_capacity0_carry__5_i_4_n_0\,
      S(0) => \fifo_capacity0_carry__5_i_5_n_0\
    );
\fifo_capacity0_carry__5_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \fifo_capacity0_carry__4_i_1_n_0\,
      CO(3) => \NLW_fifo_capacity0_carry__5_i_1_CO_UNCONNECTED\(3),
      CO(2) => \fifo_capacity0_carry__5_i_1_n_1\,
      CO(1) => \fifo_capacity0_carry__5_i_1_n_2\,
      CO(0) => \fifo_capacity0_carry__5_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \fifo_capacity0_carry__5_i_1_n_4\,
      O(2) => \fifo_capacity0_carry__5_i_1_n_5\,
      O(1) => \fifo_capacity0_carry__5_i_1_n_6\,
      O(0) => \fifo_capacity0_carry__5_i_1_n_7\,
      S(3 downto 0) => fifo_capacity(31 downto 28)
    );
\fifo_capacity0_carry__5_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \fifo_capacity0_carry__5_i_1_n_7\,
      O => \fifo_capacity0_carry__5_i_2_n_0\
    );
\fifo_capacity0_carry__5_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \fifo_capacity0_carry__4_i_1_n_4\,
      O => \fifo_capacity0_carry__5_i_3_n_0\
    );
\fifo_capacity0_carry__5_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \fifo_capacity0_carry__4_i_1_n_5\,
      O => \fifo_capacity0_carry__5_i_4_n_0\
    );
\fifo_capacity0_carry__5_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \fifo_capacity0_carry__4_i_1_n_6\,
      O => \fifo_capacity0_carry__5_i_5_n_0\
    );
\fifo_capacity0_carry__6\: unisim.vcomponents.CARRY4
     port map (
      CI => \fifo_capacity0_carry__5_n_0\,
      CO(3 downto 2) => \NLW_fifo_capacity0_carry__6_CO_UNCONNECTED\(3 downto 2),
      CO(1) => \fifo_capacity0_carry__6_n_2\,
      CO(0) => \fifo_capacity0_carry__6_n_3\,
      CYINIT => '0',
      DI(3 downto 2) => B"00",
      DI(1) => \fifo_capacity0_carry__5_i_1_n_5\,
      DI(0) => \fifo_capacity0_carry__5_i_1_n_6\,
      O(3) => \NLW_fifo_capacity0_carry__6_O_UNCONNECTED\(3),
      O(2 downto 0) => fifo_capacity0(31 downto 29),
      S(3) => '0',
      S(2) => \fifo_capacity0_carry__6_i_1_n_0\,
      S(1) => \fifo_capacity0_carry__6_i_2_n_0\,
      S(0) => \fifo_capacity0_carry__6_i_3_n_0\
    );
\fifo_capacity0_carry__6_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \fifo_capacity0_carry__5_i_1_n_4\,
      O => \fifo_capacity0_carry__6_i_1_n_0\
    );
\fifo_capacity0_carry__6_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \fifo_capacity0_carry__5_i_1_n_5\,
      O => \fifo_capacity0_carry__6_i_2_n_0\
    );
\fifo_capacity0_carry__6_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \fifo_capacity0_carry__5_i_1_n_6\,
      O => \fifo_capacity0_carry__6_i_3_n_0\
    );
fifo_capacity0_carry_i_1: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => fifo_capacity0_carry_i_1_n_0,
      CO(2) => fifo_capacity0_carry_i_1_n_1,
      CO(1) => fifo_capacity0_carry_i_1_n_2,
      CO(0) => fifo_capacity0_carry_i_1_n_3,
      CYINIT => '0',
      DI(3 downto 1) => B"000",
      DI(0) => fifo_capacity(0),
      O(3) => fifo_capacity0_carry_i_1_n_4,
      O(2) => fifo_capacity0_carry_i_1_n_5,
      O(1) => fifo_capacity0_carry_i_1_n_6,
      O(0) => fifo_capacity0_carry_i_1_n_7,
      S(3 downto 1) => fifo_capacity(3 downto 1),
      S(0) => fifo_capacity0_carry_i_7_n_0
    );
fifo_capacity0_carry_i_2: unisim.vcomponents.CARRY4
     port map (
      CI => fifo_capacity0_carry_i_1_n_0,
      CO(3) => fifo_capacity0_carry_i_2_n_0,
      CO(2) => fifo_capacity0_carry_i_2_n_1,
      CO(1) => fifo_capacity0_carry_i_2_n_2,
      CO(0) => fifo_capacity0_carry_i_2_n_3,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => fifo_capacity0_carry_i_2_n_4,
      O(2) => fifo_capacity0_carry_i_2_n_5,
      O(1) => fifo_capacity0_carry_i_2_n_6,
      O(0) => fifo_capacity0_carry_i_2_n_7,
      S(3 downto 0) => fifo_capacity(7 downto 4)
    );
fifo_capacity0_carry_i_3: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => fifo_capacity0_carry_i_2_n_7,
      O => fifo_capacity0_carry_i_3_n_0
    );
fifo_capacity0_carry_i_4: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => fifo_capacity0_carry_i_1_n_4,
      O => fifo_capacity0_carry_i_4_n_0
    );
fifo_capacity0_carry_i_5: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => fifo_capacity0_carry_i_1_n_5,
      O => fifo_capacity0_carry_i_5_n_0
    );
fifo_capacity0_carry_i_6: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => fifo_capacity0_carry_i_1_n_6,
      O => fifo_capacity0_carry_i_6_n_0
    );
fifo_capacity0_carry_i_7: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0100FFFFFEFF0000"
    )
        port map (
      I0 => read_reg_i_2_n_0,
      I1 => read_reg_i_3_n_0,
      I2 => read_reg_i_4_n_0,
      I3 => fifo_capacity(2),
      I4 => wr,
      I5 => fifo_capacity(0),
      O => fifo_capacity0_carry_i_7_n_0
    );
\fifo_capacity[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \fifo_capacity[31]_i_2_n_0\,
      I1 => fifo_capacity0_carry_i_1_n_7,
      O => \fifo_capacity[0]_i_1_n_0\
    );
\fifo_capacity[10]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \fifo_capacity0_carry__0_i_1_n_5\,
      I1 => \fifo_capacity[31]_i_2_n_0\,
      I2 => fifo_capacity0(10),
      O => \fifo_capacity[10]_i_1_n_0\
    );
\fifo_capacity[11]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \fifo_capacity0_carry__0_i_1_n_4\,
      I1 => \fifo_capacity[31]_i_2_n_0\,
      I2 => fifo_capacity0(11),
      O => \fifo_capacity[11]_i_1_n_0\
    );
\fifo_capacity[12]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \fifo_capacity0_carry__1_i_1_n_7\,
      I1 => \fifo_capacity[31]_i_2_n_0\,
      I2 => fifo_capacity0(12),
      O => \fifo_capacity[12]_i_1_n_0\
    );
\fifo_capacity[13]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \fifo_capacity0_carry__1_i_1_n_6\,
      I1 => \fifo_capacity[31]_i_2_n_0\,
      I2 => fifo_capacity0(13),
      O => \fifo_capacity[13]_i_1_n_0\
    );
\fifo_capacity[14]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \fifo_capacity0_carry__1_i_1_n_5\,
      I1 => \fifo_capacity[31]_i_2_n_0\,
      I2 => fifo_capacity0(14),
      O => \fifo_capacity[14]_i_1_n_0\
    );
\fifo_capacity[15]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \fifo_capacity0_carry__1_i_1_n_4\,
      I1 => \fifo_capacity[31]_i_2_n_0\,
      I2 => fifo_capacity0(15),
      O => \fifo_capacity[15]_i_1_n_0\
    );
\fifo_capacity[16]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \fifo_capacity0_carry__2_i_1_n_7\,
      I1 => \fifo_capacity[31]_i_2_n_0\,
      I2 => fifo_capacity0(16),
      O => \fifo_capacity[16]_i_1_n_0\
    );
\fifo_capacity[17]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \fifo_capacity0_carry__2_i_1_n_6\,
      I1 => \fifo_capacity[31]_i_2_n_0\,
      I2 => fifo_capacity0(17),
      O => \fifo_capacity[17]_i_1_n_0\
    );
\fifo_capacity[18]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \fifo_capacity0_carry__2_i_1_n_5\,
      I1 => \fifo_capacity[31]_i_2_n_0\,
      I2 => fifo_capacity0(18),
      O => \fifo_capacity[18]_i_1_n_0\
    );
\fifo_capacity[19]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \fifo_capacity0_carry__2_i_1_n_4\,
      I1 => \fifo_capacity[31]_i_2_n_0\,
      I2 => fifo_capacity0(19),
      O => \fifo_capacity[19]_i_1_n_0\
    );
\fifo_capacity[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => fifo_capacity0_carry_i_1_n_6,
      I1 => \fifo_capacity[31]_i_2_n_0\,
      I2 => fifo_capacity0(1),
      O => \fifo_capacity[1]_i_1_n_0\
    );
\fifo_capacity[20]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \fifo_capacity0_carry__3_i_1_n_7\,
      I1 => \fifo_capacity[31]_i_2_n_0\,
      I2 => fifo_capacity0(20),
      O => \fifo_capacity[20]_i_1_n_0\
    );
\fifo_capacity[21]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \fifo_capacity0_carry__3_i_1_n_6\,
      I1 => \fifo_capacity[31]_i_2_n_0\,
      I2 => fifo_capacity0(21),
      O => \fifo_capacity[21]_i_1_n_0\
    );
\fifo_capacity[22]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \fifo_capacity0_carry__3_i_1_n_5\,
      I1 => \fifo_capacity[31]_i_2_n_0\,
      I2 => fifo_capacity0(22),
      O => \fifo_capacity[22]_i_1_n_0\
    );
\fifo_capacity[23]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \fifo_capacity0_carry__3_i_1_n_4\,
      I1 => \fifo_capacity[31]_i_2_n_0\,
      I2 => fifo_capacity0(23),
      O => \fifo_capacity[23]_i_1_n_0\
    );
\fifo_capacity[24]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \fifo_capacity0_carry__4_i_1_n_7\,
      I1 => \fifo_capacity[31]_i_2_n_0\,
      I2 => fifo_capacity0(24),
      O => \fifo_capacity[24]_i_1_n_0\
    );
\fifo_capacity[25]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \fifo_capacity0_carry__4_i_1_n_6\,
      I1 => \fifo_capacity[31]_i_2_n_0\,
      I2 => fifo_capacity0(25),
      O => \fifo_capacity[25]_i_1_n_0\
    );
\fifo_capacity[26]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \fifo_capacity0_carry__4_i_1_n_5\,
      I1 => \fifo_capacity[31]_i_2_n_0\,
      I2 => fifo_capacity0(26),
      O => \fifo_capacity[26]_i_1_n_0\
    );
\fifo_capacity[27]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \fifo_capacity0_carry__4_i_1_n_4\,
      I1 => \fifo_capacity[31]_i_2_n_0\,
      I2 => fifo_capacity0(27),
      O => \fifo_capacity[27]_i_1_n_0\
    );
\fifo_capacity[28]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \fifo_capacity0_carry__5_i_1_n_7\,
      I1 => \fifo_capacity[31]_i_2_n_0\,
      I2 => fifo_capacity0(28),
      O => \fifo_capacity[28]_i_1_n_0\
    );
\fifo_capacity[29]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \fifo_capacity0_carry__5_i_1_n_6\,
      I1 => \fifo_capacity[31]_i_2_n_0\,
      I2 => fifo_capacity0(29),
      O => \fifo_capacity[29]_i_1_n_0\
    );
\fifo_capacity[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => fifo_capacity0_carry_i_1_n_5,
      I1 => \fifo_capacity[31]_i_2_n_0\,
      I2 => fifo_capacity0(2),
      O => \fifo_capacity[2]_i_1_n_0\
    );
\fifo_capacity[30]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \fifo_capacity0_carry__5_i_1_n_5\,
      I1 => \fifo_capacity[31]_i_2_n_0\,
      I2 => fifo_capacity0(30),
      O => \fifo_capacity[30]_i_1_n_0\
    );
\fifo_capacity[31]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \fifo_capacity0_carry__5_i_1_n_4\,
      I1 => \fifo_capacity[31]_i_2_n_0\,
      I2 => fifo_capacity0(31),
      O => \fifo_capacity[31]_i_1_n_0\
    );
\fifo_capacity[31]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0001FFFF"
    )
        port map (
      I0 => fifo_capacity(2),
      I1 => read_reg_i_4_n_0,
      I2 => read_reg_i_3_n_0,
      I3 => read_reg_i_2_n_0,
      I4 => read,
      O => \fifo_capacity[31]_i_2_n_0\
    );
\fifo_capacity[3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => fifo_capacity0_carry_i_1_n_4,
      I1 => \fifo_capacity[31]_i_2_n_0\,
      I2 => fifo_capacity0(3),
      O => \fifo_capacity[3]_i_1_n_0\
    );
\fifo_capacity[4]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => fifo_capacity0_carry_i_2_n_7,
      I1 => \fifo_capacity[31]_i_2_n_0\,
      I2 => fifo_capacity0(4),
      O => \fifo_capacity[4]_i_1_n_0\
    );
\fifo_capacity[5]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => fifo_capacity0_carry_i_2_n_6,
      I1 => \fifo_capacity[31]_i_2_n_0\,
      I2 => fifo_capacity0(5),
      O => \fifo_capacity[5]_i_1_n_0\
    );
\fifo_capacity[6]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => fifo_capacity0_carry_i_2_n_5,
      I1 => \fifo_capacity[31]_i_2_n_0\,
      I2 => fifo_capacity0(6),
      O => \fifo_capacity[6]_i_1_n_0\
    );
\fifo_capacity[7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => fifo_capacity0_carry_i_2_n_4,
      I1 => \fifo_capacity[31]_i_2_n_0\,
      I2 => fifo_capacity0(7),
      O => \fifo_capacity[7]_i_1_n_0\
    );
\fifo_capacity[8]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \fifo_capacity0_carry__0_i_1_n_7\,
      I1 => \fifo_capacity[31]_i_2_n_0\,
      I2 => fifo_capacity0(8),
      O => \fifo_capacity[8]_i_1_n_0\
    );
\fifo_capacity[9]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \fifo_capacity0_carry__0_i_1_n_6\,
      I1 => \fifo_capacity[31]_i_2_n_0\,
      I2 => fifo_capacity0(9),
      O => \fifo_capacity[9]_i_1_n_0\
    );
\fifo_capacity_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => reset,
      CLR => \^reset_0\,
      D => \fifo_capacity[0]_i_1_n_0\,
      Q => fifo_capacity(0)
    );
\fifo_capacity_reg[10]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => reset,
      CLR => \^reset_0\,
      D => \fifo_capacity[10]_i_1_n_0\,
      Q => fifo_capacity(10)
    );
\fifo_capacity_reg[11]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => reset,
      CLR => \^reset_0\,
      D => \fifo_capacity[11]_i_1_n_0\,
      Q => fifo_capacity(11)
    );
\fifo_capacity_reg[12]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => reset,
      CLR => \^reset_0\,
      D => \fifo_capacity[12]_i_1_n_0\,
      Q => fifo_capacity(12)
    );
\fifo_capacity_reg[13]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => reset,
      CLR => \^reset_0\,
      D => \fifo_capacity[13]_i_1_n_0\,
      Q => fifo_capacity(13)
    );
\fifo_capacity_reg[14]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => reset,
      CLR => \^reset_0\,
      D => \fifo_capacity[14]_i_1_n_0\,
      Q => fifo_capacity(14)
    );
\fifo_capacity_reg[15]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => reset,
      CLR => \^reset_0\,
      D => \fifo_capacity[15]_i_1_n_0\,
      Q => fifo_capacity(15)
    );
\fifo_capacity_reg[16]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => reset,
      CLR => \^reset_0\,
      D => \fifo_capacity[16]_i_1_n_0\,
      Q => fifo_capacity(16)
    );
\fifo_capacity_reg[17]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => reset,
      CLR => \^reset_0\,
      D => \fifo_capacity[17]_i_1_n_0\,
      Q => fifo_capacity(17)
    );
\fifo_capacity_reg[18]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => reset,
      CLR => \^reset_0\,
      D => \fifo_capacity[18]_i_1_n_0\,
      Q => fifo_capacity(18)
    );
\fifo_capacity_reg[19]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => reset,
      CLR => \^reset_0\,
      D => \fifo_capacity[19]_i_1_n_0\,
      Q => fifo_capacity(19)
    );
\fifo_capacity_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => reset,
      CLR => \^reset_0\,
      D => \fifo_capacity[1]_i_1_n_0\,
      Q => fifo_capacity(1)
    );
\fifo_capacity_reg[20]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => reset,
      CLR => \^reset_0\,
      D => \fifo_capacity[20]_i_1_n_0\,
      Q => fifo_capacity(20)
    );
\fifo_capacity_reg[21]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => reset,
      CLR => \^reset_0\,
      D => \fifo_capacity[21]_i_1_n_0\,
      Q => fifo_capacity(21)
    );
\fifo_capacity_reg[22]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => reset,
      CLR => \^reset_0\,
      D => \fifo_capacity[22]_i_1_n_0\,
      Q => fifo_capacity(22)
    );
\fifo_capacity_reg[23]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => reset,
      CLR => \^reset_0\,
      D => \fifo_capacity[23]_i_1_n_0\,
      Q => fifo_capacity(23)
    );
\fifo_capacity_reg[24]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => reset,
      CLR => \^reset_0\,
      D => \fifo_capacity[24]_i_1_n_0\,
      Q => fifo_capacity(24)
    );
\fifo_capacity_reg[25]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => reset,
      CLR => \^reset_0\,
      D => \fifo_capacity[25]_i_1_n_0\,
      Q => fifo_capacity(25)
    );
\fifo_capacity_reg[26]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => reset,
      CLR => \^reset_0\,
      D => \fifo_capacity[26]_i_1_n_0\,
      Q => fifo_capacity(26)
    );
\fifo_capacity_reg[27]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => reset,
      CLR => \^reset_0\,
      D => \fifo_capacity[27]_i_1_n_0\,
      Q => fifo_capacity(27)
    );
\fifo_capacity_reg[28]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => reset,
      CLR => \^reset_0\,
      D => \fifo_capacity[28]_i_1_n_0\,
      Q => fifo_capacity(28)
    );
\fifo_capacity_reg[29]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => reset,
      CLR => \^reset_0\,
      D => \fifo_capacity[29]_i_1_n_0\,
      Q => fifo_capacity(29)
    );
\fifo_capacity_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => reset,
      CLR => \^reset_0\,
      D => \fifo_capacity[2]_i_1_n_0\,
      Q => fifo_capacity(2)
    );
\fifo_capacity_reg[30]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => reset,
      CLR => \^reset_0\,
      D => \fifo_capacity[30]_i_1_n_0\,
      Q => fifo_capacity(30)
    );
\fifo_capacity_reg[31]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => reset,
      CLR => \^reset_0\,
      D => \fifo_capacity[31]_i_1_n_0\,
      Q => fifo_capacity(31)
    );
\fifo_capacity_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => reset,
      CLR => \^reset_0\,
      D => \fifo_capacity[3]_i_1_n_0\,
      Q => fifo_capacity(3)
    );
\fifo_capacity_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => reset,
      CLR => \^reset_0\,
      D => \fifo_capacity[4]_i_1_n_0\,
      Q => fifo_capacity(4)
    );
\fifo_capacity_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => reset,
      CLR => \^reset_0\,
      D => \fifo_capacity[5]_i_1_n_0\,
      Q => fifo_capacity(5)
    );
\fifo_capacity_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => reset,
      CLR => \^reset_0\,
      D => \fifo_capacity[6]_i_1_n_0\,
      Q => fifo_capacity(6)
    );
\fifo_capacity_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => reset,
      CLR => \^reset_0\,
      D => \fifo_capacity[7]_i_1_n_0\,
      Q => fifo_capacity(7)
    );
\fifo_capacity_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => reset,
      CLR => \^reset_0\,
      D => \fifo_capacity[8]_i_1_n_0\,
      Q => fifo_capacity(8)
    );
\fifo_capacity_reg[9]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => reset,
      CLR => \^reset_0\,
      D => \fifo_capacity[9]_i_1_n_0\,
      Q => fifo_capacity(9)
    );
\rd_ptr[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B4"
    )
        port map (
      I0 => \fifo_capacity[31]_i_2_n_0\,
      I1 => reset,
      I2 => rd_ptr(0),
      O => \rd_ptr[0]_i_1_n_0\
    );
\rd_ptr[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F708"
    )
        port map (
      I0 => rd_ptr(0),
      I1 => reset,
      I2 => \fifo_capacity[31]_i_2_n_0\,
      I3 => rd_ptr(1),
      O => \rd_ptr[1]_i_1_n_0\
    );
\rd_ptr_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \^reset_0\,
      D => \rd_ptr[0]_i_1_n_0\,
      Q => rd_ptr(0)
    );
\rd_ptr_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \^reset_0\,
      D => \rd_ptr[1]_i_1_n_0\,
      Q => rd_ptr(1)
    );
read_reg_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => read_reg_i_2_n_0,
      I1 => read_reg_i_3_n_0,
      I2 => read_reg_i_4_n_0,
      I3 => fifo_capacity(2),
      O => \fifo_capacity_reg[2]_0\
    );
read_reg_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => read_reg_i_5_n_0,
      I1 => read_reg_i_6_n_0,
      I2 => fifo_capacity(31),
      I3 => fifo_capacity(30),
      I4 => fifo_capacity(0),
      I5 => read_reg_i_7_n_0,
      O => read_reg_i_2_n_0
    );
read_reg_i_3: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => fifo_capacity(4),
      I1 => fifo_capacity(5),
      I2 => fifo_capacity(1),
      I3 => fifo_capacity(3),
      I4 => read_reg_i_8_n_0,
      O => read_reg_i_3_n_0
    );
read_reg_i_4: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => fifo_capacity(12),
      I1 => fifo_capacity(13),
      I2 => fifo_capacity(10),
      I3 => fifo_capacity(11),
      I4 => read_reg_i_9_n_0,
      O => read_reg_i_4_n_0
    );
read_reg_i_5: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => fifo_capacity(23),
      I1 => fifo_capacity(22),
      I2 => fifo_capacity(25),
      I3 => fifo_capacity(24),
      O => read_reg_i_5_n_0
    );
read_reg_i_6: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => fifo_capacity(19),
      I1 => fifo_capacity(18),
      I2 => fifo_capacity(21),
      I3 => fifo_capacity(20),
      O => read_reg_i_6_n_0
    );
read_reg_i_7: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => fifo_capacity(27),
      I1 => fifo_capacity(26),
      I2 => fifo_capacity(29),
      I3 => fifo_capacity(28),
      O => read_reg_i_7_n_0
    );
read_reg_i_8: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => fifo_capacity(7),
      I1 => fifo_capacity(6),
      I2 => fifo_capacity(9),
      I3 => fifo_capacity(8),
      O => read_reg_i_8_n_0
    );
read_reg_i_9: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => fifo_capacity(15),
      I1 => fifo_capacity(14),
      I2 => fifo_capacity(17),
      I3 => fifo_capacity(16),
      O => read_reg_i_9_n_0
    );
scl_reg_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => reset,
      O => \^reset_0\
    );
\wr_ptr[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => wr_ptr_0,
      I1 => wr_ptr(0),
      O => \wr_ptr[0]_i_1_n_0\
    );
\wr_ptr[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => wr_ptr(0),
      I1 => wr_ptr_0,
      I2 => wr_ptr(1),
      O => \wr_ptr[1]_i_1_n_0\
    );
\wr_ptr[1]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFD000000000000"
    )
        port map (
      I0 => fifo_capacity(2),
      I1 => read_reg_i_4_n_0,
      I2 => read_reg_i_3_n_0,
      I3 => read_reg_i_2_n_0,
      I4 => wr,
      I5 => reset,
      O => wr_ptr_0
    );
\wr_ptr_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \^reset_0\,
      D => \wr_ptr[0]_i_1_n_0\,
      Q => wr_ptr(0)
    );
\wr_ptr_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \^reset_0\,
      D => \wr_ptr[1]_i_1_n_0\,
      Q => wr_ptr(1)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity display_spi_spi_wrapper_0_0_spi is
  port (
    scl : out STD_LOGIC;
    csx : out STD_LOGIC;
    dcx : out STD_LOGIC;
    wr : in STD_LOGIC;
    reset : in STD_LOGIC;
    clk : in STD_LOGIC;
    data_i : in STD_LOGIC_VECTOR ( 2 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of display_spi_spi_wrapper_0_0_spi : entity is "spi";
end display_spi_spi_wrapper_0_0_spi;

architecture STRUCTURE of display_spi_spi_wrapper_0_0_spi is
  signal mosi_reg_n_0 : STD_LOGIC;
  signal read : STD_LOGIC;
  signal tx_fifo_data_o : STD_LOGIC_VECTOR ( 9 downto 8 );
  signal tx_fifo_n_0 : STD_LOGIC;
  signal tx_fifo_n_3 : STD_LOGIC;
  signal tx_fifo_n_4 : STD_LOGIC;
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of csx_reg : label is "LD";
  attribute XILINX_LEGACY_PRIM of dcx_reg : label is "LD";
  attribute OPT_MODIFIED : string;
  attribute OPT_MODIFIED of mosi_reg : label is "MLO";
  attribute XILINX_LEGACY_PRIM of mosi_reg : label is "LD";
  attribute XILINX_LEGACY_PRIM of read_reg : label is "LDC";
begin
csx_reg: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => tx_fifo_data_o(8),
      G => '0',
      GE => '1',
      Q => csx
    );
dcx_reg: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => tx_fifo_data_o(9),
      G => '0',
      GE => '1',
      Q => dcx
    );
mosi_reg: unisim.vcomponents.LDCE
    generic map(
      INIT => '0',
      IS_G_INVERTED => '1'
    )
        port map (
      CLR => '0',
      D => tx_fifo_n_3,
      G => reset,
      GE => '1',
      Q => mosi_reg_n_0
    );
read_reg: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => tx_fifo_n_0,
      D => '1',
      G => tx_fifo_n_4,
      GE => '1',
      Q => read
    );
scl_gen: entity work.display_spi_spi_wrapper_0_0_scl_generator
     port map (
      reset => reset,
      scl => scl,
      scl_0 => tx_fifo_n_0
    );
tx_fifo: entity work.display_spi_spi_wrapper_0_0_spi_fifo
     port map (
      clk => clk,
      data_i(2 downto 0) => data_i(2 downto 0),
      \data_o_reg[0]_0\ => tx_fifo_n_3,
      \fifo_capacity_reg[2]_0\ => tx_fifo_n_4,
      read => read,
      reset => reset,
      reset_0 => tx_fifo_n_0,
      tx_fifo_data_o(1 downto 0) => tx_fifo_data_o(9 downto 8),
      wr => wr
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity display_spi_spi_wrapper_0_0_spi_wrapper is
  port (
    scl : out STD_LOGIC;
    csx : out STD_LOGIC;
    dcx : out STD_LOGIC;
    wr : in STD_LOGIC;
    reset : in STD_LOGIC;
    clk : in STD_LOGIC;
    data_i : in STD_LOGIC_VECTOR ( 2 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of display_spi_spi_wrapper_0_0_spi_wrapper : entity is "spi_wrapper";
end display_spi_spi_wrapper_0_0_spi_wrapper;

architecture STRUCTURE of display_spi_spi_wrapper_0_0_spi_wrapper is
begin
spi_wrapped: entity work.display_spi_spi_wrapper_0_0_spi
     port map (
      clk => clk,
      csx => csx,
      data_i(2 downto 0) => data_i(2 downto 0),
      dcx => dcx,
      reset => reset,
      scl => scl,
      wr => wr
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity display_spi_spi_wrapper_0_0 is
  port (
    clk : inout STD_LOGIC;
    miso : inout STD_LOGIC;
    mosi : inout STD_LOGIC;
    scl : inout STD_LOGIC;
    csx : inout STD_LOGIC;
    dcx : inout STD_LOGIC;
    wr : inout STD_LOGIC;
    data_i : inout STD_LOGIC_VECTOR ( 9 downto 0 );
    rd : inout STD_LOGIC;
    data_o : inout STD_LOGIC_VECTOR ( 9 downto 0 );
    reset : inout STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of display_spi_spi_wrapper_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of display_spi_spi_wrapper_0_0 : entity is "display_spi_spi_wrapper_0_0,spi_wrapper,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of display_spi_spi_wrapper_0_0 : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of display_spi_spi_wrapper_0_0 : entity is "module_ref";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of display_spi_spi_wrapper_0_0 : entity is "spi_wrapper,Vivado 2020.1";
end display_spi_spi_wrapper_0_0;

architecture STRUCTURE of display_spi_spi_wrapper_0_0 is
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of clk : signal is "xilinx.com:signal:clock:1.0 clk CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of clk : signal is "XIL_INTERFACENAME clk, ASSOCIATED_RESET reset, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN /clk_wiz_clk_out1, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of reset : signal is "xilinx.com:signal:reset:1.0 reset RST";
  attribute X_INTERFACE_PARAMETER of reset : signal is "XIL_INTERFACENAME reset, POLARITY ACTIVE_LOW, INSERT_VIP 0";
begin
inst: entity work.display_spi_spi_wrapper_0_0_spi_wrapper
     port map (
      clk => clk,
      csx => csx,
      data_i(2 downto 1) => data_i(9 downto 8),
      data_i(0) => data_i(0),
      dcx => dcx,
      reset => reset,
      scl => scl,
      wr => wr
    );
end STRUCTURE;
