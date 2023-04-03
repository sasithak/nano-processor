----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Sasitha Kumarasinghe
-- 
-- Create Date: 04/05/2021 09:55:49 AM
-- Design Name: 
-- Module Name: RCA3_sim - Behavioral
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

entity RCA3_sim is
--  Port ( );
end RCA3_sim;

architecture Behavioral of RCA3_sim is

    component RCA_3 is port (
        A     :  in std_logic_vector (2 downto 0);
        B     :  in std_logic_vector (2 downto 0);
        C_in  :  in std_logic;
        S     : out std_logic_vector (2 downto 0);
        C_out : out std_logic;
        Z     : out std_logic
    );
    end component;

    signal A, B, S        : std_logic_vector (2 downto 0);
    signal C_in, C_out, Z : std_logic;

begin

    UUT : RCA_3 port map (
        A     => A,
        B     => B,
        C_in  => C_in,
        S     => S,
        C_out => C_out,
        Z     => Z
    );

    simulation : process begin
        C_in <= '0';
        A    <="000";
        B    <="000";
        wait for 100 ns; -- change again

        A <="001";
        B <="000";
        wait for 100 ns; --change again

        A <="100";
        B <="101";
        wait for 100 ns; --change again

        A <="111";
        B <="011";
        wait for 100 ns;

        A <="100";
        B <="010";
        wait for 100 ns; -- change again

        A <="111";
        B <="011";
        wait for 100 ns; --change again

        A <="001";
        B <="100";
        wait for 100 ns; --change again

        A <="110";
        B <="110";
        wait; -- will wait forever
    end process;

end Behavioral;
