----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:38:51 11/20/2015 
-- Design Name: 
-- Module Name:    idea_single - Behavioral 
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

entity idea_single is
    Port ( 
				Z0							: in   STD_LOGIC_VECTOR(127 DOWNTO 0);
				X1, X2, X3, X4			: in   STD_LOGIC_VECTOR(15 DOWNTO 0) ;
				Y1, Y2, Y3, Y4 		: out  STD_LOGIC_VECTOR(15 DOWNTO 0) := (others => '0');
				Clock, Start			: in   STD_LOGIC ;
				Ready						: out  STD_LOGIC := 0
			  );
end idea_single;

architecture Behavioral of idea_single is

begin


end Behavioral;

