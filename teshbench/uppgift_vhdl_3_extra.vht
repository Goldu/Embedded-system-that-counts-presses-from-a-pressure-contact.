-- Copyright (C) 1991-2014 Altera Corporation. All rights reserved.
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, the Altera Quartus II License Agreement,
-- the Altera MegaCore Function License Agreement, or other 
-- applicable license agreement, including, without limitation, 
-- that your use is for the sole purpose of programming logic 
-- devices manufactured by Altera and sold by Altera or its 
-- authorized distributors.  Please refer to the applicable 
-- agreement for further details.

-- ***************************************************************************
-- This file contains a Vhdl test bench template that is freely editable to   
-- suit user's needs .Comments are provided in each section to help the user  
-- fill out necessary details.                                                
-- ***************************************************************************
-- Generated on "01/04/2015 17:43:53"
                                                            
-- Vhdl Test Bench template for design  :  uppgift_vhdl_3_extra
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- Company: TEIS AB
-- Engineer: Jasim Abbasi
-- Create Date: 2014 November 21
-- Design Name: uppgift_vhdl_3_extra
-- Target Devices: ALTERA Cyclone IV EP4CE115F29C7
-- Tool versions: Quartus v11 and ModelSim
-- I/O Pin Description
-- Sys_clk: PIN_Y2
-- Reset_n: PIN_Y23
-- lysdiod_ut[2..0]:PIN_E24,PIN_E25,PIN_E22
-- knapp_in_1 : PIN_M23

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY uppgift_vhdl_3_extra_vhd_tst IS
END uppgift_vhdl_3_extra_vhd_tst;
ARCHITECTURE uppgift_vhdl_3_extra_arch OF uppgift_vhdl_3_extra_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL knapp_in_1 : STD_LOGIC;
SIGNAL lysdiod_ut : STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL reset_n : STD_LOGIC;
SIGNAL Seven : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL Sys_clk : STD_LOGIC;
COMPONENT uppgift_vhdl_3_extra
	PORT (
	knapp_in_1 : IN STD_LOGIC;
	lysdiod_ut : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
	reset_n : IN STD_LOGIC;
	Seven : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	Sys_clk : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : uppgift_vhdl_3_extra
	PORT MAP (
-- list connections between master ports and signals
	knapp_in_1 => knapp_in_1,
	lysdiod_ut => lysdiod_ut,
	reset_n => reset_n,
	Seven => Seven,
	Sys_clk => Sys_clk
	);
	clock: process 
begin 
-- Clock period is set to 20 ns => 50MHz 
sys_clk <= '0'; 
WAIT FOR 25ps; 
sys_clk <= '1'; 
WAIT FOR 25ps; 
end process clock; 
reset: process 
begin 
-- Reset at start up 
reset_n <= '0'; 
WAIT FOR 100ps; 
reset_n <= '1'; 
WAIT FOR 250ps;  
end process reset; 
init : PROCESS                                               
-- variable declarations                                     
BEGIN                                                        
        -- code that executes only once  
--- Test case 1 
knapp_in_1 <= '1'; -- Key not pressed 
WAIT FOR 100ps; 
--- Test case 2 
knapp_in_1 <= '0'; -- Key pressed 
WAIT FOR 200ps; 
-- Test case 3 
knapp_in_1 <= '1'; -- Key not pressed 
WAIT FOR 100ps; 		  
WAIT;                                                       
END PROCESS init;                                           
always : PROCESS                                              
-- optional sensitivity list                                  
-- (        )                                                 
-- variable declarations                                      
BEGIN                                                         
        -- code executes for every event on sensitivity list  
WAIT;                                                        
END PROCESS always;                                          
END uppgift_vhdl_3_extra_arch;
