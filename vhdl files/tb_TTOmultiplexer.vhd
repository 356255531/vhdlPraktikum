--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   20:24:36 11/23/2015
-- Design Name:   
-- Module Name:   /nfs/TUEIEDA/LabHDL/2015w/ga63vuf/idea/idea/HardwareOrientedImplementation/HardwareorientedImplementation/tb_TTOmultiplexer.vhd
-- Project Name:  HardwareorientedImplementation
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: TTOmultiplexer
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
 
ENTITY tb_TTOmultiplexer IS
END tb_TTOmultiplexer;
 
ARCHITECTURE behavior OF tb_TTOmultiplexer IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT TTOmultiplexer
    PORT(
         S : IN  std_logic;
         Input1 : IN  std_logic_vector(15 downto 0);
         Input2 : IN  std_logic_vector(15 downto 0);
         Output : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal S : std_logic := '1';
   signal Input1 : std_logic_vector(15 downto 0) := (others => '0');
   signal Input2 : std_logic_vector(15 downto 0) := (others => '1');

 	--Outputs
   signal Output : std_logic_vector(15 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
--   constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: TTOmultiplexer PORT MAP (
          S => S,
          Input1 => Input1,
          Input2 => Input2,
          Output => Output
        );
	
   -- Clock process definitions
--   <clock>_process :process
--   begin
--		<clock> <= '0';
--		wait for <clock>_period/2;
--		<clock> <= '1';
--		wait for <clock>_period/2;
--   end process;
-- 
--
--   -- Stimulus process
--   stim_proc: process
--   begin		
--      -- hold reset state for 100 ns.
--      wait for 100 ns;	
--
--      wait for <clock>_period*10;
--
--      -- insert stimulus here 
--
--      wait;
--   end process;

END;
