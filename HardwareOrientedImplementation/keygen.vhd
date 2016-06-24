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
				Z1,Z2, Z3, Z4, Z5, Z6, Z91, Z92, Z93, Z94 : out  STD_LOGIC_VECTOR(15 downto 0) := (others => '0')
			  );
end keygen;

architecture Behavioral of keygen is
		
begin
	process(Z0,Round)
		type ZArray is array (7 downto 0) of std_logic_vector(95 downto 0);
		variable n,c : integer :=0;
		variable Z : ZArray;
		variable ZZ : STD_LOGIC_VECTOR(63 downto 0) := (others=>'0');	
	begin
		if (Z0'EVENT)
		then
			n:=127; c:=0;						
			for i in 7 downto 0 loop
				for j in 95 downto 0 loop
					if (c=128) then n:=n-25; c:=0; end if;
					if (n<0) then n:=n+128; end if;
					Z(i)(j) := Z0(n);
					n:=n-1; 
					c:=c+1;
				end loop;
			end loop;
			for j in 63 downto 0 loop
					if (c=128) then n:=n-25; c:=0;end if;
					if (n<0) then n:=n+128; end if;
					ZZ(j) := Z0(n);
					n:=n-1; 
					c:=c+1;
			end loop;
		end if;

		case Round is
			when "0000" => Z1 <= Z(7)(95 DOWNTO 80);Z2 <= Z(7)(79 DOWNTO 64);Z3 <= Z(7)(63 DOWNTO 48);Z4 <= Z(7)(47 DOWNTO 32);
								Z5 <= Z(7)(31 DOWNTO 16);Z6 <= Z(7)(15 DOWNTO 0);
			when "0001" => Z1 <= Z(6)(95 DOWNTO 80);Z2 <= Z(6)(79 DOWNTO 64);Z3 <= Z(6)(63 DOWNTO 48);Z4 <= Z(6)(47 DOWNTO 32);
								Z5 <= Z(6)(31 DOWNTO 16);Z6 <= Z(6)(15 DOWNTO 0);
			when "0010" => Z1 <= Z(5)(95 DOWNTO 80);Z2 <= Z(5)(79 DOWNTO 64);Z3 <= Z(5)(63 DOWNTO 48);Z4 <= Z(5)(47 DOWNTO 32);
								Z5 <= Z(5)(31 DOWNTO 16);Z6 <= Z(5)(15 DOWNTO 0);
			when "0011" => Z1 <= Z(4)(95 DOWNTO 80);Z2 <= Z(4)(79 DOWNTO 64);Z3 <= Z(4)(63 DOWNTO 48);Z4 <= Z(4)(47 DOWNTO 32);
								Z5 <= Z(4)(31 DOWNTO 16);Z6 <= Z(4)(15 DOWNTO 0);
			when "0100" => Z1 <= Z(3)(95 DOWNTO 80);Z2 <= Z(3)(79 DOWNTO 64);Z3 <= Z(3)(63 DOWNTO 48);Z4 <= Z(3)(47 DOWNTO 32);
								Z5 <= Z(3)(31 DOWNTO 16);Z6 <= Z(3)(15 DOWNTO 0);
			when "0101" => Z1 <= Z(2)(95 DOWNTO 80);Z2 <= Z(2)(79 DOWNTO 64);Z3 <= Z(2)(63 DOWNTO 48);Z4 <= Z(2)(47 DOWNTO 32);
								Z5 <= Z(2)(31 DOWNTO 16);Z6 <= Z(2)(15 DOWNTO 0);
			when "0110" => Z1 <= Z(1)(95 DOWNTO 80);Z2 <= Z(1)(79 DOWNTO 64);Z3 <= Z(1)(63 DOWNTO 48);Z4 <= Z(1)(47 DOWNTO 32);
								Z5 <= Z(1)(31 DOWNTO 16);Z6 <= Z(1)(15 DOWNTO 0);
			when "0111" => Z1 <= Z(0)(95 DOWNTO 80);Z2 <= Z(0)(79 DOWNTO 64);Z3 <= Z(0)(63 DOWNTO 48);Z4 <= Z(0)(47 DOWNTO 32);
								Z5 <= Z(0)(31 DOWNTO 16);Z6 <= Z(0)(15 DOWNTO 0);
			when "1000" => Z91 <= ZZ(63 DOWNTO 48);Z92 <= ZZ(47 DOWNTO 32);Z93 <= ZZ(31 DOWNTO 16);Z94 <= ZZ(15 DOWNTO 0);			
		end case;			
	end process;
end Behavioral;
