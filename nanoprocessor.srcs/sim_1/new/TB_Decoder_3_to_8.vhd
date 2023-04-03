----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Kalindu Gandhara
-- 
-- Create Date: 02/03/2021 03:10:14 PM
-- Design Name: 
-- Module Name: TB_Decoder_3_to_8 - Behavioral
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

entity TB_Decoder_3_to_8 is
--  Port ( );
end TB_Decoder_3_to_8;

architecture Behavioral of TB_Decoder_3_to_8 is

    component Decoder_3_to_8
        port (
            I : in std_logic_vector (2 downto 0);
            EN : in std_logic;
            Y : out std_logic_vector (7 downto 0)
        );
    end component;

    signal I : std_logic_vector (2 downto 0);
    signal EN : std_logic;
    signal Y : std_logic_vector (7 downto 0);

begin

    UTT : Decoder_3_to_8 PORT MAP(
        I  => I,
        EN => EN,
        Y  => Y
    );

    process begin
        EN <='1';
        I  <= "000"; 
        wait for 100 ns; -- change again
        
        I  <= "001";
        wait for 100 ns; --change again
        
        I  <= "010";
        wait for 100 ns; --change again
        
        I  <= "011";
        wait for 100 ns;
        
        I  <= "100"; 
        wait for 100 ns;
        
        I  <= "101"; 
        wait for 100 ns;
        
        I  <= "110"; 
        wait for 100 ns;
        
        I  <= "111"; 
        wait; -- will wait forever
    end process;

end Behavioral;
-- 190453A
--101 110 011 111 110 101
