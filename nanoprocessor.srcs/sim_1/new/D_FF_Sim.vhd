----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Kalindu Gandhara
-- 
-- Create Date: 02/10/2021 01:46:46 PM
-- Design Name: 
-- Module Name: D_FF_Sim - Behavioral
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

entity D_FF_Sim is
--  Port ( );
end D_FF_Sim;

architecture Behavioral of D_FF_Sim is

    component D_FF
        Port ( 
            D   :  in std_logic;
            En  :  in std_logic;
            Clk :  in std_logic;
            Res :  in std_logic;
            Q   : out std_logic
        );
    end component;

    signal D, Res, Clk, Q, En: std_logic;
    constant clock_period : time := 10ns; --100 MHz

begin
    UUT : D_FF port map (
        D   => D,
        En  => En,
        Res => Res,
        Clk => Clk,
        Q   => Q
    );

    clock_process : process begin 
        Clk <= '0';
        wait for clock_period/2;
        
        Clk <= '1';
        wait for clock_period/2;
    end process;

    sim: process begin
        En  <= '0';
        Res <= '1';
        D   <= '1';
        wait for 100ns;

        D   <= '0';
        wait for 100ns;

        Res <= '0';
        D   <= '1';
        wait for 100ns;

        D   <= '0';
        wait for 100ns;

        En  <= '1';
        Res <= '1';
        D   <= '1';
        wait for 100ns;

        D   <= '0';
        wait for 100ns;

        Res <= '0';
        D   <= '1';
        wait for 100ns;

        D   <= '0';
        wait;
    end process;

end Behavioral;
