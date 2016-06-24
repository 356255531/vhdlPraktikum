
----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:02:50 11/20/2015 
-- Design Name: 
-- Module Name:    control - Behavioral 
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

entity control is
		Port(
				Start : in   STD_LOGIC ;
				Clock	: in   STD_LOGIC ;
				Enable		: out  STD_LOGIC := '0';
				Ready			: out  STD_LOGIC := '1';
				S				: out  STD_LOGIC := '1';
				Round 		: out  STD_LOGIC_VECTOR(3 DOWNTO 0) :="1000"
				);
end control;

architecture Behavioral of control is
signal Flag : STD_LOGIC := '1';
begin
	process(Clock)
	variable Count : integer := 0;
	begin
		if (Clock = '1' and Clock'EVENT)
		then
		
			if (Start = '1' and Flag = '1' )
			then Ready <= '0';Enable <= '1';s<='0'; count := 0; Flag <= '0';Round <= "0000";
			end if;
		
			case count is
				when 0=> Null;
				when 1=> Round <= "0001";			
				when 2=> Round <= "0010";
				when 3=> Round <= "0011";
				when 4=> Round <= "0100";
				when 5=> Round <= "0101";
				when 6=> Round <= "0110";
				when 7=> Round <= "0111";
				when 8=> Round <= "1000";
				when others => Round <= "1000";Flag <= '1';
			end case;
			

			if (count = 1)
			then S<='1';
			end if;
			
			
			if (count = 8)
			then Ready <= '1'; Enable <= '0';
			end if;
			
			count := count + 1;
		end if;
	end process;
end Behavioral;

