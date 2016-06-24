----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:24:44 11/22/2015 
-- Design Name: 
-- Module Name:    FTOmultiplexer - Behavioral 
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

entity FTOmultiplexer is
    Port ( 				
				S : in  STD_LOGIC_VECTOR(1 DOWNTO 0);
				Input1, Input1, Input1, Input1	: in  STD_LOGIC_VECTOR(15 DOWNTO 0);
				Output : out  STD_LOGIC_VECTOR(15 DOWNTO 0) := (others => '0')
			);
end FTOmultiplexer;

architecture Behavioral of FTOmultiplexer is

begin
	process(S)
	begin
		case S is
			when "00" => Output <= Input1;
			when "01" => Output <= Input2;
			when "10" => Output <= Input3;
			when "11" => Output <= Input4;
		end case;
	end process;
end Behavioral;

