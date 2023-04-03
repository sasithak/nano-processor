----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Kalindu Gandhara
-- 
-- Create Date: 03/31/2021 01:52:07 PM
-- Design Name: 
-- Module Name: Reg_Bank - Behavioral
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

entity Reg_Bank is
    Port ( 
        Reg_in   :  in std_logic_vector (3 downto 0);
        Bank_Res :  in std_logic;
        Sel      :  in std_logic_vector (2 downto 0);
        Clk      :  in std_logic;
        Reg0Out  : out std_logic_vector (3 downto 0);
        Reg1Out  : out std_logic_vector (3 downto 0);
        Reg2Out  : out std_logic_vector (3 downto 0);
        Reg3Out  : out std_logic_vector (3 downto 0);
        Reg4Out  : out std_logic_vector (3 downto 0);
        Reg5Out  : out std_logic_vector (3 downto 0);
        Reg6Out  : out std_logic_vector (3 downto 0);
        Reg7Out  : out std_logic_vector (3 downto 0)
    );
end Reg_Bank;

architecture Behavioral of Reg_Bank is

    component Reg is
        Port (
            D   :  in std_logic_vector (3 downto 0);
            En  :  in STD_LOGIC;
            Clk :  in STD_LOGIC;
            Res :  in std_logic;
            Q   : out std_logic_vector (3 downto 0)
        );
    end component;

    component Decoder_3_to_8 is
        Port ( 
            I  : in std_logic_vector (2 downto 0);
            EN : in STD_LOGIC;
            Y  : out std_logic_vector (7 downto 0)
        );
    end component;

    signal Active  : std_logic;
    signal Reg_Sel : std_logic_vector (7 downto 0);

begin

    Active <= '1';

    Decoder : Decoder_3_to_8 port map (
        I  => Sel,
        EN => Active,
        Y  => Reg_Sel
    );

    Reg0 : Reg port map (
        D   => "0000",
        Q   => Reg0Out,
        Res => Bank_Res,
        En  => Reg_Sel(0),
        Clk => Clk
    );

    Reg1 : Reg port map (
        D   => Reg_in,
        Q   => Reg1Out,
        Res => Bank_Res,
        En  => Reg_Sel(1),
        Clk => Clk
    );

    Reg2 : Reg port map (
        D   => Reg_in,
        Q   => Reg2Out,
        Res => Bank_Res,
        En  => Reg_Sel(2),
        Clk => Clk
    );

    Reg3 : Reg port map (
        D   => Reg_in,
        Q   => Reg3Out,
        Res => Bank_Res,
        En  => Reg_Sel(3),
        Clk => Clk
    );

    Reg4 : Reg port map (
        D   => Reg_in,
        Q   => Reg4Out,
        Res => Bank_Res,
        En  => Reg_Sel(4),
        Clk => Clk
    );

    Reg5 : Reg port map (
        D   => Reg_in,
        Q   => Reg5Out,
        Res => Bank_Res,
        En  => Reg_Sel(5),
        Clk => Clk
    );

    Reg6 : Reg port map (
        D   => Reg_in,
        Q   => Reg6Out,
        Res => Bank_Res,
        En  => Reg_Sel(6),
        Clk => Clk
    );

    Reg7 : Reg port map (
        D   => Reg_in,
        Q   => Reg7Out,
        Res => Bank_Res,
        En  => Reg_Sel(7),
        Clk => Clk
    );

    end Behavioral;
