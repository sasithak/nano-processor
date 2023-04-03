----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Kalindu GAndhara
-- 
-- Create Date: 02/03/2021 03:02:30 PM
-- Design Name: 
-- Module Name: Decoder_2_to_4 - Behavioral
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

entity Decoder_2_to_4 is
    Port (
        I : in std_logic_vector (1 downto 0);
        EN : in STD_LOGIC;
        Y : out std_logic_vector (3 downto 0)
    );
end Decoder_2_to_4;

architecture Behavioral of Decoder_2_to_4 is

begin

    Y(0) <= EN AND ((NOT I(1)) AND (NOT I(0)));
    Y(1) <= EN AND ((NOT I(1)) AND (    I(0)));
    Y(2) <= EN AND ((    I(1)) AND (NOT I(0)));
    Y(3) <= EN AND ((    I(1)) AND (    I(0)));

end Behavioral;
