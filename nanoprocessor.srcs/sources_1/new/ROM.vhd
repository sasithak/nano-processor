----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Sasitha Kumarasinghe
-- 
-- Create Date: 03/31/2021 03:07:48 PM
-- Design Name: 
-- Module Name: ROM - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ROM is
    Port (
        sel : in std_logic_vector(2 downto 0);
        ins : out std_logic_vector(11 downto 0)
    );
end ROM;

architecture Behavioral of ROM is

    type rom_type is array (0 to 7) of std_logic_vector(11 downto 0);

    signal program : rom_type := (
        "100010001111",
        "101110000000",
        "100110000011",
        "001110110000",
        "000110010000",
        "110110000111",
        "110000000011",
        "110000000111"
    );

begin

    ins <= program(to_integer(unsigned(sel)));

end Behavioral;
