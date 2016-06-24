----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:03:21 10/28/2015 
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
				X1 : in  std_logic_vector (15 downto 0);
				X2 : in  std_logic_vector (15 downto 0);
				X3 : in  std_logic_vector (15 downto 0);
				X4 : in  std_logic_vector (15 downto 0);
				
				Z1 : in  std_logic_vector (15 downto 0);
				Z2 : in  std_logic_vector (15 downto 0);
				Z3 : in  std_logic_vector (15 downto 0);
				Z4 : in  std_logic_vector (15 downto 0);
				Z5 : in  std_logic_vector (15 downto 0);
				Z6 : in  std_logic_vector (15 downto 0);

				Y1 : out  std_logic_vector (15 downto 0):= (others => '0');
				Y2 : out  std_logic_vector (15 downto 0):= (others => '0');
				Y3 : out  std_logic_vector (15 downto 0):= (others => '0');
				Y4 : out  std_logic_vector (15 downto 0):= (others => '0')

			  );
end round;

architecture Behavioral of round is
component addop
	Port ( 	A : in  STD_LOGIC_VECTOR(15 downto 0);
				B : in  STD_LOGIC_VECTOR(15 downto 0);
				O : out  STD_LOGIC_VECTOR(15 downto 0)
				);
end component;
component mulop
	Port ( 	A,B : in  std_logic_vector (15 downto 0);
				O : out  std_logic_vector (15 downto 0));
end component;
component xorop
    Port ( A,B : in  std_logic_vector (15 downto 0);
           O : out  std_logic_vector (15 downto 0));
end component;
signal N1,N2,N3,N4,N5,N6,N7,N8,N9,N10 : STD_LOGIC_VECTOR(15 downto 0);
begin
u1: mulop port map(X1,Z1,N1);
u2: addop port map(X2,Z2,N2);
u3: addop port map(X3,Z3,N3);
u4: mulop port map(X4,Z4,N4);
u5: xorop port map(N1,N3,N5);
u6: xorop port map(N2,N4,N6);
u7: mulop port map(N5,Z5,N7);
u8: addop port map(N6,N7,N8);
u9: mulop port map(N8,Z6,N9);
u10: addop port map(N7,N9,N10);
u11: xorop port map(N1,N9,Y1);
u12: xorop port map(N2,N10,Y3);
u13: xorop port map(N3,N9,Y2);
u14: xorop port map(N4,N10,Y4);
end Behavioral;

