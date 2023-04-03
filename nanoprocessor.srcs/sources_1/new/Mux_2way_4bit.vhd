----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Thamindu Sathruwan
-- 
-- Create Date: 03/31/2021 06:59:49 PM
-- Design Name: 
-- Module Name: Mux_2way_4bit - Behavioral
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

entity Mux_2way_4bit is
    Port (
        A : in STD_LOGIC_VECTOR (3 downto 0);
        I : in STD_LOGIC_VECTOR (3 downto 0);
        S : in STD_LOGIC;
        O : out STD_LOGIC_VECTOR (3 downto 0)
    );       
end Mux_2way_4bit;

architecture Behavioral of Mux_2way_4bit is

begin
    
    O <= I when (S = '1') else A;

end Behavioral;
