----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:09:19 11/22/2015 
-- Design Name: 
-- Module Name:    reg - Behavioral 
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

entity reg is
    Port ( 
				D : in STD_LOGIC_VECTOR(15 DOWNTO 0);
				Clock, Enable : in  STD_LOGIC;
				Q : out  STD_LOGIC_VECTOR(15 DOWNTO 0) 	:= (others => '0')
			 );
end reg;

architecture Behavioral of reg is
begin
	process(Clock)
	begin
			if (Clock = '1' and Clock'EVENT) then
				if (Enable = '1') then
					Q <= D;
				end if;
			end if;
	end process;
end Behavioral;

