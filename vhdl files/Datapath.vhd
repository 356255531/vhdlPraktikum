----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:30:48 01/13/2016 
-- Design Name: 
-- Module Name:    Datapath - Behavioral 
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

entity Datapath is
    Port ( 
				Clock: in STD_LOGIC;
				S: in  STD_LOGIC_VECTOR(1 DOWNTO 0);
				St: in  STD_LOGIC_VECTOR(1 DOWNTO 0);
				
				X1 : in  STD_LOGIC_VECTOR(15 DOWNTO 0);
				X2 : in  STD_LOGIC_VECTOR(15 DOWNTO 0);
				X3 : in  STD_LOGIC_VECTOR(15 DOWNTO 0);
				X4 : in  STD_LOGIC_VECTOR(15 DOWNTO 0);
				
				Z1 : in  STD_LOGIC_VECTOR(15 DOWNTO 0);
				Z2 : in  STD_LOGIC_VECTOR(15 DOWNTO 0);
				Z3 : in  STD_LOGIC_VECTOR(15 DOWNTO 0);
				Z4 : in  STD_LOGIC_VECTOR(15 DOWNTO 0);
				Z5 : in  STD_LOGIC_VECTOR(15 DOWNTO 0);
				Z6 : in  STD_LOGIC_VECTOR(15 DOWNTO 0);
				
				EnableR125:	in STD_LOGIC;
				EnableR346: in STD_LOGIC;
				EnableR78: in STD_LOGIC;
				
				Y1 : out  STD_LOGIC_VECTOR(15 DOWNTO 0);
				Y2 : out  STD_LOGIC_VECTOR(15 DOWNTO 0);
				Y3 : out  STD_LOGIC_VECTOR(15 DOWNTO 0);
				Y4 : out  STD_LOGIC_VECTOR(15 DOWNTO 0);
				
				Y1_trafo: out STD_LOGIC_VECTOR(15 DOWNTO 0);
				Y2_trafo: out STD_LOGIC_VECTOR(15 DOWNTO 0);
				Y3_trafo: out STD_LOGIC_VECTOR(15 DOWNTO 0);
				Y4_trafo: out STD_LOGIC_VECTOR(15 DOWNTO 0)
			  );
end Datapath;

architecture Behavioral of Datapath is

component addop
	Port ( 	A : in  STD_LOGIC_VECTOR(15 downto 0);
				B : in  STD_LOGIC_VECTOR(15 downto 0);
				O : out  STD_LOGIC_VECTOR(15 downto 0)
				);
end component;

component mulop
	Port ( 	
				A,B : in  std_logic_vector (15 downto 0);
				O : out  std_logic_vector (15 downto 0));
end component;

component xorop
    Port ( A,B : in  std_logic_vector (15 downto 0);
           O : out  std_logic_vector (15 downto 0));
end component;

COMPONENT reg
	PORT(
		D : IN  std_logic_vector(15 downto 0);
		Clock : IN  std_logic;
		Enable : IN  std_logic;
		Q : OUT  std_logic_vector(15 downto 0)
		);
END COMPONENT;
signal OutReg1,OutReg2,OutReg3,OutReg4,OutReg5,OutReg6,OutReg7,OutReg8: STD_LOGIC_VECTOR(15 downto 0);
signal OutFTO1,OutFTO2,OutFTO3,OutFTO4 : STD_LOGIC_VECTOR(15 downto 0);
signal OutMulop1 : STD_LOGIC_VECTOR(15 downto 0);
signal OutAddop1 : STD_LOGIC_VECTOR(15 downto 0);
signal OutXorop1,OutXorop2,OutXorop3,OutXorop4 : STD_LOGIC_VECTOR(15 downto 0);


COMPONENT FTOmultiplexer
	PORT(
         S : IN  std_logic_vector(1 downto 0);
         Input1 : IN  std_logic_vector(15 downto 0);
         Input2 : IN  std_logic_vector(15 downto 0);
         Input3 : IN  std_logic_vector(15 downto 0);
         Input4 : IN  std_logic_vector(15 downto 0);
         Output : OUT  std_logic_vector(15 downto 0)
        );
END COMPONENT;
   

begin
Reg5: reg port map(OutXorop1,Clock,EnableR125,OutReg5);
Reg8: reg port map(OutAddop1,Clock,EnableR78,OutReg8);
FTO1: FTOmultiplexer port map(S,X1,X4,Z5,Z6,OutFTO1);
FTO2: FTOmultiplexer port map(S,Z1,Z4,OutReg5,OutReg8,OutFTO2);
Mulop1: Mulop port map(OutFTO1,OutFTO2,OutMulop1);
Reg6: reg port map(OutXorop1,Clock,EnableR346,OutReg6);
Reg7: reg port map(OutMulop1,Clock,EnableR78,OutReg7);
Xorop1: xorop port map(Outmulop1,OutAddop1,OutXorop1);
FTO3: FTOmultiplexer port map(S,X3,X2,OutReg6,OutReg7,OutFTO3);
FTO4: FTOmultiplexer port map(St,Z3,Z2,OutMulop1,OutMulop1,OutFTO4);
Addop1: addop port map(OutFTO3,OutFTO4,OutAddop1);
Reg3: reg port map(OutAddop1,Clock,EnableR346,OutReg3);
Reg2: reg port map(OutAddop1,Clock,EnableR125,OutReg2);
Reg4: reg port map(OutMulop1,Clock,EnableR346,OutReg4);
Reg1: reg port map(OutMulop1,Clock,EnableR125,OutReg1);
Xorop2: xorop port map(OutReg3,OutAddop1,Y3);
Xorop3: xorop port map(OutReg2,OutMulop1,Y2);
Xorop4: xorop port map(OutReg4,OutAddop1,Y4);
Xorop5: xorop port map(OutReg1,OutMulop1,Y1);
	Y1_trafo <= OutReg1;
	Y2_trafo <= OutReg2;
	Y3_trafo <= OutReg3;
	Y4_trafo <= OutReg4;


end Behavioral;

