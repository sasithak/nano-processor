----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Kalindu Gandhara
-- 
-- Create Date: 01/27/2021 01:34:20 PM
-- Design Name: 
-- Module Name: FA - Behavioral
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

entity FA is
    Port (
        A : in std_logic;
        B : in std_logic;
        C_in : in std_logic;
        S : out std_logic;
        C_out : out std_logic
    );
end FA;

architecture Behavioral of FA is

    component HA  
        port (  
            A: in std_logic;  
            B: in std_logic;  
            S: out std_logic;
            C: out std_logic
        );  
    end component;

    signal HA0_S, HA0_C, HA1_S, HA1_C : std_logic;

begin

    HA_0 : HA port map (
        A => A,
        B => B,
        S => HA0_S,
        C => HA0_C
    ); 

    HA_1 : HA port map (
        A => HA0_S,
        B => C_in,
        S => HA1_S,
        C => HA1_C
    );
        
    S     <= HA1_S;
    C_out <= HA0_C OR HA1_C;

end Behavioral;
