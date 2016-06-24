----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:10:19 01/13/2016 
-- Design Name: 
-- Module Name:    RController - Behavioral 
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

entity RController is
		Port(
				Init : in   STD_LOGIC ;
				Clock	: in   STD_LOGIC ;
				
				EnableR125		: out  STD_LOGIC := '0';
				EnableR346		: out  STD_LOGIC := '0';
				EnableR78		: out  STD_LOGIC := '0';
				
				Result			: out  STD_LOGIC := '0';
				S 					: out  STD_LOGIC_VECTOR(1 DOWNTO 0) := "XX"
				);
end RController;

architecture Behavioral of RController is
signal Flag : STD_LOGIC := '1';
begin
--The process of the RCOntroller
	process(Clock)
	variable InterState : integer := 0;
	begin
	
		if (Clock = '1' and Clock'EVENT)
		then
		
			if (Init = '1' and Flag = '1' )
			then EnableR125 <= '0';EnableR346 <= '0';EnableR78 <= '0';S <= "00"; Result <= '0';InterState := 0;Flag <= '0';
			end if;
	
			case InterState is
				when 0=> Null;
				when 1=> S <= "00";EnableR125 <= '1';
				when 2=> S <= "00";EnableR125 <= '0';
				when 3=> S <= "01";EnableR346 <= '1';
				when 4=> S <= "01";EnableR346 <= '0';
				when 5=> S <= "10";EnableR78 <= '1';
				when 6=> S <= "10";EnableR78 <= '0';
				when 7=> S <= "11";Result <= '1';
				when 8=> S <= "11";Result <= '0';
				when others => S <= "XX";Flag <= '1';
			end case;
			
			InterState := InterState + 1;
		end if;
	end process;
------------------------------------------------------------------------------
end Behavioral;
