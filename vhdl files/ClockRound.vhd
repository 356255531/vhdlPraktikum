----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:57:05 01/14/2016 
-- Design Name: 
-- Module Name:    ClockRound - Behavioral 
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

entity ClockRound is
    Port ( 
				Clock: in STD_LOGIC;
				Init: in STD_LOGIC;
				Trafo: in STD_LOGIC;
				
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
				
				Result: out STD_LOGIC;

				Y1 : out  STD_LOGIC_VECTOR(15 DOWNTO 0);
				Y2 : out  STD_LOGIC_VECTOR(15 DOWNTO 0);
				Y3 : out  STD_LOGIC_VECTOR(15 DOWNTO 0);
				Y4 : out  STD_LOGIC_VECTOR(15 DOWNTO 0);
				
				Y1_trafo : out  STD_LOGIC_VECTOR(15 DOWNTO 0);
				Y2_trafo : out  STD_LOGIC_VECTOR(15 DOWNTO 0);
				Y3_trafo : out  STD_LOGIC_VECTOR(15 DOWNTO 0);
				Y4_trafo : out  STD_LOGIC_VECTOR(15 DOWNTO 0)
			);
end ClockRound;

architecture Behavioral of ClockRound is
    COMPONENT Datapath
    PORT(
         Clock : IN  std_logic;
         S : IN  std_logic_vector(1 downto 0);
         ST : IN  std_logic_vector(1 downto 0);

			
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
			
         EnableR125 : IN  std_logic;
         EnableR346 : IN  std_logic;
         EnableR78 : IN  std_logic;
         
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

    COMPONENT RController
    PORT(
         Init : 			IN  std_logic;
         Clock : 			IN  std_logic;
			Trafo :			IN  std_logic;
			
         EnableR125 : 	OUT  std_logic;
         EnableR346 : 	OUT  std_logic;
         EnableR78 : 	OUT  std_logic;
			
         Result : 		OUT  std_logic;
         S : 				OUT  std_logic_vector(1 downto 0);
         St : 				OUT  std_logic_vector(1 downto 0)

        );
    END COMPONENT;
    
signal SRController,StRController: STD_LOGIC_VECTOR(1 DOWNTO 0);
signal EnableR125RController,EnableR346RController,EnableR78RController: STD_LOGIC;

begin
Datapath1: Datapath port map(Clock,SRController,StRController,X1,X2,X3,X4,Z1,Z2,Z3,Z4,Z5,Z6,EnableR125RController,EnableR346RController,EnableR78RController,Y1,Y2,Y3,Y4,Y1_trafo,Y2_trafo,Y3_trafo,Y4_trafo);
RController1: RController port map(Init,Clock,Trafo,EnableR125RController,EnableR346RController,EnableR78RController,Result,SRcontroller,StRController);
end Behavioral;

