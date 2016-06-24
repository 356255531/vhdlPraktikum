----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:46:02 10/30/2015 
-- Design Name: 
-- Module Name:    keygen - Behavioral 
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

entity keygen is
    Port ( 
				Z0 : in  STD_LOGIC_VECTOR(127 downto 0);
				
				Round : in STD_LOGIC_VECTOR(3 downto 0);
				
				Z1 : out  STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
				Z2 : out  STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
				Z3 : out  STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
				Z4 : out  STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
				Z5 : out  STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
				Z6 : out  STD_LOGIC_VECTOR(15 downto 0) := (others => '0')
			  );
end keygen;

architecture Behavioral of keygen is
		
begin
	process(Round,Z0)
	begin
		case Round is
			when "0000" => z1<= Z0(127 downto 112);
								z2<= Z0(111 downto 96);
								z3<= Z0(95 downto 80);
								z4<= Z0(79 downto 64);
								z5<= Z0(63 downto 48);
								z6<= Z0(47 downto 32);
			when "0001" => z1<= Z0(31 downto 16);
								z2<= Z0(15 downto 0);
								z3<= Z0(102 downto 87);
								z4<= Z0(86 downto 71);
								z5<= Z0(70 downto 55);
								z6<= Z0(54 downto 39);
			when "0010" => z1<= Z0(38 downto 23);
								z2<= Z0(22 downto 7);
								z3<= Z0(6 downto 0) & Z0(127 downto 119);
								z4<= Z0(118 downto 103);
								z5<= Z0(77 downto 62);
								z6<= Z0(61 downto 46);
			when "0011" => z1<= Z0(45 downto 30);
								z2<= Z0(29 downto 14);
								z3<= Z0(13 downto 0) & Z0(127 downto 126);
								z4<= Z0(125 downto 110);
								z5<= Z0(109 downto 94);
								z6<= Z0(93 downto 78);
			when "0100" => z1<= Z0(52 downto 37);
								z2<= Z0(36 downto 21);
								z3<= Z0(20 downto 5);
								z4<= Z0(4 downto 0) & Z0(127 downto 117);
								z5<= Z0(116 downto 101);
								z6<= Z0(100 downto 85);
			when "0101" => z1<= Z0(84 downto 69);
								z2<= Z0(68 downto 53);
								z3<= Z0(27 downto 12);
								z4<= Z0(11 downto 0) & Z0(127 downto 124);
								z5<= Z0(123 downto 108);
								z6<= Z0(107 downto 92);
			when "0110" => z1<= Z0(91 downto 76);
								z2<= Z0(75 downto 60);
								z3<= Z0(59 downto 44);
								z4<= Z0(43 downto 28);
								z5<= Z0(2 downto 0) & Z0(127 downto 115);
								z6<= Z0(114 downto 99);
			when "0111" => z1<= Z0(98 downto 83);
								z2<= Z0(82 downto 67);
								z3<= Z0(66 downto 51);
								z4<= Z0(50 downto 35);
								z5<= Z0(34 downto 19);
								z6<= Z0(18 downto 3);
			when "1000" => z1<= Z0(105 downto 90);
								z2<= Z0(89 downto 74);
								z3<= Z0(73 downto 58);
								z4<= Z0(57 downto 42);
			when others => z1<= "XXXXXXXXXXXXXXXX";			
								z2<= "XXXXXXXXXXXXXXXX";
								z3<= "XXXXXXXXXXXXXXXX";
								z4<= "XXXXXXXXXXXXXXXX";
								z5<= "XXXXXXXXXXXXXXXX";
								z6<= "XXXXXXXXXXXXXXXX";
		end case;			
	end process;
end Behavioral;
