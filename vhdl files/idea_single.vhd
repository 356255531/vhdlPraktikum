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

    COMPONENT RoundCounter
    PORT(
         Clock : IN  std_logic;
         Result : IN  std_logic;
         Start : IN  std_logic;
         Init : OUT  std_logic;
         Trafo : OUT  std_logic;
         Ready : OUT  std_logic;
         Si : OUT  std_logic;
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
 
    COMPONENT ClockRound
    PORT(
         Clock : IN  std_logic;
         Init : IN  std_logic;
         Trafo : IN  std_logic;
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
         Result : OUT  std_logic;
         Y1 : OUT  std_logic_vector(15 downto 0);
         Y2 : OUT  std_logic_vector(15 downto 0);
         Y3 : OUT  std_logic_vector(15 downto 0);
         Y4 : OUT  std_logic_vector(15 downto 0);
         Y1_trafo : OUT  std_logic_vector(15 downto 0);
         Y2_trafo : OUT  std_logic_vector(15 downto 0);
         Y3_trafo : OUT  std_logic_vector(15 downto 0);
         Y4_trafo : OUT  std_logic_vector(15 downto 0)
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
			  

signal SiRC,ResultCR,InitRC,TrafoRC : STD_LOGIC;
signal RoundRC : STD_LOGIC_VECTOR(3 DOWNTO 0);
signal OutReg1,OutReg2,OutReg3,OutReg4,OutTTO1,OutTTO2,OutTTO3,OutTTO4,OutCR11,OutCR12,OutCR13,OutCR14,OutKG11,OutKG12,OutKG13,OutKG14,
			OutKG15,OutKG16
			: STD_LOGIC_VECTOR(15 DOWNTO 0);
begin

TTOmultiplexer1: TTOmultiplexer port map(SiRC,OutReg1,X1,OutTTO1);
TTOmultiplexer2: TTOmultiplexer port map(SiRC,OutReg2,X2,OutTTO2);
TTOmultiplexer3: TTOmultiplexer port map(SiRC,OutReg3,X3,OutTTO3);
TTOmultiplexer4: TTOmultiplexer port map(SiRC,OutReg4,X4,OutTTO4);

reg1: reg port map(OutCR11,Clock,ResultCR,OutReg1);
reg2: reg port map(OutCR12,Clock,ResultCR,OutReg2);
reg3: reg port map(OutCR13,Clock,ResultCR,OutReg3);
reg4: reg port map(OutCR14,Clock,ResultCR,OutReg4);

ClockRound1: ClockRound port map(Clock,InitRC,TrafoRC,OutTTO1,OutTTO2 ,OutTTO3,OutTTO4,OutKG11,OutKG12,OutKG13,OutKG14,OutKG15,OutKG16,ResultCR,
											OutCR11,OutCR12,OutCR13,OutCR14,Y1,Y2,Y3,Y4);
											
KenGen1 : keygen port map(Z0,RoundRC,OutKG11,OutKG12,OutKG13,OutKG14,OutKG15,OutKG16);

RoundCounter1: RoundCounter port map(Clock,ResultCR,Start,InitRC,TrafoRC,Ready,SiRC,RoundRC);

end Behavioral;