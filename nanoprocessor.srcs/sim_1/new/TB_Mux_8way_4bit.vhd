----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Thamindu Sathruwan
-- 
-- Create Date: 03/31/2021 03:06:55 PM
-- Design Name: 
-- Module Name: TB_Mux_8way_4bit - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity TB_Mux_8way_4bit is
--  Port ( );
end TB_Mux_8way_4bit;

architecture Behavioral of TB_Mux_8way_4bit is

    component Mux_8way_4bit
        port(
            RegSel :  in std_logic_vector (2 downto 0);
            Reg0   :  in std_logic_vector (3 downto 0);
            Reg1   :  in std_logic_vector (3 downto 0);
            Reg2   :  in std_logic_vector (3 downto 0);
            Reg3   :  in std_logic_vector (3 downto 0);
            Reg4   :  in std_logic_vector (3 downto 0);
            Reg5   :  in std_logic_vector (3 downto 0);
            Reg6   :  in std_logic_vector (3 downto 0);
            Reg7   :  in std_logic_vector (3 downto 0);
            Output : out std_logic_vector (3 downto 0);
            EN     :  in std_logic
            );
    end component;

    signal RegSel : std_logic_vector(2 downto 0);
    signal Reg0   : std_logic_vector(3 downto 0);
    signal Reg1   : std_logic_vector(3 downto 0);
    signal Reg2   : std_logic_vector(3 downto 0);
    signal Reg3   : std_logic_vector(3 downto 0);
    signal Reg4   : std_logic_vector(3 downto 0);
    signal Reg5   : std_logic_vector(3 downto 0);
    signal Reg6   : std_logic_vector(3 downto 0);
    signal Reg7   : std_logic_vector(3 downto 0);
    signal Output : std_logic_vector(3 downto 0);
    signal EN     : std_logic;

begin

    UUT: Mux_8way_4bit port map (
        RegSel => RegSel,
        Reg0   => Reg0,
        Reg1   => Reg1,
        Reg2   => Reg2,
        Reg3   => Reg3,
        Reg4   => Reg4,
        Reg5   => Reg5,
        Reg6   => Reg6,
        Reg7   => Reg7,
        Output => Output,
        EN => EN
    );

    process begin 
        --set initial values
        EN     <= '1';
        Reg0   <= "1111";
        Reg1   <= "1010";
        Reg2   <= "1100";
        Reg3   <= "0011";
        Reg4   <= "0101";
        Reg5   <= "1011";
        Reg6   <= "1000";
        Reg7   <= "0001";
        Regsel <= "000";
        wait for 100 ns; --after 100 ns change inputs

        Regsel <= "001";
        wait for 100 ns; --after 100 ns change inputs

        Regsel <= "010";
        wait for 100 ns; --after 100 ns change inputs

        Regsel <= "011";
        wait for 100 ns; --after 100 ns change inputs

        Regsel <= "100";
        wait for 100 ns; --after 100 ns change inputs

        Regsel <= "101";
        wait for 100 ns; --after 100 ns change inputs

        Regsel <= "110";
        wait for 100 ns; --after 100 ns change inputs

        Regsel <= "111";
        wait; --will wait forever
    end process;
    
end Behavioral;
