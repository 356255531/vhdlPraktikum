----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:24:52 11/20/2015 
-- Design Name: 
-- Module Name:    multiplexer - Behavioral 
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

entity TTOmultiplexer is
    Port ( 
				S : in  STD_LOGIC;
				Input1, Input2		: in  STD_LOGIC_VECTOR(15 DOWNTO 0);
				Output				: out  STD_LOGIC_VECTOR(15 DOWNTO 0) := (others => '0')
			);
end TTOmultiplexer;

architecture Behavioral of TTOmultiplexer is

begin
	process(S)
	begin
		case S is
			when '0' => Output <= Input1;
			when '1' => Output <= Input2;
		end case;
	end process;
end Behavioral;

