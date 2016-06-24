--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   12:19:45 01/15/2016
-- Design Name:   
-- Module Name:   /nfs/TUEIEDA/LabHDL/2015w/ga63vuf/idea/RS2/HWideaRS2/tb_ClockRound.vhd
-- Project Name:  HWideaRS2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ClockRound
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
 
ENTITY tb_ClockRound IS
END tb_ClockRound;
 
ARCHITECTURE behavior OF tb_ClockRound IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
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
    

   --Inputs
   signal Clock : std_logic := '0';
   signal Init : std_logic := '0';
   signal Trafo : std_logic := '0';
   signal X1 : std_logic_vector(15 downto 0) := X"aaaa";
   signal X2 : std_logic_vector(15 downto 0) := X"bbbb";
   signal X3 : std_logic_vector(15 downto 0) := X"cccc";
   signal X4 : std_logic_vector(15 downto 0) := X"dddd";
   signal Z1 : std_logic_vector(15 downto 0) := X"0001";
   signal Z2 : std_logic_vector(15 downto 0) := X"0002";
   signal Z3 : std_logic_vector(15 downto 0) := X"0003";
   signal Z4 : std_logic_vector(15 downto 0) := X"0004";
   signal Z5 : std_logic_vector(15 downto 0) := X"0005";
   signal Z6 : std_logic_vector(15 downto 0) := X"0006";

 	--Outputs
   signal Result : std_logic;
   signal Y1 : std_logic_vector(15 downto 0);
   signal Y2 : std_logic_vector(15 downto 0);
   signal Y3 : std_logic_vector(15 downto 0);
   signal Y4 : std_logic_vector(15 downto 0);
   signal Y1_trafo : std_logic_vector(15 downto 0);
   signal Y2_trafo : std_logic_vector(15 downto 0);
   signal Y3_trafo : std_logic_vector(15 downto 0);
   signal Y4_trafo : std_logic_vector(15 downto 0);

   -- Clock period definitions
   constant Clock_period : time := 10 ns;
 
BEGIN
 	process
	begin
		wait for Clock_period;
		Init <= '1';
		wait for Clock_period;
		Init <= '0';
		wait for Clock_period*100;
	end process;
	-- Instantiate the Unit Under Test (UUT)
   uut: ClockRound PORT MAP (
          Clock => Clock,
          Init => Init,
          Trafo => Trafo,
          X1 => X1,
          X2 => X2,
          X3 => X3,
          X4 => X4,
          Z1 => Z1,
          Z2 => Z2,
          Z3 => Z3,
          Z4 => Z4,
          Z5 => Z5,
          Z6 => Z6,
          Result => Result,
          Y1 => Y1,
          Y2 => Y2,
          Y3 => Y3,
          Y4 => Y4,
          Y1_trafo => Y1_trafo,
          Y2_trafo => Y2_trafo,
          Y3_trafo => Y3_trafo,
          Y4_trafo => Y4_trafo
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
