----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:29:46 10/28/2015 
-- Design Name: 
-- Module Name:    addop - Behavioral 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity addop is
    Port (  A : in  STD_LOGIC_VECTOR(15 downto 0);
				B : in  STD_LOGIC_VECTOR(15 downto 0);
				O : out  STD_LOGIC_VECTOR(15 downto 0)
);
end addop;
architecture Behavioral of addop is
begin
	process(A,B)
	variable C : std_logic_vector(16 downto 0):= (others => '0');
	begin
		C:=('0'&A)+('0'&B);
		O<=C(15 downto 0);
	end process;
end Behavioral;

