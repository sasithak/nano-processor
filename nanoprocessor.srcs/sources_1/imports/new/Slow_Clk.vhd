----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Sastitha Kumarasinghe
-- 
-- Create Date: 02/10/2021 02:10:24 PM
-- Design Name: 
-- Module Name: Slow_Clk - Behavioral
-- Project Name: Lab 5
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

entity Slow_Clk is
    Port (
        Clk_in : in STD_LOGIC;
        Clk_out : out STD_LOGIC
    );
end Slow_Clk;

architecture Behavioral of Slow_Clk is

    signal count : integer := 1;
    signal clk_status : STD_LOGIC := '0';

begin
    -- for 100MHz input clk, this generates 1Hz clk
    process (Clk_in) begin
        if (rising_edge(Clk_in)) then
            count <= count + 1;  -- increment counter at the rising edge of the clock in
            if (count = 5) then  -- count 50M clk pulses (half clk out time)
                -- but in simulation only 5 clock pulses will be count
                clk_status <= NOT (clk_status); -- invert the clk status
                Clk_out <= clk_status;
                count <= 1; -- reset the counter to start over
            end if;
        end if;
    end process;

end Behavioral;
