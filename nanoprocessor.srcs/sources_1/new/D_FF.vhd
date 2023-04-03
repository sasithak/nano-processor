----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Kalindu Gandhara
-- 
-- Create Date: 03/31/2021 12:36:38 PM
-- Design Name: 
-- Module Name: D_FF - Behavioral
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


entity D_FF is
    Port (
        D : in std_logic;
        En : in std_logic;
        Clk : in std_logic;
        Res : in std_logic;
        Q : out std_logic
    );
end D_FF;

architecture Behavioral of D_FF is

    signal D_sig,Q_sig: std_logic;

begin

    process (Clk) begin
        if (rising_edge (Clk)) then 
            if Res ='1' then
                Q_sig <= '0';
            else 
                Q_sig <= D_sig;
            end if;
        end if;
    end process;

    D_sig <= (D and En) or (Q_sig and (not En));
    Q     <= Q_sig;

end Behavioral;
