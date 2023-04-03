----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Sasitha Kumarasinghe
-- 
-- Create Date: 03/31/2021 06:19:08 PM
-- Design Name: 
-- Module Name: ROM_Sim - Behavioral
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

entity ROM_Sim is
--  Port ( );
end ROM_Sim;

architecture Behavioral of ROM_Sim is

    component ROM is port (
        sel : in std_logic_vector(2 downto 0);
        ins : out std_logic_vector(11 downto 0)
    );
    end component;

    signal sel : std_logic_vector(2 downto 0);
    signal ins : std_logic_vector(11 downto 0);

begin

    UUT : ROM port map (
        sel => sel,
        ins => ins
    );

    simulation : process begin
        sel <= "000";
        wait for 200 ns;

        sel <= "010";
        wait for 200 ns;

        sel <= "011";
        wait for 200 ns;

        sel <= "101";
        wait for 200 ns;

        sel <= "111";
        wait;
    end process;

end Behavioral;
