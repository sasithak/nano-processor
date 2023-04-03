----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Kalindu Gandhara
-- 
-- Create Date: 03/31/2021 09:30:38 PM
-- Design Name: 
-- Module Name: Reg_TB - Behavioral
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

entity Reg_TB is
--  Port ( );
end Reg_TB;

architecture Behavioral of Reg_TB is
    component Reg
        Port (
            D   :  in std_logic_vector (3 downto 0);
            En  :  in std_logic;
            Clk :  in std_logic;
            Res :  in std_logic;
            Q   : out std_logic_vector (3 downto 0)
        );
    end component;

    signal D, Q           : std_logic_vector (3 downto 0);
    signal En, Clk, Res   : std_logic;
    constant clock_period : time := 10ns; --100 MHz

begin

    UTT : Reg port map(
        D   => D,
        En  => En,
        Clk => Clk,
        Res => Res,
        Q   => Q
    );

    clock_process : process begin 
        Clk <= '0';
        wait for clock_period/2;

        Clk <= '1';
        wait for clock_period/2;
    end process;

    sim : process begin
        Res <='1';
        D   <= "0101";
        wait for 100ns;

        Res <='0';
        D   <= "0101";
        wait for 100ns;

        En  <='1';
        Res <='1';
        D   <= "0101";
        wait for 100ns;

        Res <='1';
        D   <= "0101";
    end process;

end Behavioral;
