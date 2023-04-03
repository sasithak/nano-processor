----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/10/2021 01:37:35 PM
-- Design Name: 
-- Module Name: D_FF - Behavioral
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

entity D_FF_A is
    Port (
        D : in STD_LOGIC;
        Res : in STD_LOGIC;
        Clk : in STD_LOGIC;
        Q : out STD_LOGIC;
        Qbar : out STD_LOGIC
    );
end D_FF_A;

architecture Behavioral of D_FF_A is

begin

    process(Clk) begin
        if (rising_edge(Clk)) then --check for rising-edge of clock pulz
            if Res = '1' then --Clear output if reset is high
                Q<= '0';
                Qbar <= '1';
            else  --Else output is same as input
                Q <= D;
                Qbar <= not D;
            end if;
        end if;
    end process;


end Behavioral;
