----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Kalindu Gandhara
-- 
-- Create Date: 03/31/2021 08:00:39 PM
-- Design Name: 
-- Module Name: Reg_Bank_TB - Behavioral
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

entity Reg_Bank_TB is
--  Port ( );
end Reg_Bank_TB;

architecture Behavioral of Reg_Bank_TB is

    component Reg_Bank
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
    end component;

    signal Bank_Res, Clk : std_logic;
    signal Sel : std_logic_vector (2 downto 0);
    signal  Reg_in, Reg0Out, Reg1Out : std_logic_vector (3 downto 0);
    signal Reg2Out, Reg3Out, Reg4Out : std_logic_vector (3 downto 0);
    signal Reg5Out, Reg6Out, Reg7Out : std_logic_vector (3 downto 0);
    constant clock_period : time := 10ns; --100 MHz

begin

    UTT: Reg_Bank Port map(
        Reg_in   =>Reg_in,
        Bank_Res => Bank_Res,
        Sel      => Sel,
        Clk      => Clk,
        Reg0Out  => Reg0Out,
        Reg1Out  => Reg1Out,
        Reg2Out  => Reg2Out,
        Reg3Out  => Reg3Out,
        Reg4Out  => Reg4Out,
        Reg5Out  => Reg5Out,
        Reg6Out  => Reg6Out,
        Reg7Out  => Reg7Out
    );

    clock_process : process begin 
        Clk <= '0';
            wait for clock_period/2;

        Clk <= '1';
            wait for clock_period/2;
    end process;

    sim:process begin
        Bank_Res <='1';
        wait for 100ns;

        Bank_Res <='0';
        Sel      <="001";
        Reg_in   <="0001";
        wait for 100ns;

        Sel      <="010";
        Reg_in   <="0010";
        wait for 100ns;

        Sel      <="011";
        Reg_in   <="0011";
        wait for 100ns;

        Sel      <="100";
        Reg_in   <="0100";
        wait for 100ns;

        Bank_Res <='1';
        Sel      <="101";
        Reg_in   <="0101";
        wait for 100ns;

        Sel      <="110";
        Reg_in   <="0110";
        wait for 100ns;

        Sel      <="111";
        Reg_in   <="0111";
        wait for 100ns;

        Sel      <="010";
        Reg_in   <="1110";
        wait;
    end process;
    
end Behavioral;


