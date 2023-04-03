----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Thamindu Sathruwan
-- 
-- Create Date: 03/31/2021 05:22:05 PM
-- Design Name: 
-- Module Name: Mux_2way_3bit - Behavioral
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

entity Mux_2way_3bit is
    Port (
        JumpValue : in STD_LOGIC_VECTOR (2 downto 0);
        AdderValue : in STD_LOGIC_VECTOR (2 downto 0);
        Flag : in STD_LOGIC;
        EN : in STD_LOGIC;
        OutValue : out STD_LOGIC_VECTOR (2 downto 0)
    );
end Mux_2way_3bit;

architecture Behavioral of Mux_2way_3bit is

begin
    
    OutValue <= JumpValue when (Flag = '1') else AdderValue;

end Behavioral;
