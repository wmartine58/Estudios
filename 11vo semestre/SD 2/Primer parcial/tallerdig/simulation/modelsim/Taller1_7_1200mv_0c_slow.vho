-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II 64-Bit"
-- VERSION "Version 13.0.0 Build 156 04/24/2013 SJ Full Version"

-- DATE "12/07/2016 23:28:33"

-- 
-- Device: Altera EP4CGX15BN11C7 Package QFN148
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY CYCLONEIV;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE CYCLONEIV.CYCLONEIV_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	bitcount IS
    PORT (
	Clock : IN std_logic;
	Resetn : IN std_logic;
	LA : IN std_logic;
	s : IN std_logic;
	Data : IN std_logic_vector(7 DOWNTO 0);
	B : BUFFER std_logic_vector(3 DOWNTO 0);
	Done : OUT std_logic
	);
END bitcount;

-- Design Ports Information
-- B[0]	=>  Location: PIN_A55,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- B[1]	=>  Location: PIN_A63,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- B[2]	=>  Location: PIN_B54,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- B[3]	=>  Location: PIN_B53,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Done	=>  Location: PIN_B52,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Clock	=>  Location: PIN_B27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Resetn	=>  Location: PIN_A31,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- s	=>  Location: PIN_A57,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Data[0]	=>  Location: PIN_B51,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LA	=>  Location: PIN_A54,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Data[1]	=>  Location: PIN_B47,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Data[2]	=>  Location: PIN_A56,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Data[3]	=>  Location: PIN_B46,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Data[4]	=>  Location: PIN_B49,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Data[5]	=>  Location: PIN_A62,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Data[6]	=>  Location: PIN_A58,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Data[7]	=>  Location: PIN_A50,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF bitcount IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_Clock : std_logic;
SIGNAL ww_Resetn : std_logic;
SIGNAL ww_LA : std_logic;
SIGNAL ww_s : std_logic;
SIGNAL ww_Data : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_B : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_Done : std_logic;
SIGNAL \Resetn~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \Clock~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \ShiftA|Q~6_combout\ : std_logic;
SIGNAL \s~input_o\ : std_logic;
SIGNAL \Data[6]~input_o\ : std_logic;
SIGNAL \B[0]~output_o\ : std_logic;
SIGNAL \B[1]~output_o\ : std_logic;
SIGNAL \B[2]~output_o\ : std_logic;
SIGNAL \B[3]~output_o\ : std_logic;
SIGNAL \Done~output_o\ : std_logic;
SIGNAL \Clock~input_o\ : std_logic;
SIGNAL \Clock~inputclkctrl_outclk\ : std_logic;
SIGNAL \Data[2]~input_o\ : std_logic;
SIGNAL \Data[3]~input_o\ : std_logic;
SIGNAL \LA~input_o\ : std_logic;
SIGNAL \Data[5]~input_o\ : std_logic;
SIGNAL \ShiftA|Q~5_combout\ : std_logic;
SIGNAL \Selector4~0_combout\ : std_logic;
SIGNAL \Data[4]~input_o\ : std_logic;
SIGNAL \ShiftA|Q~4_combout\ : std_logic;
SIGNAL \ShiftA|Q~3_combout\ : std_logic;
SIGNAL \ShiftA|Q~2_combout\ : std_logic;
SIGNAL \Data[0]~input_o\ : std_logic;
SIGNAL \Data[1]~input_o\ : std_logic;
SIGNAL \ShiftA|Q~1_combout\ : std_logic;
SIGNAL \ShiftA|Q~0_combout\ : std_logic;
SIGNAL \Equal0~0_combout\ : std_logic;
SIGNAL \Data[7]~input_o\ : std_logic;
SIGNAL \ShiftA|Q~7_combout\ : std_logic;
SIGNAL \Equal0~1_combout\ : std_logic;
SIGNAL \Equal0~2_combout\ : std_logic;
SIGNAL \Selector1~0_combout\ : std_logic;
SIGNAL \Resetn~input_o\ : std_logic;
SIGNAL \Resetn~inputclkctrl_outclk\ : std_logic;
SIGNAL \y.S2~q\ : std_logic;
SIGNAL \Selector0~0_combout\ : std_logic;
SIGNAL \y.S1~q\ : std_logic;
SIGNAL \B~0_combout\ : std_logic;
SIGNAL \Selector3~0_combout\ : std_logic;
SIGNAL \B[0]~reg0_q\ : std_logic;
SIGNAL \B~1_combout\ : std_logic;
SIGNAL \B[1]~reg0_q\ : std_logic;
SIGNAL \B~2_combout\ : std_logic;
SIGNAL \B[2]~reg0_q\ : std_logic;
SIGNAL \Add0~0_combout\ : std_logic;
SIGNAL \B~3_combout\ : std_logic;
SIGNAL \B[3]~reg0_q\ : std_logic;
SIGNAL \Selector2~0_combout\ : std_logic;
SIGNAL \y.S3~q\ : std_logic;
SIGNAL \ShiftA|Q\ : std_logic_vector(7 DOWNTO 0);

