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
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.ALL;
entity uppgift_vhdl_3_extra is
port
( Sys_clk, reset_n, knapp_in_1 : in std_logic;
  Seven: out std_logic_vector(6 downto 0);
lysdiod_ut : out std_logic_vector(2 downto 0)
);
End entity uppgift_vhdl_3_extra;
architecture rtl of uppgift_vhdl_3_extra is
-- internal signal declarations
signal signal_raknarvarde : std_logic_vector(3 downto 0);
signal old_knapp_in_1 : std_logic;
begin
process (sys_clk, reset_n)
begin
if (rising_edge(sys_clk)) then
if reset_n = '0' then -- Reset the counter to 0
    signal_raknarvarde <= "0000";
   elsif knapp_in_1 = '0' then
      signal_raknarvarde <= signal_raknarvarde + '1';
else
       signal_raknarvarde <= signal_raknarvarde;
end if;
end if;
case signal_raknarvarde is
      when "0000" => Seven <= "1000000";----If input is 0000 then display 0
      when "0001" => Seven <= "1111001";----If input is 0001 then display 1
      when "0010" => Seven <= "0100100";----If input is 0010 then display 2
      when "0011" => Seven <= "0110000";----If input is 0010 then display 3
		when "0100" => Seven <= "0011001";----If input is 0100 then display 4
      when "0101" => Seven <= "0010010";----If input is 0101 then display 5
      when "0110" => Seven <= "0000010";----If input is 0110 then display 6
      when "0111" => Seven <= "1111000";----If input is 0111 then display 7
		when "1000" => Seven <= "0000000";----If input is 1000 then display 8
      when "1001" => Seven <= "0011000";----If input is 1001 then display 9
      when "1010" => Seven <= "0001000";----If input is 1010 then display A
      when "1011" => Seven <= "0000011";----If input is 1011 then display B
		when "1100" => Seven <= "1000110";----If input is 1100 then display C
      when "1101" => Seven <= "0100001";----If input is 1101 then display D
      when "1110" => Seven <= "0000110";----If input is 1110 then display E
      when "1111" => Seven <= "0001110";----If input is 1111 then display F
      when others => Seven <= "1111111";----All other combination display nothing

    end case;
end process;
-- utanför processen
lysdiod_ut <= signal_raknarvarde(2 downto 0);
end rtl;