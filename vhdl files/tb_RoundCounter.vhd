--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:28:47 01/15/2016
-- Design Name:   
-- Module Name:   /nfs/TUEIEDA/LabHDL/2015w/ga63vuf/idea/RS2/HWideaRS2/tb_RoundCounter.vhd
-- Project Name:  HWideaRS2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: RoundCounter
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_RoundCounter IS
END tb_RoundCounter;
 
ARCHITECTURE behavior OF tb_RoundCounter IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
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
    

   --Inputs
   signal Clock : std_logic := '0';
   signal Result : std_logic := '0';
   signal Start : std_logic := '0';

 	--Outputs
   signal Init : std_logic;
   signal Trafo : std_logic;
   signal Ready : std_logic;
   signal Si : std_logic;
   signal Round : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant Clock_period : time := 10 ns;
 
BEGIN
	process
		begin
		wait for Clock_period;
		Start <= '1';
		wait for Clock_period;
		Start <= '0';
		wait for Clock_period*3;
		Result <='1';
		wait for Clock_period;
		Result <='0';
		wait for Clock_period*3;
		Result <='1';
		wait for Clock_period;
		Result <='0';
		wait for Clock_period*3;
		Result <='1';
		wait for Clock_period;
		Result <='0';
		wait for Clock_period*3;
		Result <='1';
		wait for Clock_period;
		Result <='0';
		wait for Clock_period*3;
		Result <='1';
		wait for Clock_period;
		Result <='0';
		wait for Clock_period*3;
		Result <='1';
		wait for Clock_period;
		Result <='0';
		wait for Clock_period*3;
		Result <='1';
		wait for Clock_period;
		Result <='0';
		wait for Clock_period*3;
		Result <='1';
		wait for Clock_period;
		Result <='0';
		wait for Clock_period*3;
		Result <='1';
		wait for Clock_period;
		Result <='0';
		wait for Clock_period*100;
	end process;
	-- Instantiate the Unit Under Test (UUT)
   uut: RoundCounter PORT MAP (
          Clock => Clock,
          Result => Result,
          Start => Start,
          Init => Init,
          Trafo => Trafo,
          Ready => Ready,
          Si => Si,
          Round => Round
        );

   -- Clock process definitions
   Clock_process :process
   begin
		Clock <= '0';
		wait for Clock_period/2;
		Clock <= '1';
		wait for Clock_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for Clock_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
