----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Kalindu Gandhara
-- 
-- Create Date: 03/29/2021 09:57:35 PM
-- Design Name: 
-- Module Name: Add_SubSim - Behavioral
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


entity Add_SubSim is
--  Port ( );
end Add_SubSim;

architecture Behavioral of Add_SubSim is

    component Add_Sub is
        Port (
            A        :  in std_logic_vector (3 downto 0);
            B        :  in std_logic_vector (3 downto 0);
            S        : out std_logic_vector (3 downto 0);
            Con      :  in std_logic;
            C_out    : out std_logic;
            Overflow : out std_logic;
            Zero     : out std_logic
        );
    end component;

    signal A, B, S : std_logic_vector (3 downto 0);
    signal Con, C_Out, Overflow, Zero : std_logic;

begin

    UUT:Add_Sub port map (
        A        => A,
        B        => B,
        S        => S,
        Con      => Con,
        C_out    => C_out,
        Zero     => Zero,
        Overflow => Overflow
    );

    process begin
        Con <='0';
        A <="0000";
        B <="0000";
        wait for 100 ns; -- change again

        A <="0001";
        B <="0000";
        wait for 100 ns; --change again

        A <="0100";
        B <="0101";
        wait for 100 ns; --change again

        A <="0111";
        B <="0011";
        wait for 100 ns;

        Con <='1';
        A <="0100";
        B <="0010";
        wait for 100 ns; -- change again

        A <="0111";
        B <="0011";
        wait for 100 ns; --change again

        A <="0001";
        B <="0100";
        wait for 100 ns; --change again

        A <="0110";
        B <="0110";
        WAIT; -- will wait forever
    end process;

end Behavioral;
