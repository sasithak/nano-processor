----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Kalindu Gandhara
-- 
-- Create Date: 02/17/2021 10:54:20 AM
-- Design Name: 
-- Module Name: Reg - Behavioral
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


entity Reg is
    Port (
        D   :  in std_logic_vector (3 downto 0);
        En  :  in std_logic;
        Clk :  in std_logic;
        Res :  in std_logic;
        Q   : out std_logic_vector (3 downto 0)
        );
end Reg;

architecture Behavioral of Reg is

Component D_FF 
    Port (
        D    : in std_logic;
        En   : in std_logic;
        Clk  : in std_logic;
        Res  : in std_logic; 
        Q    : out std_logic
    );
end component;

begin

    D_FF0 : D_FF port map (
        D   => D(0),
        En  => En,
        Clk => Clk,
        Res => Res,
        Q   => Q(0)
    );

    D_FF1 : D_FF port map(
        D   => D(1),
        En  => En,
        Clk => Clk,
        Res => Res,
        Q   => Q(1)
    );

    D_FF2 : D_FF port map(
        D   => D(2),
        En  => En,
        Clk => Clk,
        Res => Res,
        Q   => Q(2)
    );

    D_FF3 : D_FF port map(
        D   => D(3),
        En => En,
        Clk => Clk,
        Res => Res,
        Q   => Q(3)
    );

end Behavioral;