BEGIN

ww_Clock <= Clock;
ww_Resetn <= Resetn;
ww_LA <= LA;
ww_s <= s;
ww_Data <= Data;
B <= ww_B;
Done <= ww_Done;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\Resetn~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \Resetn~input_o\);

\Clock~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \Clock~input_o\);

-- Location: FF_X32_Y30_N23
\ShiftA|Q[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock~inputclkctrl_outclk\,
	d => \ShiftA|Q~6_combout\,
	ena => \Selector4~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ShiftA|Q\(6));

-- Location: LCCOMB_X32_Y30_N22
\ShiftA|Q~6\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ShiftA|Q~6_combout\ = (\LA~input_o\ & ((\Data[6]~input_o\))) # (!\LA~input_o\ & (\ShiftA|Q\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ShiftA|Q\(7),
	datac => \LA~input_o\,
	datad => \Data[6]~input_o\,
	combout => \ShiftA|Q~6_combout\);

-- Location: IOIBUF_X33_Y27_N1
\s~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_s,
	o => \s~input_o\);

-- Location: IOIBUF_X33_Y28_N1
\Data[6]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Data(6),
	o => \Data[6]~input_o\);

-- Location: IOOBUF_X33_Y25_N9
\B[0]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \B[0]~reg0_q\,
	devoe => ww_devoe,
	o => \B[0]~output_o\);

-- Location: IOOBUF_X26_Y31_N2
\B[1]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \B[1]~reg0_q\,
	devoe => ww_devoe,
	o => \B[1]~output_o\);

-- Location: IOOBUF_X26_Y31_N9
\B[2]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \B[2]~reg0_q\,
	devoe => ww_devoe,
	o => \B[2]~output_o\);

-- Location: IOOBUF_X29_Y31_N9
\B[3]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \B[3]~reg0_q\,
	devoe => ww_devoe,
	o => \B[3]~output_o\);

-- Location: IOOBUF_X31_Y31_N9
\Done~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \y.S3~q\,
	devoe => ww_devoe,
	o => \Done~output_o\);

-- Location: IOIBUF_X16_Y0_N15
\Clock~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Clock,
	o => \Clock~input_o\);

-- Location: CLKCTRL_G17
\Clock~inputclkctrl\ : cycloneiv_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \Clock~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \Clock~inputclkctrl_outclk\);

-- Location: IOIBUF_X33_Y27_N8
\Data[2]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Data(2),
	o => \Data[2]~input_o\);

-- Location: IOIBUF_X33_Y24_N8
\Data[3]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Data(3),
	o => \Data[3]~input_o\);

-- Location: IOIBUF_X33_Y24_N1
\LA~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_LA,
	o => \LA~input_o\);

