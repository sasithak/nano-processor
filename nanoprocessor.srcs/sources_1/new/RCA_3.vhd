----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Sasitha Kumarasinghe
-- 
-- Create Date: 03/28/2021 02:16:25 PM
-- Design Name: 
-- Module Name: RCA_3 - Behavioral
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

entity RCA_3 is
    Port (
        A     :  in std_logic_vector (2 downto 0);
        B     :  in std_logic_vector (2 downto 0);
        C_in  :  in std_logic;
        S     : out std_logic_vector (2 downto 0);
        C_out : out std_logic;
        Z     : out std_logic
    );
end RCA_3;

architecture Behavioral of RCA_3 is

    component FA is port (  
        A    :  in std_logic;  
        B    :  in std_logic;
        C_in :  in std_logic;  
        S    : out std_logic;
        C_out: out std_logic
    );  
    end component;
    
    SIGNAL FA0_S, FA0_C, FA1_S, FA1_C, FA2_S, FA2_C : std_logic;
    signal sum : std_logic_vector (2 downto 0);

begin

    FA_0 : FA port map (
        A     => A(0),
        B     => B(0),
        C_in  => '0',    -- grounding
        S     => sum(0),
        C_out => FA0_C
    );

    FA_1 : FA port map (
        A     => A(1),
        B     => B(1),
        C_in  => FA0_C,  -- carry of 0th FA
        S     => sum(1),
        C_out => FA1_C
    );

    FA_2 : FA port map (
        A     => A(2),
        B     => B(2),
        C_in  => FA1_C,  -- carry of 1st FA
        S     => sum(2),
        C_out => C_out
    );

    Z <= (not(sum(0))) and (not(sum(1))) and (not(sum(2)));
    S <= sum;

end Behavioral;
