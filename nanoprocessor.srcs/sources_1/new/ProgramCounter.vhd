----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Thamindu Sathruwan
-- 
-- Create Date: 03/31/2021 07:07:21 PM
-- Design Name: 
-- Module Name: ProgramCounter - Behavioral
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

entity ProgramCounter is
    Port (
        Clk        :  in std_logic;
        Reset      :  in std_logic;
        NextIns    :  in std_logic_vector (2 downto 0);
        CurrentIns : out std_logic_vector (2 downto 0)
    );
end ProgramCounter;

architecture Behavioral of ProgramCounter is

component D_FF_A
    port (
        D    :  in std_logic;
        Res  :  in std_logic;
        Clk  :  in std_logic;
        Q    : out std_logic;
        Qbar : out std_logic
    );
end component;

begin

    D_FF0 : D_FF_A port map (
        D   => NextIns(0),
        Res => Reset,
        Clk => Clk,
        Q   => CurrentIns(0)
    );

    D_FF1 : D_FF_A port map (  
        D   => NextIns(1),
        Res => Reset,
        Clk => Clk,
        Q   => CurrentIns(1)
    ); 

    D_FF2 : D_FF_A port map (
        D   => NextIns(2),
        Res => Reset,
        Clk => Clk,
        Q   => CurrentIns(2)
    );

end Behavioral;
