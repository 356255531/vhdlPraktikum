----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:38:51 11/20/2015 
-- Design Name: 
-- Module Name:    idea_single - Behavioral 
----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:40:53 11/23/2015 
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
				X1 : in  STD_LOGIC_VECTOR(15 DOWNTO 0);
				X2 : in  STD_LOGIC_VECTOR(15 DOWNTO 0);
				X3 : in  STD_LOGIC_VECTOR(15 DOWNTO 0);
				X4 : in  STD_LOGIC_VECTOR(15 DOWNTO 0);
				Z0 : in  STD_LOGIC_VECTOR(127 DOWNTO 0);
				Clock : in  STD_LOGIC;
				Start : in  STD_LOGIC;
				Ready : out STD_LOGIC;
				Y1 : out  STD_LOGIC_VECTOR(15 DOWNTO 0) := (others=>'0');
				Y2 : out  STD_LOGIC_VECTOR(15 DOWNTO 0) := (others=>'0');
				Y3 : out  STD_LOGIC_VECTOR(15 DOWNTO 0) := (others=>'0');
				Y4 : out  STD_LOGIC_VECTOR(15 DOWNTO 0) := (others=>'0')
			);
end idea_single;
architecture Behavioral of idea_single is

COMPONENT control
	PORT(
         Start : IN  std_logic;
         Clock : IN  std_logic;
         Enable : OUT  std_logic;
         Ready : OUT  std_logic;
         S : OUT  std_logic;
         Round : OUT  std_logic_vector(3 downto 0)
        );
END COMPONENT;

COMPONENT keygen
    PORT(
         Z0 : IN  std_logic_vector(127 downto 0);
         Round : IN  std_logic_vector(3 downto 0);
         Z1 : OUT  std_logic_vector(15 downto 0);
         Z2 : OUT  std_logic_vector(15 downto 0);
         Z3 : OUT  std_logic_vector(15 downto 0);
         Z4 : OUT  std_logic_vector(15 downto 0);
         Z5 : OUT  std_logic_vector(15 downto 0);
         Z6 : OUT  std_logic_vector(15 downto 0)
        );
END COMPONENT;
  
COMPONENT TTOmultiplexer
    PORT(
         S : IN  std_logic;
         Input1 : IN  std_logic_vector(15 downto 0);
         Input2 : IN  std_logic_vector(15 downto 0);
         Output : OUT  std_logic_vector(15 downto 0)
        );
END COMPONENT;
 
COMPONENT round
    PORT(
         X1 : IN  std_logic_vector(15 downto 0);
         X2 : IN  std_logic_vector(15 downto 0);
         X3 : IN  std_logic_vector(15 downto 0);
         X4 : IN  std_logic_vector(15 downto 0);
         Z1 : IN  std_logic_vector(15 downto 0);
         Z2 : IN  std_logic_vector(15 downto 0);
         Z3 : IN  std_logic_vector(15 downto 0);
         Z4 : IN  std_logic_vector(15 downto 0);
         Z5 : IN  std_logic_vector(15 downto 0);
         Z6 : IN  std_logic_vector(15 downto 0);
         Y1 : OUT  std_logic_vector(15 downto 0);
         Y2 : OUT  std_logic_vector(15 downto 0);
         Y3 : OUT  std_logic_vector(15 downto 0);
         Y4 : OUT  std_logic_vector(15 downto 0)
        );
END COMPONENT;
    
COMPONENT reg
    PORT(
         D : IN  std_logic_vector(15 downto 0);
         Clock : IN  std_logic;
         Enable : IN  std_logic;
         Q : OUT  std_logic_vector(15 downto 0)
        );		  
END COMPONENT;
		  
COMPONENT trafo
    PORT(
         X1 : IN  std_logic_vector(15 downto 0);
         X2 : IN  std_logic_vector(15 downto 0);
         X3 : IN  std_logic_vector(15 downto 0);
         X4 : IN  std_logic_vector(15 downto 0);
         Z1 : IN  std_logic_vector(15 downto 0);
         Z2 : IN  std_logic_vector(15 downto 0);
         Z3 : IN  std_logic_vector(15 downto 0);
         Z4 : IN  std_logic_vector(15 downto 0);
         Y1 : OUT  std_logic_vector(15 downto 0);
         Y2 : OUT  std_logic_vector(15 downto 0);
         Y3 : OUT  std_logic_vector(15 downto 0);
         Y4 : OUT  std_logic_vector(15 downto 0)
        );
END COMPONENT;		  

    
signal Enable,S : STD_LOGIC;
signal RoundR : STD_LOGIC_VECTOR(3 DOWNTO 0);
signal Z1,Z2,Z3,Z4,Z5,Z6,Q1,Q2,Q3,Q4,OUTPUT1,OUTPUT2,OUTPUT3,OUTPUT4,YY1,YY2,YY3,YY4 : STD_LOGIC_VECTOR(15 DOWNTO 0);
begin
control1: control port map(Start,Clock,Enable,Ready,S,RoundR);

kengen1 : keygen port map(Z0,RoundR,Z1,Z2,Z3,Z4,Z5,Z6);

multiplexer1: TTOmultiplexer port map(S,X1,Q1,OUTPUT1);
multiplexer2: TTOmultiplexer port map(S,X2,Q2,OUTPUT2);
multiplexer3: TTOmultiplexer port map(S,X3,Q3,OUTPUT3);
multiplexer4: TTOmultiplexer port map(S,X4,Q4,OUTPUT4);

round1: round port map(OUTPUT1,OUTPUT2,OUTPUT3,OUTPUT4,Z1,Z2,Z3,Z4,Z5,Z6,YY1,YY2,YY3,YY4);

reg1: reg port map(YY1,Clock,Enable,Q1);
reg2: reg port map(YY2,Clock,Enable,Q2);
reg3: reg port map(YY3,Clock,Enable,Q3);
reg4: reg port map(YY4,Clock,Enable,Q4);

trafo1: trafo port map(Q1,Q2,Q3,Q4,Z1,Z2,Z3,Z4,Y1,Y2,Y3,Y4);

end Behavioral;