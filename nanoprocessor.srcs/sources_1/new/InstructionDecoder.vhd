----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Sasitha Kumarasinghe
-- 
-- Create Date: 03/31/2021 12:59:22 PM
-- Design Name: 
-- Module Name: InstructionDecoder - Behavioral
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
use IEEE.std_logic_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity InstructionDecoder is 
    Port (
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
end InstructionDecoder;

architecture Behavioral of InstructionDecoder is

    signal MOVI, ADD, NEG, JZR : std_logic;  -- supported instructions
    signal opcode       : std_logic_vector(1 downto 0);
    signal RegA, Regb   : std_logic_vector(2 downto 0);
    signal operand      : std_logic_vector(3 downto 0);
    signal IsReg0       : std_logic;
    signal RegWant      : std_logic;

begin

    -- parts of the instruction
    opcode  <= Ins(11 downto 10);
    RegA    <= Ins( 9 downto  7);
    RegB    <= Ins( 6 downto  4);
    operand <= Ins( 3 downto  0);

    -- decoding the instruction
    MOVI    <= opcode(1)        AND (NOT(opcode(0)));
    ADD     <= (NOT(opcode(1))) AND (NOT(opcode(0)));
    NEG     <= (NOT(opcode(1))) AND        opcode(0);
    JZR     <= opcode(1)        AND        opcode(0);
    
    -- addition / subtraction selection
    AddSubSel   <= NEG;

    -- jump instruction
    isReg0      <= NOT (JmpChk(3) OR JmpChk(2) OR JmpChk(1) OR JmpChk(0));
    JmpFlag     <= isReg0 AND JZR;
    JmpAddrs    <= operand (2 downto 0);

    -- immediate value
    ImVal       <= operand;

    -- register to write
    RegWant     <= NOT(JZR);    -- other instructions need to write to the Register A
    RegEn       <= RegA AND (RegWant, RegWant, RegWant);
    LoadSel     <= MOVI;                
        -- if MOVI is set, Immediate value will be stored in the register if enabled
        -- else, result from add/sub unit will be stored in the register if enabled

    -- registers to read
    RegSelA     <= RegA;
    RegSelB     <= RegB;

end Behavioral;
