----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Thamindu Sathruwan
-- 
-- Create Date: 03/30/2021 12:51:46 PM
-- Design Name: 
-- Module Name: Mux_8way_4bit - Behavioral
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

entity Mux_8way_4bit is
    Port (
        Reg0   :  in std_logic_vector (3 downto 0);
        Reg1   :  in std_logic_vector (3 downto 0);
        Reg2   :  in std_logic_vector (3 downto 0);
        Reg3   :  in std_logic_vector (3 downto 0);
        Reg4   :  in std_logic_vector (3 downto 0);
        Reg5   :  in std_logic_vector (3 downto 0);
        Reg6   :  in std_logic_vector (3 downto 0);
        Reg7   :  in std_logic_vector (3 downto 0);
        RegSel :  in std_logic_vector (2 downto 0);
        EN     :  in std_logic;
        Output : out std_logic_vector (3 downto 0)
    );
end Mux_8way_4bit;

architecture Behavioral of Mux_8way_4bit is

    component Decoder_3_to_8
        port (
            I: in std_logic_vector(2 downto 0);
            EN: in std_logic;
            Y: out std_logic_vector(7 downto 0)
        );
    end component;
    
signal YOut : std_logic_vector(7 downto 0);

begin

    Decoder_3_to_8_0 : Decoder_3_to_8 port map(
        I(2 downto 0) => Regsel(2 downto 0),
        EN => EN,
        Y(7 downto 0) => YOut(7 downto 0)
    );
            
    Output <=   Reg0 when (YOut(0)= '1') else
                    Reg1 when (YOut(1)= '1') else
                    Reg2 when (YOut(2)= '1') else
                    Reg3 when (YOut(3)= '1') else
                    Reg4 when (YOut(4)= '1') else
                    Reg5 when (YOut(5)= '1') else
                    Reg6 when (YOut(6)= '1') else
                    Reg7 ;

end Behavioral;