-- Location: IOIBUF_X29_Y31_N1
\Data[5]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Data(5),
	o => \Data[5]~input_o\);

-- Location: LCCOMB_X32_Y30_N24
\ShiftA|Q~5\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ShiftA|Q~5_combout\ = (\LA~input_o\ & ((\Data[5]~input_o\))) # (!\LA~input_o\ & (\ShiftA|Q\(6)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ShiftA|Q\(6),
	datac => \LA~input_o\,
	datad => \Data[5]~input_o\,
	combout => \ShiftA|Q~5_combout\);

-- Location: LCCOMB_X32_Y30_N14
\Selector4~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Selector4~0_combout\ = (\y.S2~q\) # ((!\s~input_o\ & (\LA~input_o\ & !\y.S1~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \s~input_o\,
	datab => \LA~input_o\,
	datac => \y.S2~q\,
	datad => \y.S1~q\,
	combout => \Selector4~0_combout\);

-- Location: FF_X32_Y30_N25
\ShiftA|Q[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock~inputclkctrl_outclk\,
	d => \ShiftA|Q~5_combout\,
	ena => \Selector4~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ShiftA|Q\(5));

-- Location: IOIBUF_X33_Y28_N8
\Data[4]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Data(4),
	o => \Data[4]~input_o\);

-- Location: LCCOMB_X32_Y30_N30
\ShiftA|Q~4\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ShiftA|Q~4_combout\ = (\LA~input_o\ & ((\Data[4]~input_o\))) # (!\LA~input_o\ & (\ShiftA|Q\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ShiftA|Q\(5),
	datac => \LA~input_o\,
	datad => \Data[4]~input_o\,
	combout => \ShiftA|Q~4_combout\);

-- Location: FF_X32_Y30_N31
\ShiftA|Q[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock~inputclkctrl_outclk\,
	d => \ShiftA|Q~4_combout\,
	ena => \Selector4~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ShiftA|Q\(4));

-- Location: LCCOMB_X32_Y30_N10
\ShiftA|Q~3\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ShiftA|Q~3_combout\ = (\LA~input_o\ & (\Data[3]~input_o\)) # (!\LA~input_o\ & ((\ShiftA|Q\(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100011011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LA~input_o\,
	datab => \Data[3]~input_o\,
	datac => \ShiftA|Q\(4),
	combout => \ShiftA|Q~3_combout\);

-- Location: FF_X32_Y30_N11
\ShiftA|Q[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock~inputclkctrl_outclk\,
	d => \ShiftA|Q~3_combout\,
	ena => \Selector4~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ShiftA|Q\(3));

-- Location: LCCOMB_X32_Y30_N28
\ShiftA|Q~2\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ShiftA|Q~2_combout\ = (\LA~input_o\ & (\Data[2]~input_o\)) # (!\LA~input_o\ & ((\ShiftA|Q\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LA~input_o\,
	datab => \Data[2]~input_o\,
	datad => \ShiftA|Q\(3),
	combout => \ShiftA|Q~2_combout\);

-- Location: FF_X32_Y30_N29
\ShiftA|Q[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock~inputclkctrl_outclk\,
	d => \ShiftA|Q~2_combout\,
	ena => \Selector4~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ShiftA|Q\(2));

-- Location: IOIBUF_X31_Y31_N1
\Data[0]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Data(0),
	o => \Data[0]~input_o\);

-- Location: IOIBUF_X33_Y25_N1
\Data[1]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Data(1),
	o => \Data[1]~input_o\);

-- Location: LCCOMB_X32_Y30_N18
\ShiftA|Q~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ShiftA|Q~1_combout\ = (\LA~input_o\ & ((\Data[1]~input_o\))) # (!\LA~input_o\ & (\ShiftA|Q\(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ShiftA|Q\(2),
	datac => \LA~input_o\,
	datad => \Data[1]~input_o\,
	combout => \ShiftA|Q~1_combout\);

