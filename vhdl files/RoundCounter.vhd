----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:54:59 01/14/2016 
-- Design Name: 
-- Module Name:    RoundCounter - Behavioral 
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

entity RoundCounter is
    Port ( 
				Clock : in STD_LOGIC;
				Result : in STD_LOGIC;
				Start : 	in STD_LOGIC;

				Init : 	out STD_LOGIC := '0';
				Trafo : 	out STD_LOGIC := '0';
				Ready : 	out STD_LOGIC := '1';
				Si : 		out STD_LOGIC := '1';
				Round:	out STD_LOGIC_VECTOR(3 DOWNTO 0)
			);
end RoundCounter;

architecture Behavioral of RoundCounter is
signal RRound: STD_LOGIC_VECTOR(3 DOWNTO 0):="0000";
begin
	process(Clock)
	begin
	
		if (Clock = '1' and Clock'EVENT)
		then 
		 
			if (Start = '1') then Init <= '1';Ready <= '0';Trafo <= '0';Si <= '1';Round<="0000";
			elsif (Result = '1' and RRound /= "1000") 
				then 
					Init <= '1';
					Ready <= '0';
					Si <= '0';
					case RRound is
						when "0000"=> Round <= "0001";RRound <=  "0001";
						when "0001"=> Round <= "0010";RRound <=  "0010";
						when "0010"=> Round <= "0011";RRound <=  "0011";
						when "0011"=> Round <= "0100";RRound <=  "0100";
						when "0100"=> Round <= "0101";RRound <=  "0101";
						when "0101"=> Round <= "0110";RRound <=  "0110";
						when "0110"=> Round <= "0111";RRound <=  "0111";
						when "0111"=> Round <= "1000";RRound <=  "1000";Trafo <= '1';
						when others => NULL;
					end case;
			elsif (Result = '1' and RRound = "1000") 
				then 
					Init <= '0';
					Ready <= '1';
			elsif (Result = '0') then Init <= '0';
			else Init <= '0';
			end if;				
		end if;
		

	
	end process;
end Behavioral;

