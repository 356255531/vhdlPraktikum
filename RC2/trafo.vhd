----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:53:42 11/20/2015 
-- Design Name: 
-- Module Name:    trafo - Behavioral 
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

entity trafo is
    Port ( 
				X1 : in  STD_LOGIC_VECTOR(15 DOWNTO 0);
				X2 : in  STD_LOGIC_VECTOR(15 DOWNTO 0);
				X3 : in  STD_LOGIC_VECTOR(15 DOWNTO 0);
				X4 : in  STD_LOGIC_VECTOR(15 DOWNTO 0);
				
				Z1 : in  STD_LOGIC_VECTOR(15 DOWNTO 0);
				Z2 : in  STD_LOGIC_VECTOR(15 DOWNTO 0);
				Z3 : in  STD_LOGIC_VECTOR(15 DOWNTO 0);
				Z4 : in  STD_LOGIC_VECTOR(15 DOWNTO 0);
				
				Y1 : out  STD_LOGIC_VECTOR(15 DOWNTO 0) := (others => '0');
				Y2 : out  STD_LOGIC_VECTOR(15 DOWNTO 0) := (others => '0');
				Y3 : out  STD_LOGIC_VECTOR(15 DOWNTO 0) := (others => '0');
				Y4 : out  STD_LOGIC_VECTOR(15 DOWNTO 0) := (others => '0')
			 );
end trafo;
architecture Behavioral of trafo is

component addop
	Port ( 	
				A : in  STD_LOGIC_VECTOR(15 downto 0);
				B : in  STD_LOGIC_VECTOR(15 downto 0);
				O : out  STD_LOGIC_VECTOR(15 downto 0)
				);
end component;

component mulop
	Port ( 	
				A,B : in  std_logic_vector (15 downto 0);
				O : out  std_logic_vector (15 downto 0));
end component;

begin
u1: mulop port map(X1,Z1,Y1);
u2: addop port map(X3,Z2,Y2);
u3: addop port map(X2,Z3,Y3);
u4: mulop port map(X4,Z4,Y4);
end Behavioral;


