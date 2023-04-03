----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Kalindu Gandhara
-- 
-- Create Date: 01/27/2021 01:08:48 PM
-- Design Name: 
-- Module Name: HA - Behavioral
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

entity HA is
    Port (
        A : in std_logic;
        B : in std_logic;
        C : out std_logic;
        S : out std_logic
    );
end HA;

architecture Behavioral of HA is

begin

    C <= A AND B;
    S <= A XOR B;

end Behavioral;
