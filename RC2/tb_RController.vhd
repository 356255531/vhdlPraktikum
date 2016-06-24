--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:43:30 01/13/2016
-- Design Name:   
-- Module Name:   /nfs/TUEIEDA/LabHDL/2015w/ga63vuf/idea/RS2/HWideaRS2/tb_RController.vhd
-- Project Name:  HWideaRS2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: RController
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
 
ENTITY tb_RController IS
END tb_RController;
 
ARCHITECTURE behavior OF tb_RController IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT RController
    PORT(
         Init : 			IN  std_logic;
         Clock : 			IN  std_logic;
			
         EnableR125 : 	OUT  std_logic;
         EnableR346 : 	OUT  std_logic;
         EnableR78 : 	OUT  std_logic;
         Result : 		OUT  std_logic;
         S : 				OUT  std_logic_vector(1 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Init : std_logic := '0';
   signal Clock : std_logic := '0';

 	--Outputs
   signal EnableR125 : std_logic;
   signal EnableR346 : std_logic;
   signal EnableR78 : std_logic;
   signal Result : std_logic;
   signal S : std_logic_vector(1 downto 0);

   -- Clock period definitions
   constant Clock_period : time := 10 ns;
 
BEGIN

 	process
	begin
		wait for Clock_period;
		Init <='1';		
		wait for Clock_period;
		Init <='0';		
		wait for Clock_period*100;
	end process;
	
	-- Instantiate the Unit Under Test (UUT)
   uut: RController PORT MAP (
          Init => Init,
          Clock => Clock,
          EnableR125 => EnableR125,
          EnableR346 => EnableR346,
          EnableR78 => EnableR78,
          Result => Result,
          S => S
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
