----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:34:35 11/22/2015 
-- Design Name: 
-- Module Name:    roundctrl - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity roundctrl is
    Port ( Init, Clock: in  STD_LOGIC;
           Enable1, Enable2, Enable3, Result: out  STD_LOGIC := '0';
			  S : out STD_LOGIC_VECTOR(1 DOWNTO 0) := (ohters=>'0')
			);
end roundctrl;

architecture Behavioral of roundctrl is

begin
	process(Init,Clock)
		variable counter : integer := 0;
	begin
		if (Clock = '1' and Clock'EVENT)
		then
		
			if (Init = '0' and Init'EVENT)
			then
				count := 0;
			end if;
			
			case count is
				when 0 => Enable1 <= '1'; S <= "00";
				when 1 => Enable1 <= '0';
				when 2 => Enable2 <= '1'; S <= "01";
				when 3 => Enable2 <= '0';
				when 4 => Enable3 <= '1'; S <= "1s0";
				when 5 => Enable3 <= '0';
				when 6 => Result  <= '1'; S <= "11";
				when 7 => Result 	<= '0' ;
				when others => NULL;
			end case;
					
			count := count + 1;
		end if;
	end process;
end Behavioral;