-- Location: FF_X32_Y30_N19
\ShiftA|Q[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock~inputclkctrl_outclk\,
	d => \ShiftA|Q~1_combout\,
	ena => \Selector4~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ShiftA|Q\(1));

-- Location: LCCOMB_X32_Y30_N4
\ShiftA|Q~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ShiftA|Q~0_combout\ = (\LA~input_o\ & (\Data[0]~input_o\)) # (!\LA~input_o\ & ((\ShiftA|Q\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LA~input_o\,
	datac => \Data[0]~input_o\,
	datad => \ShiftA|Q\(1),
	combout => \ShiftA|Q~0_combout\);

-- Location: FF_X32_Y30_N5
\ShiftA|Q[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock~inputclkctrl_outclk\,
	d => \ShiftA|Q~0_combout\,
	ena => \Selector4~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ShiftA|Q\(0));

-- Location: LCCOMB_X32_Y30_N8
\Equal0~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Equal0~0_combout\ = (!\ShiftA|Q\(3) & (!\ShiftA|Q\(2) & (!\ShiftA|Q\(0) & !\ShiftA|Q\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ShiftA|Q\(3),
	datab => \ShiftA|Q\(2),
	datac => \ShiftA|Q\(0),
	datad => \ShiftA|Q\(1),
	combout => \Equal0~0_combout\);

-- Location: IOIBUF_X33_Y16_N22
\Data[7]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Data(7),
	o => \Data[7]~input_o\);

-- Location: LCCOMB_X32_Y30_N12
\ShiftA|Q~7\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ShiftA|Q~7_combout\ = (\LA~input_o\ & \Data[7]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LA~input_o\,
	datac => \Data[7]~input_o\,
	combout => \ShiftA|Q~7_combout\);

-- Location: FF_X32_Y30_N13
\ShiftA|Q[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock~inputclkctrl_outclk\,
	d => \ShiftA|Q~7_combout\,
	ena => \Selector4~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ShiftA|Q\(7));

-- Location: LCCOMB_X32_Y30_N2
\Equal0~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Equal0~1_combout\ = (!\ShiftA|Q\(6) & (!\ShiftA|Q\(5) & (!\ShiftA|Q\(4) & !\ShiftA|Q\(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ShiftA|Q\(6),
	datab => \ShiftA|Q\(5),
	datac => \ShiftA|Q\(4),
	datad => \ShiftA|Q\(7),
	combout => \Equal0~1_combout\);

-- Location: LCCOMB_X32_Y30_N20
\Equal0~2\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Equal0~2_combout\ = (\Equal0~0_combout\ & \Equal0~1_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Equal0~0_combout\,
	datad => \Equal0~1_combout\,
	combout => \Equal0~2_combout\);

-- Location: LCCOMB_X32_Y30_N26
\Selector1~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Selector1~0_combout\ = (\s~input_o\ & (((\y.S2~q\ & !\Equal0~2_combout\)) # (!\y.S1~q\))) # (!\s~input_o\ & (((\y.S2~q\ & !\Equal0~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010001011110010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \s~input_o\,
	datab => \y.S1~q\,
	datac => \y.S2~q\,
	datad => \Equal0~2_combout\,
	combout => \Selector1~0_combout\);

-- Location: IOIBUF_X16_Y0_N22
\Resetn~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Resetn,
	o => \Resetn~input_o\);

-- Location: CLKCTRL_G19
\Resetn~inputclkctrl\ : cycloneiv_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \Resetn~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \Resetn~inputclkctrl_outclk\);

-- Location: FF_X32_Y30_N27
\y.S2\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock~inputclkctrl_outclk\,
	d => \Selector1~0_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \y.S2~q\);

-- Location: LCCOMB_X32_Y30_N6
\Selector0~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Selector0~0_combout\ = (\s~input_o\) # (\y.S2~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \s~input_o\,
	datad => \y.S2~q\,
	combout => \Selector0~0_combout\);

-- Location: FF_X32_Y30_N7
\y.S1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock~inputclkctrl_outclk\,
	d => \Selector0~0_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \y.S1~q\);

