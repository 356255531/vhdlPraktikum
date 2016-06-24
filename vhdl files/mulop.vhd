----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:58:18 10/28/2015 
-- Design Name: 
-- Module Name:    mulop - Behavioral 
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

entity mulop is
		Port ( 	A,B : in  std_logic_vector (15 downto 0);
					O : out  std_logic_vector (15 downto 0) := (others => '0')
					);
end mulop;

architecture Behavioral of mulop is
begin
	process(A,B)
		variable AA,BB: std_logic_vector (16 downto 0):= (others =>'0');
		variable ModValue,DivValue,Result: std_logic_vector (16 downto 0):= (others =>'0');
		variable Multi : std_logic_vector (33 downto 0) := (others =>'0');
		constant K : integer:= 65536;
	begin
		if (A=0) then AA:='1'&X"0000"; else AA:='0'&A; end if;
		if (B=0) then BB:='1'&X"0000"; else BB:='0'&B; end if;
		Multi:= AA*BB;
		DivValue := Multi(32 downto 16);
		ModValue := '0'&Multi(15 downto 0);
		if (ModValue>=DivValue) then 
				Result:=ModValue-DivValue; 
		else Result:= ModValue-DivValue+K+1; 
		end if;
		O<=Result(15 downto 0);
	end process;
end Behavioral;