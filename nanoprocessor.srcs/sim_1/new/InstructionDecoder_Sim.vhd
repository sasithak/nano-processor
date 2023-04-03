----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Sasitha Kumarasinghe
-- 
-- Create Date: 03/31/2021 02:15:31 PM
-- Design Name: 
-- Module Name: InstructionDecoder_Sim - Behavioral
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

entity InstructionDecoder_Sim is
--  Port ( );
end InstructionDecoder_Sim;

architecture Behavioral of InstructionDecoder_Sim is

    component InstructionDecoder is port (
        Ins         :  in std_logic_vector (11 downto 0);
        JmpChk      :  in std_logic_vector  (3 downto 0);
        RegEn       : out std_logic_vector  (2 downto 0);
        LoadSel     : out std_logic;
        ImVal       : out std_logic_vector  (3 downto 0);
        RegSelA     : out std_logic_vector  (2 downto 0);
        RegSelB     : out std_logic_vector  (2 downto 0);
        AddSubSel   : out std_logic;
        JmpFlag     : out std_logic;
        JmpAddrs    : out std_logic_vector  (2 downto 0)
    );
    end component;

    signal Ins         : std_logic_vector (11 downto 0);
    signal JmpChk      : std_logic_vector  (3 downto 0);
    signal RegEn       : std_logic_vector  (2 downto 0);
    signal LoadSel     : std_logic;
    signal ImVal       : std_logic_vector  (3 downto 0);
    signal RegSelA     : std_logic_vector  (2 downto 0);
    signal RegSelB     : std_logic_vector  (2 downto 0);
    signal AddSubSel   : std_logic;
    signal JmpFlag     : std_logic;
    signal JmpAddrs    : std_logic_vector  (2 downto 0);

begin

    UUT : InstructionDecoder port map (
        Ins         => Ins,
        JmpChk      => JmpChk,
        RegEn       => RegEn,
        LoadSel     => LoadSel,
        ImVal       => Imval,
        RegSelA     => RegSelA,
        RegSelB     => RegSelB,
        AddSubSel   => AddSubSel,
        JmpFlag     => JmpFlag,
        JmpAddrs    => JmpAddrs
    );

    sim_process : process begin
        JmpChk <= "0000";
        Ins <= "101100000101";
        wait for 200 ns;

        Ins <= "000101000000";
        wait for 200 ns;

        Ins <= "011010000000";
        wait for 200 ns;

        Ins <= "110010000110";
        JmpChk <= "1001";
        wait for 200 ns;

        JmpChk <= "0000";
        wait;
    end process;

end Behavioral;
