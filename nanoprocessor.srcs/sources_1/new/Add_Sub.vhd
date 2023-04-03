----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Kalindu Gandhara
-- 
-- Create Date: 03/29/2021 09:41:26 PM
-- Design Name: 
-- Module Name: Add_Sub - Behavioral
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

entity Add_Sub is
    Port (
        A        : in std_logic_vector (3 downto 0);
        B        : in std_logic_vector (3 downto 0);
        S        : out std_logic_vector (3 downto 0);
        Con      : in std_logic;
        C_out    : out std_logic;
        Overflow : out std_logic;
        Zero     : out std_logic
    );
end Add_Sub;

architecture Behavioral of Add_Sub is

    component RCA_4 port (
        A     :  in std_logic_vector (3 DOWNTO 0);
        B     :  in std_logic_vector (3 DOWNTO 0);
        S     : out std_logic_vector (3 DOWNTO 0);
        C_in  :  in std_logic;
        C_out : out std_logic
    );
    end component;

signal ConXORB, S_out: std_logic_vector (3 downto 0);

begin

    RCA: RCA_4 port map (
        A     => A,
        B     => ConXORB,
        S     => S_out,
        C_in  => Con,
        C_out => C_out
    );
            
    ConXORB  <= B XOR (Con ,Con ,Con ,Con);
    S        <= S_out;
    Overflow <= (A(3) XNOR (Con XOR B(3))) AND (A(3) XOR S_out(3));
    Zero     <= not (S_out(0) or S_out(1) or S_out(2) or S_out(3));

end Behavioral;