-- Location: LCCOMB_X31_Y30_N16
\B~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \B~0_combout\ = (!\B[0]~reg0_q\ & \y.S1~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \B[0]~reg0_q\,
	datad => \y.S1~q\,
	combout => \B~0_combout\);

-- Location: LCCOMB_X32_Y30_N16
\Selector3~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Selector3~0_combout\ = ((\ShiftA|Q\(0) & \y.S2~q\)) # (!\y.S1~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ShiftA|Q\(0),
	datac => \y.S2~q\,
	datad => \y.S1~q\,
	combout => \Selector3~0_combout\);

-- Location: FF_X31_Y30_N17
\B[0]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock~inputclkctrl_outclk\,
	d => \B~0_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Selector3~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \B[0]~reg0_q\);

-- Location: LCCOMB_X31_Y30_N18
\B~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \B~1_combout\ = (\y.S1~q\ & (\B[1]~reg0_q\ $ (\B[0]~reg0_q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \y.S1~q\,
	datac => \B[1]~reg0_q\,
	datad => \B[0]~reg0_q\,
	combout => \B~1_combout\);

-- Location: FF_X31_Y30_N19
\B[1]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock~inputclkctrl_outclk\,
	d => \B~1_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Selector3~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \B[1]~reg0_q\);

-- Location: LCCOMB_X31_Y30_N8
\B~2\ : cycloneiv_lcell_comb
-- Equation(s):
-- \B~2_combout\ = (\y.S1~q\ & (\B[2]~reg0_q\ $ (((\B[1]~reg0_q\ & \B[0]~reg0_q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010100010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \y.S1~q\,
	datab => \B[1]~reg0_q\,
	datac => \B[2]~reg0_q\,
	datad => \B[0]~reg0_q\,
	combout => \B~2_combout\);

-- Location: FF_X31_Y30_N9
\B[2]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock~inputclkctrl_outclk\,
	d => \B~2_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Selector3~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \B[2]~reg0_q\);

-- Location: LCCOMB_X31_Y30_N12
\Add0~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Add0~0_combout\ = \B[3]~reg0_q\ $ (((\B[0]~reg0_q\ & (\B[2]~reg0_q\ & \B[1]~reg0_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \B[3]~reg0_q\,
	datab => \B[0]~reg0_q\,
	datac => \B[2]~reg0_q\,
	datad => \B[1]~reg0_q\,
	combout => \Add0~0_combout\);

-- Location: LCCOMB_X31_Y30_N6
\B~3\ : cycloneiv_lcell_comb
-- Equation(s):
-- \B~3_combout\ = (\y.S1~q\ & \Add0~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \y.S1~q\,
	datad => \Add0~0_combout\,
	combout => \B~3_combout\);

-- Location: FF_X31_Y30_N7
\B[3]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock~inputclkctrl_outclk\,
	d => \B~3_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Selector3~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \B[3]~reg0_q\);

-- Location: LCCOMB_X32_Y30_N0
\Selector2~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Selector2~0_combout\ = (\s~input_o\ & ((\y.S3~q\) # ((\y.S2~q\ & \Equal0~2_combout\)))) # (!\s~input_o\ & (\y.S2~q\ & ((\Equal0~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \s~input_o\,
	datab => \y.S2~q\,
	datac => \y.S3~q\,
	datad => \Equal0~2_combout\,
	combout => \Selector2~0_combout\);

-- Location: FF_X32_Y30_N1
\y.S3\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock~inputclkctrl_outclk\,
	d => \Selector2~0_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \y.S3~q\);

ww_B(0) <= \B[0]~output_o\;

ww_B(1) <= \B[1]~output_o\;

ww_B(2) <= \B[2]~output_o\;

ww_B(3) <= \B[3]~output_o\;

ww_Done <= \Done~output_o\;
END structure;


