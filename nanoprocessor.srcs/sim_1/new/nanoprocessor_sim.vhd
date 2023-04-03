----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/04/2021 05:34:00 PM
-- Design Name: 
-- Module Name: nanoprocessor_sim - Behavioral
-- Project Name: 
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

entity nanoprocessor_sim is
--  Port ( );
end nanoprocessor_sim;

architecture Behavioral of nanoprocessor_sim is

    component processor is port (
        clr      : in STD_LOGIC;
        clk      : in STD_LOGIC;
        Zero     : out STD_LOGIC;
        Overflow : out STD_LOGIC;
        s_seg    : out STD_LOGIC_VECTOR (6 downto 0);
        s_led    : out STD_LOGIC_VECTOR (3 downto 0)
    );
    end component;

    signal clr, clk, Zero, Overflow : std_logic;
    signal s_seg : std_logic_vector (6 downto 0);
    signal s_led : std_logic_vector (3 downto 0);
    constant clock_period : time := 10ns; --100 MHz

begin

    UUT : processor port map (
        clr      => clr,
        clk      => clk,
        Zero     => Zero,
        Overflow => Overflow,
        s_seg    => s_seg,
        s_led    => s_led
    );

    clock_process : process begin 
        Clk <= '0';
        wait for clock_period/2;
        
        Clk <= '1';
        wait for clock_period/2;
    end process;

    simulation : process begin
        clr <= '0';
        wait for 100 ns;

        clr <= '1';
        wait for 100 ns;

        clr <= '0';
        wait;
    end process;

end Behavioral;
