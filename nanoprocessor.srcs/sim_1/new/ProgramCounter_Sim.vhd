----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Thamindu Sathruwan
-- 
-- Create Date: 04/05/2021 01:54:07 PM
-- Design Name: 
-- Module Name: ProgramCounter_Sim - Behavioral
-- Project Name: nano processor
-- Target Devices: 
-- Tool Versions: 
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
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ProgramCounter_Sim is
--  Port ( );
end ProgramCounter_Sim;

architecture Behavioral of ProgramCounter_Sim is
    component ProgramCounter port(
        NextIns	    :  in	std_logic_vector (2 DOWNTO 0); 
        Reset	    :  in	std_logic; 
        Clk	        :  in	std_logic;
        CurrentIns	: out	std_logic_vector (2 DOWNTO 0));
    end component;
    
    signal NextIns	:	std_logic_vector (2 DOWNTO 0);
    signal Reset, Clk : std_logic;
    signal CurrentIns    :   std_logic_vector (2 DOWNTO 0);
    constant clock_period : time := 10ns;
    
begin

    UUT: ProgramCounter port map(
        CurrentIns(2 downto 0) => CurrentIns(2 downto 0), 
        NextIns(2 downto 0)    => NextIns(2 downto 0), 
        Reset                  => Reset, 
        Clk                    => Clk
    );

    clock_process: process begin
        Clk <= '0';
        wait for clock_period/2;
        
        Clk <= '1';
        wait for clock_period/2;
    end process;
    
    sim: process begin
        NextIns <= "001";
        Reset   <= '1';
        wait for 100 ns;

        Reset   <= '0';
        wait for 100 ns;

        NextIns <= "010";  
        wait for 100 ns;

        NextIns <= "011";    
        wait for 100 ns;

        NextIns <= "100";
        wait for 100 ns;

        NextIns <= "101";
        wait for 100 ns;

        NextIns <= "110";
        wait for 100 ns;

        NextIns <= "111";
        wait;
    end process;
    
end Behavioral;
