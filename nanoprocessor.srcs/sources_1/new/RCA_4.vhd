----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Kalindu Gandhara
-- 
-- Create Date: 01/27/2021 02:10:12 PM
-- Design Name: 
-- Module Name: RCA_4 - Behavioral
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

entity RCA_4 is
    Port ( 
        A     :  in std_logic_vector (3 DOWNTO 0);
        B     :  in std_logic_vector (3 DOWNTO 0);
        S     : out std_logic_vector (3 DOWNTO 0);
        C_in  :  in std_logic;
        C_out : out std_logic
    );
end RCA_4;

architecture Behavioral of RCA_4 is

    component FA  
        port (  
            A     :  in std_logic;  
            B     :  in std_logic;
            C_in  :  in std_logic;  
            S     : out std_logic;
            C_out : out std_logic
        );  
    end component;
    
    SIGNAL FA0_S, FA0_C, FA1_S, FA1_C, FA2_S, FA2_C, FA3_S, FA3_C 	: std_logic;
    
begin
    FA_0 : FA port map (  
        A     => A(0),  
        B     => B(0),
        C_in  => C_in, -- Set to ground
        S     => S(0),  
        C_Out => FA0_C
    ); 

    FA_1 : FA port map (  
        A     => A(1),  
        B     => B(1),
        C_in  => FA0_C,   
        S     => S(1),  
        C_Out => FA1_C
    );

    FA_2 : FA port map (  
        A     => A(2),  
        B     => B(2),
        C_in  => FA1_C,   
        S     => S(2),  
        C_Out => FA2_C
    );

    FA_3 : FA port map (  
        A     => A(3),  
        B     => B(3),
        C_in  => FA2_C,   
        S     => S(3),  
        C_Out => C_out
    );
                                
end Behavioral;