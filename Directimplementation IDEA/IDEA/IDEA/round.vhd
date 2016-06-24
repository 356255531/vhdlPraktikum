----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:47:04 11/20/2015 
-- Design Name: 
-- Module Name:    round - Behavioral 
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

entity round is
    Port ( 
				Clock, Start : in STD_LOGIC;
				Ready : out STD_LOGIC;
				X1, X2, X3, X4, Z1, Z2, Z3, Z4 ,Z5, Z6 	: in  STD_LOGIC_VECTOR(15 DOWNTO 0);
				Y1, Y2, Y3, Y4 									: out  STD_LOGIC_VECTOR(15 DOWNTO 0) 	:= (others => '0')
			);
end round;

architecture Behavioral of round is

begin


end Behavioral;

